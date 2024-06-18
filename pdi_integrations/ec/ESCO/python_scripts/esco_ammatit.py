import requests  # Import the requests library for making HTTP requests
import os  # Import the os library for accessing environment variables
import pandas as pd  # Import the pandas library for data manipulation
import datetime  # Import the datetime library for working with dates and times

# Define the path to the CSV file where the data will be saved
csv_path = "d:/pdi_integrations/data/ec/ammatit.csv"
key_csv_path = "d:/pdi_integrations/data/ec/luokitusavain.csv"

# Define the ESCO API endpoint URL
endpoint_url = "https://ec.europa.eu/esco/api/search"

# Get the username from the environment variables
username = os.environ['USERNAME']

# Function to create a dictionary representing a row in the occupations dataset
def makerow_occupations():
    return {
        "koodi": None,  # Code of the occupation
        "ammatti_fi": None,  # Occupation name in Finnish
        "ammatti_sv": None,  # Occupation name in Swedish
        "ammatti_en": None,  # Occupation name in English
        "source": None,  # Source URL of the occupation
        "loadtime": datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S.%f"),  # Load time of the data
        "username": username  # Username of the person running the script
    }

def makerow_key():
    return {
        "koodi_ammatti": None,  # Code of the occupation
        "koodi_osaaminen": None, # Code of the skill
        "essential": None, # 1 = essential skill, 0 = optional skill
        "source": None,  # Source URL 
        "loadtime": datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S.%f"),  # Load time of the data
        "username": username  # Username of the person running the script
    }

# Define the initial parameters for the API request
params = {
    'type': 'occupation',  # Specify that we are searching for occupations
    'limit': 1,  # Limit the number of results to 1 for the initial request
    'offset': 0,
    'language': 'en'
}

# Define the headers for the API request
headers = {
    "Accept": "application/json"  # Accept JSON responses
}

# Initialize lists to store occupations and parent occupations
occupations = []
parent_occupations = []
key_list = []

# Make the initial request to get the total number of occupations
response = requests.get(endpoint_url, params=params, headers=headers)
data = response.json()
n_occupations = data["total"]  # Get the total number of occupations

# Initialize pagination variables
offset = 0
limit = 1000  # Number of results per page

# Loop through all occupations using pagination
while offset * limit <= n_occupations:
    
    # Update the parameters for the current page
    params = {
        'type': 'occupation',
        'limit': limit,
        'offset': offset,
        'language': 'en'
    }
    
    # Make the request for the current page
    response = requests.get(endpoint_url, params=params, headers=headers)

    # Check if the request was successful
    if response.status_code == 200:
        # Parse the response JSON
        data = response.json()
        
        # Ensure the '_embedded' key exists in the response
        if '_embedded' in data:
            results = data['_embedded']
            occupation_list = results['results']
            
            # Process each occupation in the current page
            for o in occupation_list:
                row = makerow_occupations()
                row["koodi"] = o['code']
                row["ammatti_fi"] = o['preferredLabel']['fi']
                row["ammatti_sv"] = o['preferredLabel']['sv']
                row["ammatti_en"] = o['title']
                row["source"] = o['_links']['self']['href']
                occupations.append(row)
                
                # Add parent occupation code if not already added
                if o['code'][:4] not in parent_occupations:
                    parent_occupations.append(o['code'][:4])
                
                response_key = requests.get(o['_links']['self']['href'], headers=headers)
                key_data = response_key.json()
                try:
                    for eSkill in key_data["_links"]["hasEssentialSkill"]:
                        row_key = makerow_key()
                        row_key["koodi_osaaminen"] = eSkill["uri"].split("/")[5]
                        row_key["koodi_ammatti"] = o['code']
                        row_key["essential"] = 1
                        row_key["source"] = o['_links']['self']['href']
                        key_list.append(row_key)
                except:
                    pass
                try:
                    for oSkill in key_data["_links"]["hasOptionalSkill"]:
                        row_key = makerow_key()
                        row_key["koodi_osaaminen"] = oSkill["uri"].split("/")[5]
                        row_key["koodi_ammatti"] = o['code']
                        row_key["essential"] = 0
                        row_key["source"] = o['_links']['self']['href']
                        key_list.append(row_key)
                except:
                    pass
            # Move to the next page
            offset = offset + 1
        else:
            pass #print("Unexpected response structure:", data)
    else:
        pass #print("Error:", response.status_code, response.text)

# Process each parent occupation to get additional details
for po in parent_occupations:
    uri = "https://ec.europa.eu/esco/api/resource/occupation?uri=http://data.europa.eu/esco/isco/C" + po + "&language=en"
    response2 = requests.get(uri, headers=headers)
    data2 = response2.json()
    row = makerow_occupations()
    row["koodi"] = data2['code']
    row["ammatti_fi"] = data2['preferredLabel']['fi']
    row["ammatti_sv"] = data2['preferredLabel']['sv']
    row["ammatti_en"] = data2['title']
    row["source"] = uri
    occupations.append(row)

# Create a DataFrame from the occupations list
data2 = pd.DataFrame(occupations)

# Save the DataFrame to a CSV file
data2.to_csv(
    path_or_buf=csv_path, sep='|', na_rep='', header=True, index=False,
    mode='w', encoding='utf-8', quoting=0, quotechar='"', escapechar='$',
    columns=["koodi", "ammatti_fi", "ammatti_sv", "ammatti_en", "source"]
)

# Print the number of rows exported to the CSV
row_count = data2.shape[0]
print(row_count, "rows exported to csv")

# Create a DataFrame from the key list
key_data = pd.DataFrame(key_list)

# Save the DataFrame to a CSV file
key_data.to_csv(
    path_or_buf=key_csv_path, sep='|', na_rep='', header=True, index=False,
    mode='w', encoding='utf-8', quoting=0, quotechar='"', escapechar='$',
    columns=["koodi_osaaminen", "koodi_ammatti", "essential", "source"]
)

# Print the number of rows exported to the CSV
row_count = key_data.shape[0]
print(row_count, "rows exported to csv")

import requests  # Import the requests library for making HTTP requests
import os  # Import the os library for accessing environment variables
import pandas as pd  # Import the pandas library for data manipulation
import datetime  # Import the datetime library for working with dates and times

# Define the path to the CSV file where the data will be saved
csv_path = "d:/pdi_integrations/data/ec/osaamiset.csv"

# Define the ESCO API endpoint URL
endpoint_url = "https://ec.europa.eu/esco/api/search"

# Get the username from the environment variables
username = os.environ['USERNAME']

# Function to create a dictionary representing a row in the skills dataset
def makerow_skills():
    return {
        "koodi": None,  # Code of the skill
        "parent_koodi": None,  # Parent code of the skill
        "osaaminen_fi": None,  # Skill name in Finnish
        "osaaminen_sv": None,  # Skill name in Swedish
        "osaaminen_en": None,  # Skill name in English
        "source": None,  # Source URL of the skill
        "loadtime": datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S.%f"),  # Load time of the data
        "username": username  # Username of the person running the script
    }

# Define the initial parameters for the API request
params = {
    'type': 'skill',  # Specify that we are searching for skills
    'limit': 1,  # Limit the number of results to 1 for the initial request
    'offset': 0, 
    'language': 'en' 
}

# Define the headers for the API request
headers = {
    "Accept": "application/json"  # Accept JSON responses
}

# Initialize lists to store skills and URIs
skills = []
uris = []
errors = []

# Make the initial request to get the total number of skills
response = requests.get(endpoint_url, params=params, headers=headers)
data = response.json()
n_skills = data["total"]  # Get the total number of skills

# Initialize pagination variables
offset = 0
limit = 1000  # Number of results per page

# Loop through all skills using pagination
while offset * limit <= n_skills:
    
    # Update the parameters for the current page
    params = {
        'type': 'skill',
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
            skill_list = results['results']
            
            # Process each skill in the current page
            for s in skill_list:
                row = makerow_skills()
                row["koodi"] = s["uri"].split("/")[5]  # Extract the skill code from the URI
                row["osaaminen_fi"] = s['preferredLabel']['fi']  # Skill name in Finnish
                row["osaaminen_sv"] = s['preferredLabel']['sv']  # Skill name in Swedish
                row["osaaminen_en"] = s['title']  # Skill name in English
                try:
                    row["parent_koodi"] = s['broaderHierarchyConcept'][0].split("/")[5]
                except:
                    row["parent_koodi"] = s['broaderSkill'][0].split("/")[5]
                row["source"] = s['_links']['self']['href']  # Source URL of the skill
                skills.append(row)
                
                # Add broader hierarchy concept URIs if not already added
                try:
                    if s['broaderHierarchyConcept'] not in uris:
                        uris.append(s['broaderHierarchyConcept'])
                except:
                    if s['broaderSkill'] not in uris:
                        uris.append(s['broaderSkill'])
                        
            # Move to the next page
            offset = offset + 1
        else:
            pass #rint("Unexpected response structure:", data)
    else:
        pass #print("Error:", response.status_code, response.text)

# Loop through URIs to get detailed information about each skill
while len(uris) > 0:
    newUris = []  # Initialize a new list to store the next set of URIs

    # Process each URI in the current list
    for u in uris:
        # Ensure the URI is a single string, not a list
        if type(u) is list:
            u = u[0]

        # Construct the full URL for the skill resource
        uri = "https://ec.europa.eu/esco/api/resource/skill?uri=" + u + "&language=en"
        
        # Make the request for the skill resource
        response2 = requests.get(uri, headers=headers)
        
        # Check if the request was successful
        if response2.status_code == 200:
            # Parse the response JSON
            data2 = response2.json()
            
            # Create a new row for the skill
            row = makerow_skills()
            row["koodi"] = u.split("/")[5] 
            row["osaaminen_fi"] = data2['preferredLabel']['fi']
            row["osaaminen_sv"] = data2['preferredLabel']['sv']
            row["osaaminen_en"] = data2['title']
            
            # Attempt to get the parent skill code
            try:
                row["parent_koodi"] = data2['_links']['broaderConcept'][0]['uri'].split("/")[5]
            except:
                row["parent_koodi"] = None  # If no parent skill, set to None

            row["source"] = data2['_links']['self']['href']  # Source URL of the skill
            
            # Append the row to the skills list
            skills.append(row)
            
            # Attempt to add the broader concept URI to the new URIs list if not already present
            try:
                if data2['_links']['broaderConcept'][0]['uri'] not in newUris:
                    newUris.append(data2['_links']['broaderConcept'][0]['uri'])
            except:
                pass
        else:
            # Print an error message if the request was not successful
            # print("Error:", response2.status_code, response2.text)
            print(u.split("/")[5])
            errors.append(u.split("/")[5])

    # Update the URIs list with the new set of URIs for the next iteration
    uris = newUris
  
# Add faulty skill manually
if "S1.5.3" in errors:
    uris.append(s['broaderHierarchyConcept'])
    row = makerow_skills()
    row["koodi"] = "S1.5.3"
    row["osaaminen_fi"] = "tarjota neuvoja konservointiin"
    row["osaaminen_sv"] = "ge råd om konservering"
    row["osaaminen_en"] = "advising on products and services"
    row["parent_koodi"] = "S1.5"
    row["source"] = "https://ec.europa.eu/esco/api/resource/skill?uri=http://data.europa.eu/esco/skill/S1.5.3&language=en"
    skills.append(row)

# Create a DataFrame from the skills list
data3 = pd.DataFrame(skills)

# Drop duplicate rows
data3 = data3.drop_duplicates(subset="koodi", keep='first', inplace=False, ignore_index=False)

# Save the DataFrame to a CSV file
data3.to_csv(
    path_or_buf=csv_path, sep='|', na_rep='', header=True, index=False,
    mode='w', encoding='utf-8', quoting=0, quotechar='"', escapechar='$',
    columns=["koodi", "parent_koodi", "osaaminen_fi", "osaaminen_sv", "osaaminen_en", "source"]
)

# Print the number of rows exported to the CSV
row_count = data3.shape[0]
print(row_count, "rows exported to csv")

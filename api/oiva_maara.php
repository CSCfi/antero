<?php
// Connecting, selecting database
$dbconn = pg_connect("host=localhost dbname=oiva user=oiva password=oiva")
    or die('Could not connect: ' . pg_last_error());

// Performing SQL query
$query = 'SELECT * FROM f_maara';
$result = pg_query($query) or die('Query failed: ' . pg_last_error());

// Printing results in HTML
echo "<pre>\n";
while ($line = pg_fetch_array($result, null, PGSQL_ASSOC)) {
    foreach ($line as $col_value) {
        echo "$col_value;";
    }
    echo "\n";
}
echo "</pre>\n";

// Free resultset
pg_free_result($result);

// Closing connection
pg_close($dbconn);
?>
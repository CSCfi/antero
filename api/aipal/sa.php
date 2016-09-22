<?php
$type = "csv"; // oletus
if ($_GET) {
    if (in_array("type",$_GET)) {
        $type = $_GET["type"];
    }
    if (in_array("json",$_GET)) {
        $type = "json";
    }
}

if ($type=="json") {
    header('Content-Type: application/json; charset=utf-8');
} else {
    header('Content-Type: text/plain; charset=iso-8859-1');
}

// Connecting, selecting database
$dbconn = pg_connect("host=localhost dbname=oiva user=oiva password=oiva")
    or die('Could not connect: ' . pg_last_error());

// Performing SQL query
$query = 'SELECT * FROM sa_aipal';
$result = pg_query($query) or die('Query failed: ' . pg_last_error());

// Printing results in HTML
//echo "// oiva demo f_maara ($type)<br><br>\n";
//echo "<pre>\n";
$return_arr = array();
while ($line = pg_fetch_array($result, null, PGSQL_ASSOC)) {
    if ($type == "csv" || $type == "tsv") {
        foreach ($line as $col_value) {
            echo "$col_value";
            if ($type == "csv") {
                echo ";";
            } elseif ($type == "tsv") {
                echo "\t";
            }
        }
        echo "\n";
    }
    if ($type == "json") {
        array_push($return_arr,$line);
    }
}
if ($type == "json") {
    echo json_encode($return_arr);
}
//echo "</pre>\n";

// Free resultset
pg_free_result($result);

// Closing connection
pg_close($dbconn);
?>
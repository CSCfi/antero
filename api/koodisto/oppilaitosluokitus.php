<?php
if ($_GET) {
    $type = $_GET['type'];
} else {
    $type = "csv"; // oletus
}

if ($type=="json") {
    header('Content-Type: application/json; charset=utf-8');
} elseif ($type=="tsv") {
    //header('Content-Type: text/tab-separated-values; charset=utf-8');
    header('Content-Type: text/plain; charset=iso-8859-1');
} else {
    //header('Content-Type: text/csv; charset=utf-8');
    header('Content-Type: text/plain; charset=iso-8859-1');
}

header("Access-Control-Allow-Origin: *");

$dbconn = pg_connect("host=localhost dbname=oiva user=oiva password=oiva")
    or die('Could not connect: ' . pg_last_error());

$query = 'SELECT oid,koodi,nimi,nimi_sv,nimi_en,alkupvm,loppupvm,kuntakoodi,oppilaitostyyppikoodi,jarjestajaoid,jarjestajakoodi,jarjestajanimi,jarjestajanimi_sv,jarjestajanimi_en FROM sa_oppilaitosluokitus';
$result = pg_query($query) or die('Query failed: ' . pg_last_error());

if ($type == "csv") {
    echo "oid;koodi;nimi;nimi_sv;nimi_en;alkupvm;loppupvm;kuntakoodi;oppilaitostyyppikoodi;jarjestajaoid;jarjestajakoodi;jarjestajanimi;jarjestajanimi_sv;jarjestajanimi_en;";
    echo "\n";
}
// tsv?
//json:
$return_arr = array();
while ($line = pg_fetch_array($result, null, PGSQL_ASSOC)) {
    if ($type == "csv" || $type == "tsv") {
        foreach ($line as $col_value) {
            echo utf8_decode($col_value);
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

pg_free_result($result);
pg_close($dbconn);
?>
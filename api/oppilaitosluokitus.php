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

$settings = parse_ini_file('/var/www/db-settings.ini', true);
$link = mssql_connect($settings["database"]["host"],$settings["database"]["user"],$settings["database"]["pass"]);

if(!$link){
  die('Something went wrong while connecting to MSSQL');
}
if(!mssql_select_db($settings["database"]["name"], $link)){
  die('Something went while connecting to database');
}

$query = 'SELECT oid,koodi,nimi,nimi_sv,nimi_en,alkupvm,loppupvm,
kuntakoodi,oppilaitostyyppikoodi,jarjestajaoid,jarjestajakoodi,jarjestajanimi,jarjestajanimi_sv,jarjestajanimi_en
FROM sa.sa_oppilaitosluokitus';
$result = mssql_query($query,$link) or die('Query failed: ' . mssql_get_last_message());

if ($type == "csv") {
    echo "oid;koodi;nimi;nimi_sv;nimi_en;alkupvm;loppupvm;kuntakoodi;oppilaitostyyppikoodi;jarjestajaoid;jarjestajakoodi;jarjestajanimi;jarjestajanimi_sv;jarjestajanimi_en;";
    echo "\n";
}
// tsv?
//json:
$return_arr = array();
while ($row = mssql_fetch_array($result, MSSQL_ASSOC)) {
    if ($type == "csv" || $type == "tsv") {
        foreach ($row as $col_value) {
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
        array_push($return_arr,$row);
    }
}
if ($type == "json") {
    echo json_encode($return_arr, JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE);
}

mssql_free_result($result);
mssql_close($link);
?>
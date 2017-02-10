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

$settings = parse_ini_file('/var/www/db-settings.ini', true);
$link = mssql_connect($settings["database"]["host"],$settings["database"]["user"],$settings["database"]["pass"]);

if(!$link){
  die('Something went wrong while connecting to MSSQL');
}
if(!mssql_select_db($settings["database"]["name"], $link)){
  die('Something went while connecting to database');
}

$query = 'SELECT sukupuoli_koodi, sukupuoli, sukupuoli_sv, sukupuoli_en, ika, ikaryhma10_koodi, ikaryhma10, ikaryhma10_sv, ikaryhma10_en FROM sa.sa_henkiloluokitus';
$result = mssql_query($query,$link) or die('Query failed: ' . mssql_get_last_message());

if ($type == "csv") {
    echo "sukupuoli_koodi;sukupuoli;sukupuoli_sv;sukupuoli_en;ika;ikaryhma10_koodi;ikaryhma10;ikaryhma10_sv;ikaryhma10_en;";
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

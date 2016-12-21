<?php
$koodisto = "";
if ($_GET) {
    $type = $_GET['type'];
    if(isset($_GET['koodisto'])) {
        $koodisto = $_GET['koodisto'];
    }
} else {
    $type = "csv"; // oletus
}

// listaus: if (!$koodisto) die("System error");

if ($type=="json") {
    header('Content-Type: application/json; charset=utf-8');
} elseif ($type=="tsv") {
    header('Content-Type: text/plain; charset=iso-8859-1');
} else {
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

if (!$koodisto) {
    //$query = "SELECT DISTINCT koodisto, 'http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]/'||koodisto as uri FROM sa_koodistot";
    $query = "SELECT DISTINCT koodisto";
    $query .= ", '";
    $query .= "http";
    if (isset($_SERVER["HTTPS"])) {
        if ($_SERVER["HTTPS"] == "on") {
            $query .= "s";
        }
    }
    $query .= "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
    if(!preg_match("/\/$/",$_SERVER['REQUEST_URI'])) $query .= "/";
    $query .= "'+koodisto as uri";
    $query .= " FROM SA_KOODISTOT";

    if ($type == "csv") {
        echo "koodisto;uri;";
        echo "\n";
    }
}
else {
    $query = "SELECT koodi,nimi,nimi_sv,nimi_en, alkupvm,loppupvm FROM SA_KOODISTOT WHERE koodisto='$koodisto'";

    if ($type == "csv") {
        echo "koodi;nimi;nimi_sv;nimi_en;alkupvm;loppupvm;";
        echo "\n";
    }
}

$result = mssql_query($query,$link) or die('Query failed: ' . mssql_get_last_message());

// tsv?
//json:
$return_arr = array();
while ($row = mssql_fetch_array($result, MSSQL_ASSOC)) {
    if ($type == "csv" || $type == "tsv") {
        foreach ($row as $col_value) {
            echo utf8_decode($col_value);
            //echo "\"$col_value\"";
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
    echo json_encode($return_arr, JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
}

mssql_free_result($result);
mssql_close($link);
?>

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

$dbconn = pg_connect("host=localhost dbname=oiva user=oiva password=oiva")
    or die('Could not connect: ' . pg_last_error());

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
    $query .= "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]/";
    $query .= "'||koodisto as uri";
    $query .= " FROM sa_koodistot";

    if ($type == "csv") {
        echo "koodisto;uri;";
        echo "\n";
    }
}
else {
    $query = "SELECT koodi,nimi,nimi_sv,nimi_en, alkupvm,loppupvm FROM sa_koodistot WHERE koodisto='$koodisto'";

    if ($type == "csv") {
        echo "koodi;nimi;nimi_sv;nimi_en;alkupvm;loppupvm;";
        echo "\n";
    }
}

$result = pg_query($query) or die('Query failed: ' . pg_last_error());
// tsv?
//json:
$return_arr = array();
while ($line = pg_fetch_array($result, null, PGSQL_ASSOC)) {
    if ($type == "csv" || $type == "tsv") {
        foreach ($line as $col_value) {
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
        array_push($return_arr,$line);
    }
}
if ($type == "json") {
    echo json_encode($return_arr, JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
}

pg_free_result($result);
pg_close($dbconn);
?>
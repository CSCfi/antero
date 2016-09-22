<?php
if ($_GET) {
    $type = $_GET['type'];
    $koodisto = $_GET['koodisto'];
} else {
    $type = "csv"; // oletus
}

if (!$koodisto) die("System error");

if ($type=="json") {
    header('Content-Type: application/json; charset=utf-8');
} elseif ($type=="tsv") {
//    if ($_GET && $_GET['.tsv']) {
//        header('Content-Type: text/tab-separated-values; charset=iso-8859-1');
//    } else {
        header('Content-Type: text/plain; charset=iso-8859-1');
//    }
} else {
//    if ($_GET && $_GET['.csv']) {
//        header('Content-Type: text/csv; charset=iso-8859-1');
//    } else {
        header('Content-Type: text/plain; charset=iso-8859-1');
//    }
}

header("Access-Control-Allow-Origin: *");

$dbconn = pg_connect("host=localhost dbname=oiva user=oiva password=oiva")
    or die('Could not connect: ' . pg_last_error());

$query = "SELECT koodi,nimi,nimi_sv,nimi_en, alkupvm,loppupvm FROM sa_koodistot WHERE koodisto='$koodisto'";
$result = pg_query($query) or die('Query failed: ' . pg_last_error());

if ($type == "csv") {
    echo "koodi;nimi;nimi_sv;nimi_en;alkupvm;loppupvm;";
    echo "\n";
}
// tsv?
//json:
$response_arr = array();
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
        array_push($response_arr,$line);
    }
}
if ($type == "json") {
    // http://csc-it-center-for-science.github.io/julkictlab-digipalvelutehdas-api-guidelines/responses.html
    $meta_arr = array();
    $meta_arr["resultset"] = array();
    $meta_arr["resultset"]["count"] = count($response_arr);
    $meta_arr["resultset"]["offset"] = 0;
    $meta_arr["resultset"]["limit"] = 10;
    
    $return_arr = array();
    $return_arr["metadata"] = $meta_arr;
    $return_arr["results"] = $response_arr;
    echo json_encode($return_arr);
}

pg_free_result($result);
pg_close($dbconn);
?>
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

$query = 'SELECT koodi,nimi,nimi_sv,nimi_en,alkupvm,loppupvm ,koulutusaste2002koodi,koulutusaste2002nimi,koulutusaste2002nimi_sv,koulutusaste2002nimi_en ,koulutusala2002koodi,koulutusala2002nimi,koulutusala2002nimi_sv,koulutusala2002nimi_en ,opintoala2002koodi,opintoala2002nimi,opintoala2002nimi_sv,opintoala2002nimi_en ,koulutusaste1995koodi,koulutusaste1995nimi,koulutusaste1995nimi_sv,koulutusaste1995nimi_en ,koulutusala1995koodi,koulutusala1995nimi,koulutusala1995nimi_sv,koulutusala1995nimi_en ,opintoala1995koodi,opintoala1995nimi,opintoala1995nimi_sv,opintoala1995nimi_en ,tutkintokoodi,tutkintonimi,tutkintonimi_sv,tutkintonimi_en ,tutkintotyyppikoodi,tutkintotyyppinimi,tutkintotyyppinimi_sv,tutkintotyyppinimi_en ,koulutustyyppikoodi,koulutustyyppinimi,koulutustyyppinimi_sv,koulutustyyppinimi_en ,isced2011koulutusastekoodi,isced2011koulutusastenimi,isced2011koulutusastenimi_sv,isced2011koulutusastenimi_en ,isced2011koulutusastetaso1koodi,isced2011koulutusastetaso1nimi,isced2011koulutusastetaso1nimi_sv,isced2011koulutusastetaso1nimi_en ,isced2011koulutusastetaso2koodi,isced2011koulutusastetaso2nimi,isced2011koulutusastetaso2nimi_sv,isced2011koulutusastetaso2nimi_en ,isced2011koulutusalataso1koodi,isced2011koulutusalataso1nimi,isced2011koulutusalataso1nimi_sv,isced2011koulutusalataso1nimi_en ,isced2011koulutusalataso2koodi,isced2011koulutusalataso2nimi,isced2011koulutusalataso2nimi_sv,isced2011koulutusalataso2nimi_en ,isced2011koulutusalataso3koodi,isced2011koulutusalataso3nimi,isced2011koulutusalataso3nimi_sv,isced2011koulutusalataso3nimi_en
FROM sa_koulutusluokitus';
$result = pg_query($query) or die('Query failed: ' . pg_last_error());

if ($type == "csv") {
    echo "koodi;nimi;nimi_sv;nimi_en;alkupvm;loppupvm;koulutusaste2002koodi;koulutusaste2002nimi;koulutusaste2002nimi_sv;koulutusaste2002nimi_en;koulutusala2002koodi;koulutusala2002nimi;koulutusala2002nimi_sv;koulutusala2002nimi_en;opintoala2002koodi;opintoala2002nimi;opintoala2002nimi_sv;opintoala2002nimi_en;koulutusaste1995koodi;koulutusaste1995nimi;koulutusaste1995nimi_sv;koulutusaste1995nimi_en;koulutusala1995koodi;koulutusala1995nimi;koulutusala1995nimi_sv;koulutusala1995nimi_en;opintoala1995koodi;opintoala1995nimi;opintoala1995nimi_sv;opintoala1995nimi_en;tutkintokoodi;tutkintonimi;tutkintonimi_sv;tutkintonimi_en;tutkintotyyppikoodi;tutkintotyyppinimi;tutkintotyyppinimi_sv;tutkintotyyppinimi_en;koulutustyyppikoodi;koulutustyyppinimi;koulutustyyppinimi_sv;koulutustyyppinimi_en;isced2011koulutusastekoodi;isced2011koulutusastenimi;isced2011koulutusastenimi_sv;isced2011koulutusastenimi_en;isced2011koulutusastetaso1koodi;isced2011koulutusastetaso1nimi;isced2011koulutusastetaso1nimi_sv;isced2011koulutusastetaso1nimi_en;isced2011koulutusastetaso2koodi;isced2011koulutusastetaso2nimi;isced2011koulutusastetaso2nimi_sv;isced2011koulutusastetaso2nimi_en;isced2011koulutusalataso1koodi;isced2011koulutusalataso1nimi;isced2011koulutusalataso1nimi_sv;isced2011koulutusalataso1nimi_en;isced2011koulutusalataso2koodi;isced2011koulutusalataso2nimi;isced2011koulutusalataso2nimi_sv;isced2011koulutusalataso2nimi_en;isced2011koulutusalataso3koodi;isced2011koulutusalataso3nimi;isced2011koulutusalataso3nimi_sv;isced2011koulutusalataso3nimi_en;";
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
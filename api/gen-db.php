<?php
// argumentit
$taulu = "";
$type = "csv"; // oletus
$pretty = true; //false
if ($_GET) {
    $type = $_GET['type'];
    if(isset($_GET['taulu'])) {
        $taulu = $_GET['taulu'];
    }
    //if(isset($_GET['pretty'])) {
    //    $pretty = true;
    //}
}

if ($type=="json") {
    header('Content-Type: application/json; charset=utf-8');
} elseif ($type=="tsv") {
    header('Content-Type: text/plain; charset=iso-8859-1');
} else {
    header('Content-Type: text/plain; charset=iso-8859-1');
}

header("Access-Control-Allow-Origin: *");

$db_dbname = "antero";
$db_user = "antero";
$db_password = "antero";

require "$_SERVER[DOCUMENT_ROOT]/db.php";

// hae lista (oletus kysely) tauluista ja materialisoiduista näkymistä, johon lisäksi URI
$query = "select tablename as data";
$query .= ", 'http";
if (isset($_SERVER["HTTPS"])) {
    if ($_SERVER["HTTPS"] == "on") {
        $query .= "s";
    }
}
$query .= "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]/'||tablename as uri ";

$query .= <<<EOSQL
from (
    -- normaalit taulut
    select tablename
    from pg_tables
    where schemaname='public'
    --  and tablename not like 'sa_%'
    -- materialisoidut näkymät
    union
    select relname as tablename
    from pg_class c
    join pg_namespace nc on nc.oid=c.relnamespace
    where c.relkind in ('m') --r=table, m=materialized view, i=index, S=sequence
    and nc.nspname='public'
    --  and relname not like 'sa_%'
) as t
EOSQL;

// haetaanko dataa (onhan annettu hyväksyttävä nimi)?
if ($taulu) {
    if (preg_match("/^[-A-Z_0-9]+$/i",$taulu)) {
        $query = "SELECT * FROM $taulu";
    } else {
        die('Could not accept given argument');
    }
}

if ($type == "json") {
    // tämäpä "hacki". json_agg tekee täysin valmiin json-listan
    $query = "with p as (".$query.") select json_agg(p) as json from p;";
}
$result = pg_query($query) or die('Query failed: ' . pg_last_error());
// tsv?
//json:
$return_arr = array();
while ($row = pg_fetch_array($result, null, PGSQL_ASSOC)) {
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
        $return_arr = json_decode($row["json"]);
    }
}
if ($type == "json") {
    // todo: pretty print argumentin taakse
    $jsonencodebits = JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE;
    if ($pretty) {
        $jsonencodebits |= JSON_PRETTY_PRINT;
    }
    echo json_encode($return_arr, $jsonencodebits);
}

pg_free_result($result);
pg_close($dbconn);
?>
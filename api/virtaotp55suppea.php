<?php
$type = "csv"; // oletus
if ($_GET) {
  if(isset($_GET['type'])) {
    $type = $_GET['type'];
  }
}

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

$query = <<<EOSQL
SELECT [Oppilaitos Koodi]
,[Oppilaitos]
,[OKM Ohjauksen ala Koodi]
,[OKM Ohjauksen ala]
,[Koulutusaste (taso 2) Koodi]
,[Koulutusaste (taso 2)]
,[Koulutusala (taso 1) Koodi]
,[Koulutusala (taso 1)]
,[Koulutusala (taso 2) Koodi]
,[Koulutusala (taso 2)]
,[Koulutusala (taso 3) Koodi]
,[Koulutusala (taso 3)]
,[Koulutus Koodi]
,[Koulutusnimike]
,[vuosi]
,[suorittanut55]
FROM [dw].[v_virta_otp_55_suppea]
EOSQL;

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

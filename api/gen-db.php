<?php require 'auth.php'; ?>
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
  //  $pretty = true;
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

$settings = parse_ini_file('/var/www/db-settings.ini', true);
$link = mssql_connect($settings["database"]["host"],$settings["database"]["user"],$settings["database"]["pass"]);

if(!$link){
  die('Something went wrong while connecting to MSSQL');
}
if(!mssql_select_db($settings["database"]["name"], $link)){
  die('Something went while connecting to database');
}

// hae lista (oletus kysely) tauluista ja materialisoiduista näkymistä, johon lisäksi URI
$query = "select tablename as data";
$query .= ", 'http";
if (isset($_SERVER["HTTPS"])) {
  if ($_SERVER["HTTPS"] == "on") {
    $query .= "s";
  }
}
$query .= "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
if(!preg_match("/\/$/",$_SERVER['REQUEST_URI'])) $query .= "/";
$query .= "'+tablename as uri ";

// DISABLED BY USING NON EXISTING SCHEMA
$query .= <<<EOSQL
from (
  -- normaalit taulut
  select TABLE_NAME as tablename from INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='notexists'
  -- näkymät?
  -- materilisoidut näkymät?
) as t
EOSQL;

// haetaanko dataa (onhan annettu hyväksyttävä nimi)?
if ($taulu) {
  if (preg_match("/^[-A-Z_0-9]+$/i",$taulu)) {
    $query = "SELECT * FROM notexists.$taulu";
  } else {
    die('Could not accept given argument');
  }
}

$result = mssql_query($query,$link);

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
    $return_arr[] = $row;
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

mssql_free_result($result);
mssql_close($link);
?>

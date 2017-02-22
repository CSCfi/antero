<?php require 'auth.php'; ?>
<?php
$type = "csv"; // oletus
$filterVuosi = "";
$filterPankki = "";
if ($_GET) {
  if(isset($_GET['type'])) {
    $type = $_GET['type'];
  }
  if(isset($_GET['vuosi'])) {
    $filterVuosi = $_GET['vuosi'];
  }
  if(isset($_GET['pankki'])) {
    $filterPankki = $_GET['pankki'];
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
SELECT
vuosi,
oppilaitostunnus, 
tkoodi, 
sukupuoli, 

suorittanut55ilmanPankkia, suorittanut55pankinAvulla, suorittanut27, 
summa, 
kevat, syys, pankkiSaldo55, pankkiKumuEnnen55, 
uuttaPankkiin,
opSummaKunOtePankista, 

uusiOpisk, uusiOpiskKevat,
olok, olos, 
edellinenSyysolo,

--loAloituspvm, ooAloituspvm,
opiskelijaavain, opiskeluoikeusavain
FROM sa.sa_virta_otp_viisviis
EOSQL;

if(is_numeric($filterVuosi) && is_numeric($filterPankki)){
  
  $query .= " WHERE vuosi = $filterVuosi ";
  
  if($filterPankki==0){
    $query .= " and suorittanut55ilmanPankkia = 0 and suorittanut55pankinAvulla = 0 ";
  }
  if($filterPankki==1){
    $query .= " and suorittanut55ilmanPankkia = 0 and suorittanut55pankinAvulla = 1 ";
  }
  if($filterPankki==2){
    $query .= " and suorittanut55ilmanPankkia = 1 and suorittanut55pankinAvulla = 0 ";
  }
  if($filterPankki==-1){
    $query .= " and suorittanut55ilmanPankkia is null and suorittanut55pankinAvulla is null ";
  }
  
}else{
  $query .= " WHERE 1=0 -- no filter, too many rows ";
}

$result = mssql_query($query,$link) or die('Query failed: ' . mssql_get_last_message());

// tsv?
//json:
$return_arr = array();
if ($type == "json") {
  echo "[";
}
$cnt=0;
while ($row = mssql_fetch_array($result, MSSQL_ASSOC)) {
    $cnt++;
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
        //array_push($return_arr,$row);
        if($cnt>1){
          echo ",";
        }
        echo "\n".json_encode($row);
    }
}
if ($type == "json") {
    //echo json_encode($return_arr, JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
    echo "\n]";
}

mssql_free_result($result);
mssql_close($link);
?>

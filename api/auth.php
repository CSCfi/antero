<?php
session_start();
if (isset($_SESSION['newlogin'])) { 
  unset($_SESSION['newlogin']);
  unset($_SESSION['loggedout']);
}
$settings = parse_ini_file('/var/www/auth-settings.ini', true);
$valid_passwords = array ($settings["vipunen"]["user"] => $settings["vipunen"]["pass"]);
$valid_users = array_keys($valid_passwords);

$user = $_SERVER['PHP_AUTH_USER'];
$pass = $_SERVER['PHP_AUTH_PW'];

$validated = (in_array($user, $valid_users)) && ($pass == $valid_passwords[$user]);

if (!$validated || isset($_SESSION['loggedout'])) {
  $_SESSION['newlogin'] = true;
  header('WWW-Authenticate: Basic realm="Login Area"');
  header('HTTP/1.0 401 Unauthorized');
?>
<!DOCTYPE html>
<title>Antero API</title>
<div id="messagebox">Authorization Required</div>
<?php
  exit;
}

?>
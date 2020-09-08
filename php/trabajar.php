
<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

echo "<h1>trabajar</h1>";
$connection = oci_connect("ADMIN","bird-BOOK2020", "lfqs_high");
if (!$connection) {
    $e = oci_error();
    trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
}
$stid = oci_parse($connection, "insert into aplicacion(id, who, keyword,startat) values (idnv.nextval,'". gethostname($
$myfile = fopen("/mnt/repositorio/instrucciones.txt", "r") or die("Unable to open file!");

$linea= fgets($myfile);
echo $linea;

fclose($myfile);

oci_execute($stid);
?>
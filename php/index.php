<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
echo "<h1>hola, este es el trabajo que hemos hecho :)</h1>";
$connection = oci_connect("ADMIN","bird-BOOK2020", "lfqs_high");
if (!$connection) {
    $e = oci_error();
    trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
}
$stid = oci_parse($connection, 'SELECT * FROM aplicacion order by id');
oci_execute($stid);
echo "<table style='border:solid' border='1'>";
echo "<tr><td>ID</td><td>Quien trabaja</td><td>Que busco</td><td>Cuando</td></tr>";
while ($row = oci_fetch_array($stid, OCI_ASSOC+OCI_RETURN_NULLS)) {
    echo "<tr>";
//print_r($row);
echo "<td>";
echo $row["ID"];
echo "</td>";
echo "<td>";
echo $row["WHO"];
echo "</td>";
echo  "<td>";
echo $row["KEYWORD"];                                                                                                                                                   echo "</td>";                                                                                                                                                                                                                                                                                                                                   echo  "<td>";
echo $row["STARTAT"];
echo "</td>";                                                                                                                                                   echo "<$/*    foreach ($row as $item) {
        if($item !== null && $item != ""){
                echo " <td>   " . (htmlentities($item, ENT_QUOTES)) . "<td>";
        }
    }*/
    echo "</tr>";
}
echo "</table>"

?>
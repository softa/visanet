<!--
'-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
' Kit de Integra��o Visanet VBV
' Vers�o: 3.0
' Arquivo: processaCapturaVisanet.php
' Fun��o: P�gina de retorno da captura transa��o
'-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
-->
<?
// Exibe os valores de retorno da captura
echo $_REQUEST['ars'] . "<br>";
echo $_REQUEST['tid'] . "<br>";
echo $_REQUEST['lr'] . "<br>";
echo $_REQUEST['cap'];
?>
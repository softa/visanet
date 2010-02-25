<!--
'-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
' Kit de Integração Visanet VBV
' Versão: 3.0
' Arquivo: processaCapturaVisanet.php
' Função: Página de retorno da captura transação
'-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
-->
<?
// Exibe os valores de retorno da captura
echo $_REQUEST['ars'] . "<br>";
echo $_REQUEST['tid'] . "<br>";
echo $_REQUEST['lr'] . "<br>";
echo $_REQUEST['cap'];
?>
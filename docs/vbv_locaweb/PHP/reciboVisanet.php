<!--
'-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
' Kit de Integra��o Visanet VBV
' Vers�o: 3.0
' Arquivo: reciboVisanet.php
' Fun��o: P�gina de retorno da transa��o
'-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
-->
<?
ini_set("allow_url_fopen", 1); // Ativa a diretiva 'allow_url_fopen' para uso do 'fsockopen'

// Define valores do estabelecimento
$codIdentificacao = ""; // c�digo de identifica��o da configura��o (deve ser igual ao informado no Painel de Controle de Com�rcio Eletr�nico Locaweb, na respectiva configura��o do meio de pagamento).
$ambiente = ""; // ambiente da configura��o junto � LocaWeb.
$URLRetornoVisa = ""; // URL de retorno para transa��es Visanet. N�O utilize endere�os HTTPS.

// Efetua a captura do lr e recupera o retorno
if ($_REQUEST['ars'] == "") {

	$host = "comercio.locaweb.com.br";
	$port = 80;
	$path = "/comercio.comp";

	$fullhost = "http://comercio.locaweb.com.br:80";

	// Monta a url para captura do lr
	$request = "tid=".$_REQUEST['tid']."&modulo=VISAVBV&operacao=Retorno&identificacao=".$codIdentificacao."&ambiente=".$ambiente."&URLRetornoVisa=".$URLRetornoVisa;
	
	$request_length = strlen($request);

	$header  = "POST $path HTTP/1.0\r\n";
	$header .= "Host: $host\r\n";
	$header .= "User-Agent: DoCoMo/1.0/P503i\r\n";
	$header .= "Content-type: application/x-www-form-urlencoded\r\n";
	$header .= "Content-length: $request_length\r\n";
	$header .= "\r\n";

    $fp = fsockopen($host,$port,&$err_num,&$err_msg,30);

    fputs($fp, $header . $request);
    
    while(trim(fgets($fp,4096)) != '');
    
    while(!feof($fp)){
        $response .= fgets($fp,4096);
    }
    
	echo $response;

} else {

	// Exibe as v�riaveis de retorno
	echo "C�digo da transa��o: " . $_REQUEST['tid'] . "<br>";
	echo "C�digo de resposta da transa��o: " . $_REQUEST['lr'] . "<br>";
	echo "C�digo de autoriza��o: " . $_REQUEST['arp'] . "<br>";
	echo "Valor da transa��o: " . $_REQUEST['price'] . "<br>";
	echo "Identifica��o do Pedido na Loja: " . $_REQUEST['orderid'] . "<br>";
	echo "Campo livre: " . $_REQUEST['free'] . "<br>";
	echo "Mensagem da transa��o: " . $_REQUEST['ars'] . "<br>";
	echo "Tipo de Autentica��o: " . $_REQUEST['authenttype'] . "<br>";
    echo "HASH do n.� do cart�o (criptografado): " .$_REQUEST['pan'] . "<br>";
    echo "C�digo do banco emissor do cart�o: " . $_REQUEST['bank'];

}
?>
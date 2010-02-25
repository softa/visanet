<!--
'-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
' Kit de Integração Visanet VBV
' Versão: 3.0
' Arquivo: reciboVisanet.php
' Função: Página de retorno da transação
'-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
-->
<?
ini_set("allow_url_fopen", 1); // Ativa a diretiva 'allow_url_fopen' para uso do 'fsockopen'

// Define valores do estabelecimento
$codIdentificacao = ""; // código de identificação da configuração (deve ser igual ao informado no Painel de Controle de Comércio Eletrônico Locaweb, na respectiva configuração do meio de pagamento).
$ambiente = ""; // ambiente da configuração junto à LocaWeb.
$URLRetornoVisa = ""; // URL de retorno para transações Visanet. NÃO utilize endereços HTTPS.

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

	// Exibe as váriaveis de retorno
	echo "Código da transação: " . $_REQUEST['tid'] . "<br>";
	echo "Código de resposta da transação: " . $_REQUEST['lr'] . "<br>";
	echo "Código de autorização: " . $_REQUEST['arp'] . "<br>";
	echo "Valor da transação: " . $_REQUEST['price'] . "<br>";
	echo "Identificação do Pedido na Loja: " . $_REQUEST['orderid'] . "<br>";
	echo "Campo livre: " . $_REQUEST['free'] . "<br>";
	echo "Mensagem da transação: " . $_REQUEST['ars'] . "<br>";
	echo "Tipo de Autenticação: " . $_REQUEST['authenttype'] . "<br>";
    echo "HASH do n.º do cartão (criptografado): " .$_REQUEST['pan'] . "<br>";
    echo "Código do banco emissor do cartão: " . $_REQUEST['bank'];

}
?>
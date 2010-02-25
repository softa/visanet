<!--
'-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
' Kit de Integra��o Visanet VBV
' Vers�o: 3.0
' Arquivo: GeraTID.php
' Fun��o: Cont�m a fun��o para gerar o c�digo de identifica��o (TID) das transa��es
'-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
-->
<?
function GerarTid ($shopid,$pagamento) {

    if(strlen($shopid) != 10) {
        echo "Tamanho do shopid deve ser 10 d�gitos";
        exit;
	}
	
	if(is_numeric($shopid) != 1) {
        echo "Shopid deve ser num�rico";
        exit;
	}

    if(strlen($pagamento) != 4) {
        echo "Tamanho do c�digo de pagamento deve ser 4 d�gitos.";
        exit;
	}

    //N�mero da Maquineta
    $shopid_formatado = substr($shopid, 4, 5);

    //Hora Minuto Segundo e D�cimo de Segundo
    $hhmmssd = date("His").substr(sprintf("%0.1f",microtime()),-1);

    //Obter Data Juliana
    $datajuliana = sprintf("%03d",(date("z")+1));

	//�ltimo d�gito do ano
    $dig_ano = substr(date("y"), 1, 1);


    return $shopid_formatado.$dig_ano.$datajuliana.$hhmmssd.$pagamento;
  }

// N�mero de afilia��o da loja junto ao Visanet
$afiliacao = "1001734898";

// C�digo de pagamento, formado pelo tipo de pagamento + n�mero de parcelas
$codpagto = "1001";

echo call_user_func ('GerarTid', $afiliacao, $codpagto);
?>
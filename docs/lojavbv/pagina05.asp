	<!--#include file="FuncaoGerarTid.inc"-->
	<%
session("pagamento") = Request.Form("pagamento")
session("AUTHENTTYPE") = request.form("AUTHENTTYPE")
session("ambiente") = Request.Form("ambiente")

Tid = GerarTid("1001734898",session("pagamento"))

		

 varProd = Session("varProd")        'Descri��o do Pedido
 varQtd = Session("varQtd")			 'Quantidade
 varId = Session("varId")	         'ID do Produto
 varPreco = Session("varPreco")      'Preco Unit�rio
 varValor = Session("varValor")      'Valor Total
 varPacote = Session("varPacote")    'Numero do Pacote
 varTotalFrete = Session("varTotal") 'Total com Frete
 varFrete = Session("varFrete")      'Valor do Frete


'TIPO DA TRANSA��O
Session("tipo")		= "VBV"


' COLETAR DADOS DAS SESSIONS
VarConsumidor		= Session("Nome_Comprador")
VarEmail			= Session("Email_comprador")
VarTel				= Session("Tel_comprador")

VarNome				= Session("Nome")
VarEndereco			= Session("Endereco")
VarBairro			= Session("Bairro")
VarCidade			= Session("Cidade")
VarUF				= Session("Estado")
VarCep				= Session("Cep")
VarMsg				= Session("Msg")
varDtEntrega		= Session("DtEntrega")

item				= Session("varId")
qty					= 1
produto				= Session("varProd")
puni				= Session("varPreco")
subtotal			= Session("varPreco")
frete				= Session("varFrete")

total				= subtotal+cint(frete)


pedido				= "<b>Dados do consumidor:</b>" & "<BR>"
pedido				= pedido & "<b>Nome:</b> " & VarConsumidor & " - " & VarEmail & " - " & VarTel & "<BR>"
pedido				= pedido & "   " & " <BR>"
pedido				= pedido & "<b>Dados de entrega:</b>" & "<BR>"
pedido				= pedido & "<b>Nome:</b> " & VarNome & " - " & VarEndereco & " - " & VarBairro & " - " & VarCidade & " - " & VarUF & " - " & VarCep & "<BR><BR>"
pedido				= pedido& "<table border='0' cellspacing='0' width='100%'>" & _
						"<tr bgcolor=#CCCCCC>" & _
						"<td width='68' height='15'><b>Quant.</b></td>" & _
						"<td width='68' height='15'><b>Item</b></td>" & _
						"<td width='210' height='15'><b>Descri&ccedil;&atilde;o</b></td>" & _
						"<td width='88' height='15'><b>Pre&ccedil;o</b></td>" & _
						"<td width='88' height='15'><b>Sub-Total:</b></td>" & _
						"</tr>" & _
						"<tr bgcolor=#FFFFFF>" & _
						"<td width='68' height='15'>" & qty & "</td>" & _ 
						"<td width='68' height='15'>" & item & "</td>" & _
						"<td width='210' height='15'>" & produto & "</td>" & _
						"<td width='88' height='15'>" & moeda(puni) & "</td>" & _
						"<td width='88' height='15'>" & moeda(subtotal) & "</td>" & _
						"</tr></table>"
Session("order") = pedido

	FUNCTION Moeda(valor)
	  if trim(valor) <> "" then
		Valor1=  mid(valor, 1, len(valor) - 2)
		Decima = mid(valor, len(valor) - 1, 2)
	  end if
		Moeda = Valor1 & "," & Decima
	END FUNCTION
	%>

	<%
	'Rotina para criar um arquivo de texto por onde ser� passado o valor da transa��o.
	'Importante : Para que o componente receba o valor da transa��o atrav�s do arquivo Txt, � necess�rio configurar o arquivo cfglojavisa.ini como par�metro FILEMODE = 1
	'Na linha abaixo, est� sendo criado um objeto FileSystemObject,
	'para permitir a cria��o de um diret�rio para os arquivos de mensagens. O valor da transa��o ser� informado ao componente atrav�s deste arquivo,
	'para melhoria da seguran�a. Lembrando apenas que essa � uma solu��o para ASP. Para outras linguagens, como PHP, CGI, Coldfusion, etc,
	'favor consultar a documenta��o da linguagem sobre cria��o de arquivos.
	Set fso = CreateObject("Scripting.FileSystemObject")
	'Muito importante observar o endere�o onde o arquivo est� sendo criado. Obrigatoriamente, os arquivos devem ser direcionados
	'para o diret�rio onde est�o os componentes, no subdiret�rio "messages". Nas linhas abixo, verificamos se o diret�rio existe. Caso n�o exista, ser� criado.


	Set arquivo = fso.CreateTextFile("C:\dominios\impactroserver.com\Visa\requests\" & tid &".xml", True)
	arquivo.WriteLine("<MESSAGE><PRICE>"&total&"</PRICE><AUTHENTTYPE>"& session("AUTHENTTYPE") &"</AUTHENTTYPE></MESSAGE>")
	arquivo.Close
	Set arquivo = Nothing
	Set fso = Nothing

	%>


<html>
<head>
<title>Loja de exemplo para pagamentos VISA</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel=stylesheet href="estilos.css" type="text/css">
</head>

<body bgcolor="#ffffff" text="#000000" onload="document.forms[0].submit();">

	  </td>
<td width="549" valign="top" height="435" >&nbsp;</td>
	  </tr>
	</table>


	<!-- ********************** CHECKOUT Verified by VISA   ********************** -->
	<form action="http://www.impactroserver.com/visa/mpg.exe?" method="post" name="pay_VBV">
	<input type="hidden" name="tid" value="<%=tid%>">
	<input type="hidden" name="order" value="<%=session("order")%>">
	<input type="hidden" name="orderid" value="1234567890">
	<input type="hidden" name="bank" value="<%=session("bank")%>">
	<input type="hidden" name="bin" value="<%=session("bin")%>">
	<input type="hidden" name="merchid" value="cfglojavisa">
	<input type="hidden" name="free" value="campo livre">
	<input type="hidden" name="damount" value="R$<%=left(  Session("varPreco")  ,   len(Session("varPreco"))-2)	 & "," & right(Session("varPreco"),2)%>">

	<!-- ********************** CHECKOUT Verified by VISA   ********************** -->




	<SCRIPT LANGUAGE=javascript>
	<!--
	function submit(){
		document.forms[0].submit();
	}
	//-->

	</SCRIPT>
	</form>

	</body>
	</html>


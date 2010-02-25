		<!--#include file="FuncaoGerarTid.inc"-->
	<%
		Tid = GerarTid("1001734898",session("pagamento"))
		
	%>

	<html>
	<head>
	<title>Loja modelo VbV 1.0</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<link rel=stylesheet href="estilos.css" type="text/css">
	</head>

	<body bgcolor="#ffffff" text="#000000">
	<table width="800" height="598" border="0" cellpadding="0" cellspacing="0">
	  <tr> 
	    <td colspan="2" height="61"><img src="Img/Barra_Sup.jpg" width="800" height="126"></td>
	  </tr>
	  <tr valign="top" > 
	    <td width="135" height="531" valing="top"><img src="Img/Barra_Lat_Esq.jpg" width="135" height="474"> </td>
	    <td width="665" valing="top" ><table width="492"  cellpadding="1" cellspacing="1" height="409">
	      <tr>
	        <td height="338">
	          <form action="../componentes_vbv/capturebalance.exe?" method="post" name="pay_moset">
	          <table width="100%" border="0">
	  <tr>
	    <td><div align="center" class="subtitulo">Capture Balance da transação</div></td>
	    </tr>
	</table>
					<div align="left" class = "corpo">
					<p><b>Digite o (TIDMaster) </b><br>
					<input type="text" name="tidmaster" value="">
					<input type="hidden" name="tid" value="<%=tid%>">
	                <input type="hidden" name="merchid" value="cfglojavisa">
	                <p><B>Dados da Compra</B><br>
	                <input type="text" name="order" value="">
	                
					<input type="hidden" name="orderid" value="123456">
					<p><B>Campo FREE Livre</B><br>
					<input type="text" name="free" value="">
					<p><B>Digite o valor da transação</B><br>
					<input type="text" name="price" value="100">
					<p><B>Valor da compra</B><br>
					<input type="text" name="damount" value="R$">
	              
	          
	              </p>
	            </div>
	            <p>
	              <center>
	                <input name="submit" type="submit" value="Enviar Solicitacao">
	              </center>
	          </form>
	          <p></P>
	        </td>
	      </tr>
	    </table>
	</td>
	  </tr>
	</table>
	</body>
	</html>

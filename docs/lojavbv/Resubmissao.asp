		<!--#include file="FuncaoGerarTid.inc"-->
	<%
		Tid = GerarTid("1001734898",session("pagamento"))
		
	%>
	
	<html>
	<head>
	<title>Loja de exemplo VbV 1.0</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<link rel=stylesheet href="estilos.css" type="text/css">
	</head>

	<body bgcolor="#ffffff" text="#000000">
	<table width="800" height="598" border="0" cellpadding="0" cellspacing="0">
	  <tr> 
	    <td colspan="2" height="61"><img src="Img/Barra_Sup.jpg" width="800" height="126"></td>
	  </tr>
	  <tr > 
	    <td width="135" height="531" valign="top" valing="top"><img src="Img/Barra_Lat_Esq.jpg" width="135" height="474"> </td>
	    <td valign="top" valing="top" ><table width="492" cellpadding="1" cellspacing="1" height="409">
	      <tr>
	        <td align="left" valign="top">
	          <form action="../Componentes_vbv/resubmit.exe?" method="post" name="pay_moset">
	          <table width="100%" border="0">
	  <tr>
	    <td><div align="left" class="subtitulo">Re-submissão da transação</div></td>
	    </tr>
	</table>

					<div align="left"class="corpo">
					<p>Digite TransactionID Master (TIDMaster)<br>
					<input type="text" name="tidmaster" value=""><br>
					<input type="hidden" name="tid" value="<%=tid%>">
					Merchid<br>
	                <input type="text" name="merchid" value="cfglojavisa">
	                	              
	          
	              </p>
	            </div>
	            <p>
	              
	                <input name="submit" type="submit" value="Enviar Solicitacao">
	              
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

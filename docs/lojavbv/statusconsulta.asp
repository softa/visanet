	<html>
	<head>
	<title>Loja de exemplo VbV 1.0</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<link rel=stylesheet href="estilos.css" type="text/css">	
	</head>

	<body bgcolor="#ffffff" text="#000000">
	<table width="800" border="0" cellpadding="0" cellspacing="0">
	  <tr>
	    <td colspan="2"><img src="Img/Barra_Sup.jpg" width="800" height="126"></td>
      </tr>
	  <tr>
	    <td width="139"><img src="Img/Barra_Lat_Esq.jpg" width="135" height="474"></td>
	    <td width="655" valign="top"><table width="100%" height="376">
          <tr>
            <td height="56"class="subtitulo"><div align="center">Status da Transação</div>
            </td>
          </tr>
          <tr>
            <td height="159"class="corpo">
              <p>
				  <b>TransactionID=</b><%=request.form("tid")%><br>
                  <b>Cod.:=</b><%=request.form("lr")%> <br>
                  <b>Arp=</b><%=request.form("arp")%><br>
                  <b>Ars=</b><%=request.form("ars")%><br>
                  <b>Free=</b><%=request.form("free")%><br>
                  <b>Orderid=</b><%=request.form("orderid")%><br>
                  <b>PAN=</b><%=request.form("pan")%><br>
                  <b>Banco=</b><%=request.form("bank")%><br>
                  <b>Preço=</b><%=request.form("price")%><br>
                  <b>Authent=</b><%=request.form("Authent")%><br>
                                  
              </p>
            </td>
          </tr>
        </table></td>
      </tr>
    </table>
	</body>
	</html>

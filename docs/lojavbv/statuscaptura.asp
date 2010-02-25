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
            <td height="56"class="subtitulo"><div align="center">Resposta da
                Captura</div>
            </td>
          </tr>
          <tr>
            <td height="159"class="corpo">
              <p><b>TransactionID=</b><%=request.form("tid")%><br>
                  <b>Lr.:=</b><%=request.form("lr")%> <br>
                  <b>Ars=</b><%=request.form("ars")%><br>
                  <b>Cap=</b>
                  <%if request.form("lr") > 99 then
	   response.write("Não disponível")
	  else
	   response.write(request.form("cap"))
	end if%>
              </p>
            </td>
          </tr>
        </table></td>
      </tr>
    </table>
	</body>
	</html>

<%Response.Buffer = true

    session("Nome_Comprador") = Request.Form("campo_nome_comprador")
    session("Email_comprador") = Request.Form("campo_email")
    session("Tel_comprador") = Request.Form("campo_telefone")
    session("Nome") = Request.Form("campo_nome_entrega")
    session("Endereco") = Request.Form("campo_endereco")
    session("Bairro") = Request.Form("campo_bairro")
    session("Cidade") = Request.Form("campo_cidade")
    session("Estado") = Request.Form("campo_uf")
    session("Cep") = Request.Form("campo_cep")


	session("loop") = 1
	session("varFrete") = "000"
	varUF = Request.Form("campo_uf")
	if varId = "" then varId = 0 end if
	
	
  
 FUNCTION Moeda(valor)
	Valor1=  mid(valor, 1, len(valor) - 2)
	Decima = mid(valor, len(valor) - 1, 2)
	Moeda = Valor1 & "," & Decima
 END FUNCTION

%>

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
	    <td width="126" valign="top"><img src="Img/Barra_Lat_Esq.jpg"></td>
	    <td width="658" valign="top"><table width="529" align="left" height="524">
          <tr>
            <td width="513" valign="top">
              <table width="500" border="0" align="center">
                <tr>
                  <td valign="top" class="subtitulo">
                    <div align="center">Pagamento</div>
                  </td>
                </tr>
              </table>
              <br>
              <br>
              <table align="center" border="0" width="500" bgcolor="#ffffff" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="212" valign="_top" align=middle bgcolor="#ffffff"><IMG src="img/2j.jpg" width="140" height="106" hspace=10> </td>
                  <td align="left" width="288" bgcolor="#ffffff" class="corpo">Produto: <b><%=session("varProd")%> </b><br>
                      <br>
            Preço: R$ <%= Moeda(session("varPreco"))%> <br>
            Frete: R$ <%= Moeda(session("varFrete"))	%> <br>
            Total: R$ <%= Moeda(session("varPreco")) %> <br>
            <%Session("varTotal") = session("varPreco")%>
            <br>
            <br>
                  </td>
                </tr>
              </table>
              <br>
              <br>
              <br>
             <table width="250" border="0" align="center">
                <form name="form1" action="pagina04.asp" method="post" onsubmit=javascript:fsubmit(1)>
                  <input type="hidden" name="tp_produto">
                <tr>
                <td width="65" height="38" align="middle">
                <IMG border=0 hspace=5 src="Img/card_visa.jpg" onclick=javascript:fsubmit(1)><br>
                </td>
                <td width="175" align="middle" valign="middle"> <div align="left">
                <div align="left">
                <input type="text" name="bin"size="6" maxlength="6">
                </div></td>
                <tr>
                <td height="23" colspan="2" align="middle"><div align="left">
                  <hr>
                </div>
                </td>
                 
                <tr>
                  <td height="24" align="middle"><img border=0 hspace=5 src="Img/card_visa_electr.jpg" onclick=javascript:fsubmit(2)></td>
                  <td align="center" valign="middle">
				      <div align="left">
				        <select name="bank" size="1" onChange="javascript:fsubmit(2)">
		                  <option value=""></option>
		                  <option value="237">Banco Bradesco</option>
		                                  
	                    </select>
	   	            </div>
                              
              </table>
             
              <br>
              <br> <table width="60%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td><div align="center">
                      <input type=image name=point2 src="Img/BT_Pagar.jpg" onclick="javascript:fsubmit(1)">
                  </div></td>
                  <td><div align="center"><A href="javascript:history.back(-1);"><IMG src="img/Bt_Voltar.jpg" alt=Voltar width="91" height="24" hspace=26 border=0></A></div></td>
                </tr>
                </form>
              </table>
              <p><br>
              </p>              
              <div align="center"> <A href="javascript:history.back(-1);">              </A> </div>
            </td>
          </tr>
          <tr>
           
          </tr>
          
        </table></td>
      </tr>
    </table>
	</body>
	</html>
		<script>
		function fsubmit(svalue){
			document.form1.tp_produto.value= svalue;
			document.form1.submit();
			}
		</script>
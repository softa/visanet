	<html>
	<head>
	<title>Loja de exemplo VbV 1.0</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<link rel=stylesheet href="estilos.css" type="text/css">	

		
	<script language="javascript">
<!--
function valida_form(){
 msgerro="";
 if (document.frm_pagar.campo_nome_comprador==""){
      msgerro= msgerro + "\n Favor informar um valor para o campo Comprador";
   }
 if (document.frm_pagar.campo_nome_entrega.value==""){
      msgerro= msgerro + "\n Favor informar um valor para o campo Nome Para Entrega";
   }
 if (document.frm_pagar.campo_email.value==""){
      msgerro= msgerro + "\n Favor informar um valor para o campo Email";
   }
 if (document.frm_pagar.campo_endereco.value==""){
      msgerro= msgerro + "\n Favor informar um valor para o campo Endereço";
   }
 if (document.frm_pagar.campo_telefone.value==""){
      msgerro= msgerro + "\n Favor informar um valor para o campo Telefone";
   }
 if (document.frm_pagar.campo_bairro.value==""){
      msgerro= msgerro + "\n Favor informar um valor para o campo Bairro";
   }
 if (document.frm_pagar.campo_cidade.value==""){
      msgerro= msgerro + "\n Favor informar um valor para o campo Cidade";
   }
 if (document.frm_pagar.campo_cep.value==""){
      msgerro= msgerro + "\n Favor informar um valor para o campo CEP";
   }
 if (!msgerro==""){
  alert(msgerro);
 }else{
  document.frm_pagar.submit();
 }

}
-->
</script>
	</head>
	<%
			session("varProd") = Request.Form("prod")
			session("varId") = Request.Form("id")
			session("varPreco") = Request.Form("preco")

			' COLHER DADOS DO Session
			    'VarConsumidor = session("campo_nome_comprador")
			    'VarEmail = session("campo_email")
			    'VarTel = session("campo_telefone")
				
			    'VarNome = session("campo_nome_entrega")
			    'VarEndereco = session("campo_endereco")
			    'VarBairro = session("campo_bairro")
			    'VarCidade = session("campo_cidade")
			    'VarUF = session("campo_uf")
			    'VarCep = session("campo_cep")

			    VarConsumidor = "Teste de Homologação"
			    VarEmail = "teste@visanet.com.br"
			    VarTel = "11 34570000"
			    VarNome = "teste"
			    VarEndereco = "Rua test, 138 casa 7"
			    VarBairro = "Vila Teste"
			    VarCidade = "São Paulo"
			    VarUF = "SP"
			    VarCep = "04569870"
				    
				    
	
		  
	FUNCTION Moeda(valor)

		Valor1=  mid(valor, 1, len(valor) - 2)
		Decima = mid(valor, len(valor) - 1, 2)

		Moeda = Valor1 & "," & Decima

	END FUNCTION
		
	%>
	<body>
	<form action="pagina03.asp" method="POST" name="frm_pagar" onsubmit="return valida_form()">
	<table width="800" height="600" border="0" cellpadding="0" cellspacing="0">
	  <tr>
	    <td height="67" colspan="2"><img src="Img/Barra_Sup.jpg" width="800" height="126"></td>
      </tr>
	  <tr>
	    <td width="135" valign="top"><img src="Img/Barra_Lat_Esq.jpg"></td>
	    <td width="665" align="left" valign="top">
	    <table width="91%" border="0" align="left" cellpadding="0" cellspacing="0" background="img/branco.gif">
          <tr>
            <td colspan="2"class="subtitulo">
              <div align="center">Formul&aacute;rio de Endere&ccedil;o</div>
            </td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="47%" class="titulo">Dados do Comprador
                <hr>
            </td>
            <td width="53%" class="titulo">Dados para Entrega
                <hr>
            </td>
          </tr>
          <tr>
        <td align=right width="47%" class="corpo"><div align="left">Nome do Comprador<br>
        <input type="text" name="campo_nome_comprador" value="<%=varConsumidor%>" size="30" maxlength="30"></div>
		</td>
        <td align=right width="53%" class="corpo"><div align="left">Nome <br>
        <input type="text" name="campo_nome_entrega" value="<%=varNome%>" maxlength="50" size="30">
        </div></td>
        </tr>
        <tr>
        <td align=right width="47%" height="44"class="corpo"> <div align="left">E-Mail do Comprador<br>
              <input name="campo_email" value="<%=varEmail%>" size="30" maxlength="30">
        </div></td>
        <td align=right width="53%" height="44"class="corpo"><div align="left">Endere&ccedil;o<br>
        <input type="text" name="campo_endereco" value="<%=varEndereco%>" maxlength="50" size="30">
	    </div></td>
        </tr>
        <tr>
        <td align=right width="47%" class="corpo">
          <div align="left">Telefone do Comprador
		  <input type="text" name="campo_telefone" value="<%=varTel%>" size="30" maxlength="30"></font></div>
        </td>
        <td align=right width="53%" class="corpo">
        <div align="left">Bairro<br>
        <input type="text" name="campo_bairro" value="<%=varBairro%>" maxlength="25" size="30"></div>
        </td>
        </tr>
        <tr>
        <td width="47%">&nbsp;</td>
        <td align=right width="53%" class="corpo">
        <div align="left">Cidade<br>
        <input type="text" name="campo_cidade" 	value="<%=varCidade%>"maxlength="30" size="30"></font></div>
        </td>
      </tr>
      <tr>
        <td align=right width="47%">&nbsp;</td>
        <td align=right width="53%"class="corpo">
        <div align="left"></div>
        </td>
      </tr>
      <tr>
        <td align=right>&nbsp;</td>
        <td align=right class="corpo"><div align="left">UF</div>
          <div align="left">
             <div align="left">
              <select name="campo_uf"> 
                <option value=""></option> 
	             <option value="AC" <% if VarUF = "AC" then Response.Write("Selected") end if %>><font face="Verdana, Arial, Helvetica, sans-serif" size="2">AC</font></option>
                 <option value="AL" <% if VarUF = "AL" then Response.Write("Selected") end if %>><font face="Verdana, Arial, Helvetica, sans-serif" size="2">AL</font></option>
                 <option value="AM" <% if VarUF = "AM" then Response.Write("Selected") end if %>><font face="Verdana, Arial, Helvetica, sans-serif" size="2">AM</font></option>
                 <option value="AP" <% if VarUF = "AP" then Response.Write("Selected") end if %>><font face="Verdana, Arial, Helvetica, sans-serif" size="2">AP</font></option>
                 <option value="BA" <% if VarUF = "BA" then Response.Write("Selected") end if %>><font face="Verdana, Arial, Helvetica, sans-serif" size="2">BA</font></option>
                 <option value="CE" <% if VarUF = "CE" then Response.Write("Selected") end if %>><font face="Verdana, Arial, Helvetica, sans-serif" size="2">CE</font></option>
                 <option value="DF" <% if VarUF = "DF" then Response.Write("Selected") end if %>><font face="Verdana, Arial, Helvetica, sans-serif" size="2">DF</font></option>
                 <option value="ES" <% if VarUF = "ES" then Response.Write("Selected") end if %>><font face="Verdana, Arial, Helvetica, sans-serif" size="2">ES</font></option>
                 <option value="GO" <% if VarUF = "GO" then Response.Write("Selected") end if %>><font face="Verdana, Arial, Helvetica, sans-serif" size="2">GO</font></option>
                 <option value="MA" <% if VarUF = "MA" then Response.Write("Selected") end if %>><font face="Verdana, Arial, Helvetica, sans-serif" size="2">MA</font></option>
                 <option value="MG" <% if VarUF = "MG" then Response.Write("Selected") end if %>><font face="Verdana, Arial, Helvetica, sans-serif" size="2">MG</font></option>
                 <option value="MS" <% if VarUF = "MS" then Response.Write("Selected") end if %>><font face="Verdana, Arial, Helvetica, sans-serif" size="2">MS</font></option>
                 <option value="MT" <% if VarUF = "MT" then Response.Write("Selected") end if %>><font face="Verdana, Arial, Helvetica, sans-serif" size="2">MT</font></option>
                 <option value="PA" <% if VarUF = "PA" then Response.Write("Selected") end if %>><font face="Verdana, Arial, Helvetica, sans-serif" size="2">PA</font></option>
                 <option value="PB" <% if VarUF = "PB" then Response.Write("Selected") end if %>><font face="Verdana, Arial, Helvetica, sans-serif" size="2">PB</font></option>
                 <option value="PE" <% if VarUF = "PE" then Response.Write("Selected") end if %>><font face="Verdana, Arial, Helvetica, sans-serif" size="2">PE</font></option>
                 <option value="PI" <% if VarUF = "PI" then Response.Write("Selected") end if %>><font face="Verdana, Arial, Helvetica, sans-serif" size="2">PI</font></option>
                 <option value="PR" <% if VarUF = "PR" then Response.Write("Selected") end if %>><font face="Verdana, Arial, Helvetica, sans-serif" size="2">PR</font></option>
                 <option value="RJ" <% if VarUF = "RJ" then Response.Write("Selected") end if %>><font face="Verdana, Arial, Helvetica, sans-serif" size="2">RJ</font></option>
                 <option value="RN" <% if VarUF = "RN" then Response.Write("Selected") end if %>><font face="Verdana, Arial, Helvetica, sans-serif" size="2">RN</font></option>
                 <option value="RO" <% if VarUF = "RO" then Response.Write("Selected") end if %>><font face="Verdana, Arial, Helvetica, sans-serif" size="2">RO</font></option>
                 <option value="RR" <% if VarUF = "RR" then Response.Write("Selected") end if %>><font face="Verdana, Arial, Helvetica, sans-serif" size="2">RR</font></option>
                 <option value="RS" <% if VarUF = "RS" then Response.Write("Selected") end if %>><font face="Verdana, Arial, Helvetica, sans-serif" size="2">RS</font></option>
                 <option value="SC" <% if VarUF = "SC" then Response.Write("Selected") end if %>><font face="Verdana, Arial, Helvetica, sans-serif" size="2">SC</font></option>
                 <option value="SE" <% if VarUF = "SE" then Response.Write("Selected") end if %>><font face="Verdana, Arial, Helvetica, sans-serif" size="2">SE</font></option>
                 <option value="SP" <% if VarUF = "SP" then Response.Write("Selected") end if %>><font face="Verdana, Arial, Helvetica, sans-serif" size="2">SP</font></option>
                 <option value="TO" <% if VarUF = "TO" then Response.Write("Selected") end if %>><font face="Verdana, Arial, Helvetica, sans-serif" size="2">TO</font></option>
              </select>
              CEP
              <input name="campo_cep" value="<%=varCep%>" maxlength="9" size="8"> 
             </div></td>
      </tr>
          
          
           <td align=right width="47%">&nbsp;</td>
            <td align=right width="53%">
              <div align="left"></div>
            </td>
          </tr>
          <tr>
            <td valign="middle" align="CENTER"> <a href="javascript:valida_form()">
              <div align="center"><img src="img/Bt_Comprar.jpg" border="0"></div>
            </a></td>
            <td valign="middle" align="CENTER">
              <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><a href="pagina01.asp"><img src="img/Bt_Voltar.jpg" border=0 alt="Voltar" width="91" height="24" vspace="0" hspace="0"></a></font></div>
            </td>
          </tr>
        </table></td>
      </tr>
    </table>
	</body>
	</html>

	<script>
		document.frm_pagar.campo_nome_comprador.focus();
	</script>
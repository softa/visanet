	<!--#include file="geraopcoes.inc"-->
	<%tp_produto = request("tp_produto")%>
	<%session("bank") = Request.Form ("bank")%>
	<%session("bin") = Request.Form ("bin")%>
	
	<html>
	<head>
	<title>Loja de exemplo VbV 1.0</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<link rel=stylesheet href="estilos.css" type="text/css">
	
	<script language="JavaScript">
var retorno;
var mpg_popup;
window.name="loja";
function fabrewin()
{

if(navigator.appName.indexOf("Netscape") != -1)
   mpg_popup = window.open("", "mpg_popup","toolbar=0,location=0,directories=0,status=1,menubar=0,scrollbars=1,resizable=0,screenX=0,screenY=0,left=0,top=0,width=765,height=440");
else
   mpg_popup = window.open("", "mpg_popup","toolbar=0,location=0,directories=0,status=1,menubar=0,scrollbars=1,resizable=1,screenX=0,screenY=0,left=0,top=0,width=765,height=440");

	window.location="aguarde.html";
	return true;
}
</script>		
		
	</head>
	<body bgcolor="#ffffff" text="#000000"> 
	<form name="frmpagamento" method="post" action="pagina05.asp" target="mpg_popup" onsubmit="javascript:fabrewin();">
	<table width="800" border="0" cellpadding="0" cellspacing="0">
	  <tr>
	    <td colspan="2"><IMG height=126 src="Img/Barra_Sup.jpg" width=800></td>
      </tr>
	  <tr>
	    <td width="135" valign="top"><IMG src="Img/Barra_Lat_Esq.jpg"></td>
	    <td width="665" valign="top"><div align="left"></div>	    <table width="500">
          <tr>
            <td>
            
              <div align="left">
                  <table width="100%" border="0" align="center" background="img/branco.gif" height="304">
                    <br>
                    <tr align="middle"><br>
                        <td height="2" class="subtitulo" align="middle">Meu Carrinho</td>
                        <td height="2" class="subtitulo" align="left">Opções de
                          Pagamento</td>
                    </tr>
                    <tr align="middle">
                      <td colspan="2" height="2">&nbsp;</td>
                    </tr>
                    <tr>
                      <td valign="center" align="left" width="251" height="183" class="corpo">
                        <div align="center"><IMG height=106 src="img/2j.jpg" width=140> <br>
                  Produto: <b><%=session("varProd")%> </b><br>
                  <br>
                  <br>
                  Preço: R$ <%= Moeda(session("varPreco"))%> <br>
                  Frete: R$ <%= Moeda(session("varFrete"))%> <br>
                  Total: R$ <%= Moeda(session("varPreco"))%> <br>
                  <% FUNCTION Moeda(valor)
					   Valor1=  mid(valor, 1, len(valor) - 2)
					   Decima = mid(valor, len(valor) - 1, 2)
					   Moeda = Valor1 & "," & Decima
					  END FUNCTION %>
                        </div>
                      </td>
                      <td valign="top" align="left" width="289" height="183" class="corpo" >
                        <%call geraopcoes((session("varPreco")/100), tp_produto)%>
                                              
                        
                      </td>
                    </tr>
                    <tr>
                      <td colspan="2" align="middle" height="84" class="inferior"><p align="center"></p>
                      </td>
                    <tr>
                      <td align ="middle"><input type=image name=point src="Img/BT_Pagar.jpg"></td>
                      <td align ="middle"><a href="javascript:history.back()"><img src="Img/Bt_Voltar.jpg" border="0" id=pagar></a></td>
                    </tr>
                    <tr>
                       
                      <td colspan="2" align="middle" class="inferior">
                        <P></P>
                        <p align="center">* Verificar a taxa de juros praticada junto ao emissor do seu cartão Visa.</p><br>
                      </td>
                      </tr>
                      <tr>
						<td colspan="2" align="middle" class="inferior"><p align="center">Autorizar transação sem autenticação?</p>
						  <div align="center">
						    <select name="AUTHENTTYPE">
	   						    <option value="0" selected>Não</option>
	   						    <option value="1">Sim</option>
	   					        </select>
                          </div>
						  <P></P></td>     
                      
                    </tr>
                  </table>
                </div>
              
            </td>
          </tr>
        </table></td>
      </tr>
    </table>
    </form>
	</body>
	</html>

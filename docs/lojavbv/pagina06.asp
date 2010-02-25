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
    <td width="146" valign="top"><img src="Img/Barra_Lat_Esq.jpg" width="135" height="474"></td>
    <td valign="top">
    <table width="522">
      <tr align="left" valign="top">
        <td height="338">
          <table width="100%" border="0">
            <tr>
              <td background="img/branco.gif" align="middle" class="subtitulo"><div align="center">Pedido de Compra</div></td>
            </tr>
          </table>

<%	
						FUNCTION Moeda(valor)
						 if trim(valor) <> "" then
							Valor1=  mid(valor, 1, len(valor) - 2)
							Decima = mid(valor, len(valor) - 1, 2)
							end if
							Moeda = Valor1 & "," & Decima
						END FUNCTION
						
						varTid = Request("tid") 'Cod. da Transação 'Vem PELO BROWSER POST ou GET, depende do browser
													
						Set objXML = Server.CreateObject("Microsoft.XMLDOM")
						objXML.async = False 
						

						caminho = "C:\dominios\impactroserver.com\Visa\results\" & vartid & ".xml"
						 				
						'caminho=server.MapPath("/componentes_3d/results/" & vartid & ".xml")
						
						objXML.load(caminho)

																					
						if CStr(objXML.parseError.errorCode) <> "0" Then 'Se NAO conseguiu ler o arquivo (ele NAO FOI CRIADO...PAU)
							varMsg = Request.form("ars") 'Descricao do Erro
							varLr = Request.form("lr") 'Codigo de Retorno
							varFree = Request.form("free") 'Campo livre
							varOrderId = Request.form("orderid") 'Número do Pedido interno da Loja
							sPan = Request.Form("Pan")'Hash do cartão
							varPrice = Request.Form("Price") 'valor da compra
							varAUTHENT = Request.Form("AUTHENT")'tipo de Autenticação
							varArp = Request.Form("arp")' Código de Autorização
						Else
						    Set LR = objXML.getElementsByTagName("LR")
							Set ARP = objXML.getElementsByTagName("ARP")
							Set ARS = objXML.getElementsByTagName("ARS")
							Set PRICE = objXML.getElementsByTagName("PRICE")
							Set ORDERID = objXML.getElementsByTagName("ORDERID")
							Set FREE = objXML.getElementsByTagName("FREE")
							Set PAN = objXML.getElementsByTagName("PAN")
							Set AUTHENT = objXml.GetElementsByTagName("AUTHENT")
							
										
							Set fso = CreateObject("Scripting.FileSystemObject")
							If fso.FileExists(caminho) Then		
							  'fso.DeleteFile(caminho)
							End If					
							set fso=nothing
												
							'Carregar Variaveis
							varMsg = ARS.item(0).text 'Descricao do Erro
							varLr = LR.item(0).text 'Codigo de Retorno
							if len(FREE.item(0).text)> 0 then
							varFree = FREE.item(0).text 'Campo livre
							end if
							varORDERID = ORDERID.item(0).text 'Número do Pedido interno da Loja
							if len(ARP.item(0).text) > 0 then
							varArp = ARP.item(0).text ' Código de aprovação bancária
							end if					   	
							varPrice=PRICE.item(0).text 'valor da transacao
							varAUTHENT = AUTHENT.item(0).text
							
							
						End If

						
						VarConsumidor = session("Nome_Comprador")
						
						
						
						If cstr(varLr) <> "0" and cstr(varLr) <> "00" and cstr(varLr) <> "11" then  'Transação foi Negada
						
						
						

						'*********************************** Gerar Página de Negado *********************************** %>
          <center>
            <BR>
            <p> <b>Código:</b> <%=varLr%> <BR>
                <%=varMsg%> <BR>
                <BR>
                <b>Identificação da Transação:</b> <br>
                <%= varTid %> <BR>
                <BR>
                <b>Order ID:</b>
                <%= varORDERID %> <BR>
                <BR>
                <BR>
                <BR>
                <A href="index.asp"><IMG src="img/Bt_Voltar.jpg" border=0></A>
              </center>
          <%'********************************************************************************************** %>
          <% Else 
          
          'Transação Aprovada

			varTipo = Session("tipo") 					'TIPO DA TRANSAÇÃO 
			varProd = Session("varProd")				'Descrição do Pedido
			varQtd = "1"								'Quantidade
			varId = Session("varId")					'ID do Produto	
			varPreco = moeda(Session("varPreco"))       'Preco Unitário  
			varValor = Session("varValor")				'Valor Total
			varFrete = moeda(session("varFrete"))       'Valor do Frete


		 ' COLHER DADOS DA SESSION
						
			VarConsumidor = session("Nome_Comprador")
			VarEmail = session("Email_comprador")
			VarTel = session("Tel_comprador")
			VarNome = session("Nome")
			VarEndereco = session("Endereco")
			VarBairro = session("Bairro")
			VarCidade = session("Cidade")
			VarUF = session("Estado")
			VarCep = session("Cep")
			
	
				'*********************************** Gerar Pedido de Compra *********************************** %>
				<div align="center"><h3>Transação Aprovada</h3> </div>
				<P align="center"> 
				<div align="center">
				  <table width="100%" border="0" cellspacing="0" cellpadding="0">
				    <TR> 
				      <TD> 
				        <TABLE BORDER=0 CELLPADDING=2 CELLSPACING=1 width="100%">
				          <TR> 
				            <TD  VALIGN=top class ="corpo"> <B> <b>Endereço de Entrega:</b> 
				              </B></TD>
				            <TD  VALIGN=top class="corpo"> <%=varNome%> <BR>
				              <%=varEndereco%><BR>
				              <%=varBairro%><BR>
				              <%=varCidade%> - <%=varUF%><BR>
				              <%=varCEP%> </TD>				            
				          </TR>
				          <TR> 
				            <TD VALIGN=top class="corpo"> <B> Consumidor: <BR> E-Mail: </B></TD>
				            <TD VALIGN=top class="corpo"> <%=VarConsumidor%><BR><%=VarEmail%></TD>
				          </TR>
				          <TR> 
				            <TD VALIGN=top class="corpo"><B> Data/hora: </B> 
				            </TD>
				            <TD  VALIGN=top class="corpo"> <%=date()%> - <%=time()%> 
				              </TD>
				          </TR>
				          <TR> 
				            <TD VALIGN=top class="corpo"><B> Identificação do pedido: 
				              </B></font> </TD>
				            <TD VALIGN=top colspan="2" class="corpo"><%=varTid%></TD>
				          </TR>
				          <TR> 
				            <TD VALIGN=top class="corpo"><B> Order ID: 
				              </B></font> </TD>
				            <TD VALIGN=top colspan="2" class="corpo"><%=varORDERID%></TD>
				          </TR>
				          <TR> 
				            <TD VALIGN=top class="corpo"><B> Código de Autorização: 
				              </B></TD>
				            <TD  VALIGN=top colspan="2" class="corpo"><%=varArp%> 
				            <%if cStr(varLr) = "0" or cStr(varLr) = "00" Then%> 
				            - Cartão Emitido no Brasil 
				            <%else%>
				            - Cartão Emitido no Exterior
				            <%End IF%>
				              </TD>
				          </TR>
				          			          
				          <TR> 
				            <TD VALIGN=top class="corpo"><B> Código de retorno: 
				              </B></TD>
				            <TD  VALIGN=top colspan="2" class="corpo"><%=varlr%> 
				            </TD>
				          </TR>
				          <TR> 
				            <TD VALIGN=top class="corpo"><B> Código de Autenticação: 
				              </B></TD>
				            <TD  VALIGN=top colspan="2" class="corpo"><%=varAUTHENT%> 
				            <%if cStr(varAUTHENT) = "1" Then%> 
				            - Autenticação com Sucesso 
				            <%elseif  cStr(varAUTHENT) = "2" Then%>
				            - Autenticação Negada
				            <%elseif  cStr(varAUTHENT) = "3" Then%>
				            - Falha na Autenticação
				            <%elseif  cStr(varAUTHENT) = "0" Then%>
				            - Sem Autenticação (Emissor não Participa)				            
				            <%elseif  cStr(varAUTHENT) = "" Then%>
				            - Transação Sem Autenticação				             				            				            
				            <%End IF%>
				              </TD>
				          </TR>                  </TABLE>
                  <table width="500" border="0" cellspacing="0" cellpadding="3">
                    <TR>
                      <TD bgcolor="#eeeeee" width=350 ALIGN=left class="corpo"><B> Item </B> </TD>
                      <TD bgcolor="#eeeeee" width=100  ALIGN=right class="corpo"><B> Preço </B> </TD>
                      <TD bgcolor="#eeeeee" width=80 ALIGN=middle class="corpo"><B> Qtd </B> </TD>
                      <TD bgcolor="#eeeeee" width=90   ALIGN=right class="corpo"> <B> Total </B> </TD>
                    </TR>
                    <TR>
                      <TD align=left class="corpo"><%=varProd%></TD>
                      <TD align=right class="corpo"><%=varPreco%></TD>
                      <TD align=middle class="corpo"><%=varQtd%></TD>
                      <TD align=right class="corpo">R$ <%=varPreco%></TD>
                    </TR>
                    <TR>
                      <TD COLSPAN=3 HEIGHT=2 align=right class="corpo"><BR>
                          <B><b>Subtotal:</b></B></TD>
                      <TD VALIGN=top ALIGN=right class="corpo"><BR>
                          <B>R$ <%=varPreco%></B></TD>
                    </TR>
                    <TR>
                      <TD COLSPAN=3 HEIGHT=2 align=right class="corpo"><B><b>Frete:</b></B></TD>
                      <TD VALIGN=top ALIGN=right class="corpo"><B> R$
                            <% if Trim(varFrete) <> "" then 
								Response.Write(varFrete)
							   end if
							%>
                      </B></TD>
                    </TR>
                    <TR>
                      <TD COLSPAN=3 HEIGHT=2 align=right class="corpo"><B><b>Total:</b></B></TD>
                      <TD VALIGN=top ALIGN=right class="corpo"><B> R$
                            <% if Trim(varPreco) <> "" then 
								Response.Write(varPreco)
							   end if
							%>
                      </B></TD>
                    </TR>
                  </table>
                  <table width=500>
                    <tr>
                      <td class="corpo"> Recomendamos <a href='javascript:;' onClick='window.print();return false'>IMPRIMIR</a> este recibo.
                          <CENTER>
                            <hr>
                            <br>
                        
                        <A href="index.asp"><IMG height=24 src="img/Bt_Voltar.jpg" width=91 border=0></A>
                          </CENTER>
                      </td>
                    </tr>
                  </table>
                </TD>
              </TR>
            </table>
          </div>
     
      <% End If %>
    </table></td>
  </tr>
</table>
</body>
		</html>


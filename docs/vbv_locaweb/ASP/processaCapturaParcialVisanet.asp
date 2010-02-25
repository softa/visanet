<!--
'-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
' Kit de Integração Visanet VBV
' Versão: 3.0
' Arquivo: processaCapturaParcialVisanet.asp
' Função: Página de retorno da captura transação
'-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
-->
<%
' Exibe os valores de retorno da captura parcial
Response.write "Código da transação inicial: " & Request("tidmaster") & "<br>"
Response.write "Código da transação: " & Request("tid") & "<br>"
Response.write "Código de resposta da transação: " & Request("lr") & "<br>"
Response.write "Código de autorização: " & Request("arp") & "<br>"
Response.write "Valor da transação: " & Request("price") & "<br>"
Response.write "Identificação do Pedido na Loja: " & Request("orderid") & "<br>"
Response.write "Campo livre: " & Request("free") & "<br>"
Response.write "Mensagem da transação: " & Request("ars") & "<br>"
%>
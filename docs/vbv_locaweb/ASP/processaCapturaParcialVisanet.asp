<!--
'-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
' Kit de Integra��o Visanet VBV
' Vers�o: 3.0
' Arquivo: processaCapturaParcialVisanet.asp
' Fun��o: P�gina de retorno da captura transa��o
'-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
-->
<%
' Exibe os valores de retorno da captura parcial
Response.write "C�digo da transa��o inicial: " & Request("tidmaster") & "<br>"
Response.write "C�digo da transa��o: " & Request("tid") & "<br>"
Response.write "C�digo de resposta da transa��o: " & Request("lr") & "<br>"
Response.write "C�digo de autoriza��o: " & Request("arp") & "<br>"
Response.write "Valor da transa��o: " & Request("price") & "<br>"
Response.write "Identifica��o do Pedido na Loja: " & Request("orderid") & "<br>"
Response.write "Campo livre: " & Request("free") & "<br>"
Response.write "Mensagem da transa��o: " & Request("ars") & "<br>"
%>
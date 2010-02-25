<!--
'-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
' Kit de Integração Visanet VBV
' Versão: 3.0
' Arquivo: processaCancelamentoVisanet.asp
' Função: Página de retorno do cancelamento da transação
'-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
-->
<%
' Recupera os valores de retorno do cancelamento
tid = Request("tid")
lr = Request("lr")
ars = Request("ars")
free = Request("free")

' Exibe os valores de retorno do cancelamento
Response.write ars & "<br>"
Response.write tid & "<br>"
Response.write lr & "<br>"
Response.write free & "<br>"
%>
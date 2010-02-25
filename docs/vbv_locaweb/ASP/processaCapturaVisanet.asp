<!--
'-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
' Kit de Integração Visanet VBV
' Versão: 3.0
' Arquivo: processaCapturaVisanet.asp
' Função: Página de retorno da captura transação
'-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
-->
<%
' Recupera os valores de retorno da captura
tid = Request("tid")
lr = Request("lr")
cap = Request("cap")
ars = Request("ars")

' Exibe os valores de retorno da captura
Response.write ars & "<br>"
Response.write tid & "<br>"
Response.write lr & "<br>"
Response.write cap
%>
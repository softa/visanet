<!--
'-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
' Kit de Integra��o Visanet VBV
' Vers�o: 3.0
' Arquivo: processaCapturaVisanet.asp
' Fun��o: P�gina de retorno da captura transa��o
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
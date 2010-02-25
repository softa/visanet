<!--
'-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
' Kit de Integra��o Visanet VBV
' Vers�o: 3.0
' Arquivo: reciboVisanet.asp
' Fun��o: P�gina de retorno da transa��o
'-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
-->
<%
' Define valores do estabelecimento
codIdentificacao = "" ' c�digo de identifica��o da configura��o (deve ser igual ao informado no Painel de Controle de Com�rcio Eletr�nico Locaweb, na respectiva configura��o do meio de pagamento).
ambiente = "" ' ambiente da configura��o junto � LocaWeb.
URLRetornoVisa = "" 'URL de retorno para transa��es Visanet.

' Verifica se o lr j� foi capturado
If Request("ARS") = "" Then

   'monta os valores de retorno para captura do lr
   valores = valores & "?tid=" & request("tid")
   valores = valores & "&modulo=VISAVBV"
   valores = valores & "&operacao=Retorno"
   valores = valores & "&identificacao=" & codIdentificacao
   valores = valores & "&ambiente=" & ambiente
   'O endere�o de retorno deve ser ajustado para o endere�o de sua p�gina
   valores = valores & "&URLRetornoVisa=" & Server.URLEncode(URLRetornoVisa)

   'Contacta o servidor de comercio eletronico para obter o status da transa��o (lr)
   Set objDynu = Server.CreateObject("Dynu.HTTP")
      objDynu.SetUrl "https://comercio.locaweb.com.br/comercio.comp" & valores
      EnviaVisanet = objDynu.GetURL()
      Response.write EnviaVisanet
   Set objDynu = Nothing

Else

' Exibe as v�riaveis de retorno
Response.write "C�digo da transa��o: " & Request("tid") & "<br>"
Response.write "C�digo de resposta da transa��o: " & Request("lr") & "<br>"
Response.write "C�digo de autoriza��o: " & Request("arp") & "<br>"
Response.write "Valor da transa��o: " & Request("price") & "<br>"
Response.write "Identifica��o do Pedido na Loja: " & Request("orderid") & "<br>"
Response.write "Campo livre: " & Request("free") & "<br>"
Response.write "Mensagem da transa��o: " & Request("ars") & "<br>"
Response.write "Tipo de Autentica��o: " & Request("authenttype") & "<br>"
Response.write "HASH do n.� do cart�o (criptografado): " & Request("pan") & "<br>"
Response.write "C�digo do banco emissor do cart�o: " & Request("bank")

End If
%>
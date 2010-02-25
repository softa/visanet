<!--
'-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
' Kit de Integração Visanet VBV
' Versão: 3.0
' Arquivo: reciboVisanet.asp
' Função: Página de retorno da transação
'-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
-->
<%
' Define valores do estabelecimento
codIdentificacao = "" ' código de identificação da configuração (deve ser igual ao informado no Painel de Controle de Comércio Eletrônico Locaweb, na respectiva configuração do meio de pagamento).
ambiente = "" ' ambiente da configuração junto à LocaWeb.
URLRetornoVisa = "" 'URL de retorno para transações Visanet.

' Verifica se o lr já foi capturado
If Request("ARS") = "" Then

   'monta os valores de retorno para captura do lr
   valores = valores & "?tid=" & request("tid")
   valores = valores & "&modulo=VISAVBV"
   valores = valores & "&operacao=Retorno"
   valores = valores & "&identificacao=" & codIdentificacao
   valores = valores & "&ambiente=" & ambiente
   'O endereço de retorno deve ser ajustado para o endereço de sua página
   valores = valores & "&URLRetornoVisa=" & Server.URLEncode(URLRetornoVisa)

   'Contacta o servidor de comercio eletronico para obter o status da transação (lr)
   Set objDynu = Server.CreateObject("Dynu.HTTP")
      objDynu.SetUrl "https://comercio.locaweb.com.br/comercio.comp" & valores
      EnviaVisanet = objDynu.GetURL()
      Response.write EnviaVisanet
   Set objDynu = Nothing

Else

' Exibe as váriaveis de retorno
Response.write "Código da transação: " & Request("tid") & "<br>"
Response.write "Código de resposta da transação: " & Request("lr") & "<br>"
Response.write "Código de autorização: " & Request("arp") & "<br>"
Response.write "Valor da transação: " & Request("price") & "<br>"
Response.write "Identificação do Pedido na Loja: " & Request("orderid") & "<br>"
Response.write "Campo livre: " & Request("free") & "<br>"
Response.write "Mensagem da transação: " & Request("ars") & "<br>"
Response.write "Tipo de Autenticação: " & Request("authenttype") & "<br>"
Response.write "HASH do n.º do cartão (criptografado): " & Request("pan") & "<br>"
Response.write "Código do banco emissor do cartão: " & Request("bank")

End If
%>
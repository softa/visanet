<!--
'-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
' Kit de Integração Visanet VBV
' Versão: 3.0
' Arquivo: formVisanetComponente.asp
' Função: Postagem dos dados para inicio da transação via componente
'-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
-->
<%
Set objDynu = Server.CreateObject("Dynu.HTTP")

' Parâmetros obrigatórios
valores = "https://comercio.locaweb.com.br/comercio.comp"
valores = valores & "?identificacao="& Request("identificacao")
valores = valores & "&ambiente="& Request("ambiente")
valores = valores & "&modulo=VISAVBV"
valores = valores & "&operacao=Pagamento"
valores = valores & "&price="& Request("price")
valores = valores & "&damount="& Request("damount")
valores = valores & "&tid="& Request("tid")
valores = valores & "&orderid="& Request("orderid")
valores = valores & "&order="& Request("order")

' Parâmetros adicionais
valores = valores & "&bin="& Request("bin")
valores = valores & "&language="& Request("language")
valores = valores & "&authenttype="& Request("authenttype")
valores = valores & "&free="& Request("free")
valores = valores & "&visa_antipopup="& Request("visa_antipopup")

objDynu.SetUrl valores
EnviaVisanet = objDynu.GetURL()

Response.write EnviaVisanet

Set objDynu = Nothing
%>
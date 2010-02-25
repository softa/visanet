<!--
'-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
' Kit de Integração Visanet VBV
' Versão: 3.0
' Arquivo: GeraTID.asp
' Função: Contém a função para gerar o código de identificação (TID) das transações
'-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
-->
<%
function GerarTid(shopid,pagamento)


if len(shopid)<> 10 then
   response.write("Tamanho do shopid deve ser 10 dígitos")
   exit function
else
   if not isnumeric(shopid) then
      response.write("Shopid deve ser numérico")
      exit function
   end if
end if

shopid = mid(shopid,5,5)



if len(pagamento)<> 4 then
   response.write("Tamanho do código de pagamento deve ser 4 dígitos.")
   exit function
end if


'Hora Minuto Segundo e Décimo de Segundo

hora=right("00" & hour(time),2)
minuto=right("00" & minute(time),2)
segundo=right("00" & second(time),2)

'Na falta do décimo de segundo "d", utilizar função "proximo"
hhmmssd=hora&minuto&segundo&proximo

'Obter Data Juliana
d0=DateSerial (year(date), "1", "1")
datajuliana=right("000" & (Date - d0 + 1),3)


'obter último dígito do ano
ano = right(year(date()),1)


'Formatar Tid
GerarTid=shopid&ano&datajuliana&hhmmssd&pagamento


end function

function proximo

    if application("dc")=9 then
	    application("dc")=0
    else
        application("dc")=application("dc")+1
    end if
    proximo=application("dc")
 
end function

' Número de afiliação da loja junto ao Visanet
afiliacao = "1001734898"

' Código de pagamento, formado pelo tipo de pagamento + número de parcelas
codpagto = "1001"

Response.write GerarTid(afiliacao,codpagto)
%>
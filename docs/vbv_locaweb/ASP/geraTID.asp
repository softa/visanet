<!--
'-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
' Kit de Integra��o Visanet VBV
' Vers�o: 3.0
' Arquivo: GeraTID.asp
' Fun��o: Cont�m a fun��o para gerar o c�digo de identifica��o (TID) das transa��es
'-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
-->
<%
function GerarTid(shopid,pagamento)


if len(shopid)<> 10 then
   response.write("Tamanho do shopid deve ser 10 d�gitos")
   exit function
else
   if not isnumeric(shopid) then
      response.write("Shopid deve ser num�rico")
      exit function
   end if
end if

shopid = mid(shopid,5,5)



if len(pagamento)<> 4 then
   response.write("Tamanho do c�digo de pagamento deve ser 4 d�gitos.")
   exit function
end if


'Hora Minuto Segundo e D�cimo de Segundo

hora=right("00" & hour(time),2)
minuto=right("00" & minute(time),2)
segundo=right("00" & second(time),2)

'Na falta do d�cimo de segundo "d", utilizar fun��o "proximo"
hhmmssd=hora&minuto&segundo&proximo

'Obter Data Juliana
d0=DateSerial (year(date), "1", "1")
datajuliana=right("000" & (Date - d0 + 1),3)


'obter �ltimo d�gito do ano
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

' N�mero de afilia��o da loja junto ao Visanet
afiliacao = "1001734898"

' C�digo de pagamento, formado pelo tipo de pagamento + n�mero de parcelas
codpagto = "1001"

Response.write GerarTid(afiliacao,codpagto)
%>
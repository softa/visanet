<%
'Funcao respons�vel for formatar o Transaction ID (TID)


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

shopid = mid(shopid,4,5)


if len(pagamento)<> 4 then
   response.write("Tamanho do c�digo de pagamento deve ser 4 d�gitos.")
   exit function
end if


if not isnumeric(frequencia) then
   response.write("Frequ�ncia deve ser num�rica")
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


'Preencher c�digo do Produto
'produto="0"

'Preencher frequencia do Produto utilizado
'frequencia="000"

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


function GerarTidOld(shopid,pagamento)


if len(shopid)<> 10 then
   response.write("Tamanho do shopid deve ser 10 d�gitos")
   exit function
else
   if not isnumeric(shopid) then
      response.write("Shopid deve ser num�rico")
      exit function
   end if
end if


if len(pagamento)<> 4 then
   response.write("Tamanho do c�digo de pagamento deve ser 4 d�gitos.")
   exit function
end if


if not isnumeric(frequencia) then
   response.write("Frequ�ncia deve ser num�rica")
   exit function
end if



'N�mero da Maquineta
shopid_formatado=mid(shopid,4,6)

'Hora Minuto Segundo e D�cimo de Segundo

hora=right("00" & hour(time),2)
minuto=right("00" & minute(time),2)
segundo=right("00" & second(time),2)

'Na falta do d�cimo de segundo "d", utilizar fun��o "proximo"
hhmmssd=hora&minuto&segundo&proximo

'Obter Data Juliana
d0=DateSerial (year(date), "1", "1")
datajuliana=right("000" & (Date - d0 + 1),3)

'Preencher c�digo do Produto
'produto="0"

'Preencher frequencia do Produto utilizado
'frequencia="000"

'Formatar Tid
GerarTidOld=shopid_formatado&datajuliana&hhmmssd&pagamento


end function


function proximo

	if application("dc")=9 then
		application("dc")=0
	else
		application("dc")=application("dc")+1
	end if
	proximo=application("dc")
 
end function
%>
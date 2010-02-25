<%Function Geraopcoes(valor,tp_produto)

dim avistaC, avistaD, parceladoE, parceladoL, parceladoD, preDatado
If tp_produto = 1 Then
	avista		= 1 'oferece opção de pagamento à vista com cartão de crédito. 1=sim, 0=não
	parceladoL	= 6 'oferece opção de pagamento parcelado Lojista com cartão de crédito. 0=não, número de parcelas (com juros à cargo da loja)
	parceladoE	= 12 'oferece opção de pagamento parcelado Emissor com cartão de crédito. 0=não, número de parcelas (com juros à cargo do cliente)
	avistaD		= 0
	


ElseIf tp_produto = 2 Then
	avista		= 0 'oferece opção de pagamento à vista com cartão de crédito. 1=sim, 0=não
	parceladoL	= 0 'oferece opção de pagamento parcelado Lojista com cartão de crédito. 0=não, número de parcelas (com juros à cargo da loja)
	parceladoE	= 0 'oferece opção de pagamento parcelado Emissor com cartão de crédito. 0=não, número de parcelas (com juros à cargo do cliente)
	avistaD		= 1
	


End If


if avista = 1 then%>

<input type="radio" name="pagamento" value="1001" checked> R$ <%=FormatNumber(valor,2)%> à Vista <br>

<%end if%>

<% if parceladoL > 0 Then

	for x = 2 to parceladoL%>
		<input type="radio" name="pagamento" value="20<%If len(x) =1 Then%>0<%=x%><%else%><%=x%><%end if%>"> <%=x%> x de R$ <%=FormatNumber((valor / x ),2)%> sem juros <br>
<%	next
end if%>

<% if parceladoE > 0 Then

	for x = (parceladoE - (ParceladoL-1)) to parceladoE%>
		<input type="radio" name="pagamento" value="30<%If len(x) =1 Then%>0<%=x%><%else%><%=x%><%end if%>"><font color="red"> <%=x%> x de R$ <%=FormatNumber((valor / x ),2)%> com juros* </font><br>
<%	next

end if%>

<%if avistad = 1 then%>

	<input type="radio" name="pagamento" value="A001" checked> R$ <%=FormatNumber(valor,2)%> Débito à Vista <br>

<%end if%>




	

<%End Function%>
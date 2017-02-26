getNumbers = function(operation)
	os.execute("cls")
	local n = {}
	for k,v in next,{"primeiro","segundo"} do
		io.write("Digite o "..v.." numero para a "..operation..": ")
		n[#n+1] = io.read()
	end
	return n
end

menu = function()
	os.execute("cls")
	local choice
	local operations = {{"adicao",'+'},{"subtracao",'-'},{"multiplicacao",'*'},{"divisao",'/'},{"exponenciacao",'^'}}
	io.write("Informe o numero correspondente a uma das operacoes abaixo:\n")
	for k,v in next,operations do
		io.write(string.format("\t%d -> Operacao aritmetica de %s (X%sY)\n",k,v[1],v[2]))
	end
	io.write("\n> ")
	choice = io.read()
	choice = tonumber(choice)
	local numbers = getNumbers(operations[choice][1])
	os.execute("cls")
	io.write("A "..operations[choice][1].." entre "..numbers[1].." e "..numbers[2].." é: "..tostring(load("return "..numbers[1]..operations[choice][2]..numbers[2])()))
	os.execute("pause >nul")
	menu()
end

menu()

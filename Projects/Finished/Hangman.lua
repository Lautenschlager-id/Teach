math.randomseed = os.time()

_F = "Score: %d\n\n|---| %s\n| %s\n|%s%s%s\n|%s %s\n|\n|>%s"

words = {"apple","dog","juice","cookies","bring","ring","snow","german","sandwich","sadness","happiness","pressure","depression","sing","marriage","battery","halloween","christmas","reindeer","bee"}

table.find = function(list,value)
	for k,v in next,list do
		if v == value then
			return true
		end
	end
	return false
end

newWord = ""
user = {
	[1] = {}, -- Word
	[2] = {}, -- Is correct
	[3] = {}, -- Fail
	[4] = 0 -- Score
}

play = function()
	user = {{},{},{},user[4]}

	local nextWord = ""
	repeat
		nextWord = words[math.random(1,#words)]
	until newWord ~= nextWord
	newWord = nextWord

	local update = function()
		os.execute("cls")
		local man = {}
		for k,v in next,{"O","/","|","\\","/","\\"} do
			man[#man+1] = (#user[3] >= k and v or "")
		end
		man[#man+1] = table.concat(user[1])

		print(_F:format(user[4],table.concat(user[3]," "),unpack(man)))
	end

	while #user[3] < 6 do
		for i = 1,#newWord do
			local letter = newWord:sub(i,i)
			user[1][i] = " "..(table.find(user[2],letter) and letter or "_")
		end

		update()

		if not table.find(user[1]," _") then
			print("\nSuccess!\n")
			break
		end

		local newLetter = ""
		repeat
			io.write("\nLetter: ")
			newLetter = io.read()
			newLetter = newLetter:lower()
		until #newLetter == 1 and newLetter:find("^%a") and not table.find(user[2],newLetter) and not table.find(user[3],newLetter)
		
		local index = (newWord:find(newLetter) and 2 or 3)
		user[index][#user[index]+1] = newLetter
	end

	if #user[3] >= 6 then
		update()
		print("\nThe word was \""..newWord.."\"...\n")
	else
		user[4] = user[4] + 1
	end

	os.execute("pause")
	play()
end

play()

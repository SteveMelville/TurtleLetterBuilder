function generateLetter(letter)
	array = {}

	for i=1,3 do
	   array[i] = {}		
	   for j=1,5 do
		  array[i][j] = i*j
	   end		
	end
	
	for i=1,3 do
	   for j=1,5 do
		  array[i][j] = true
	   end
	end
	
	--position 1 1
	if(letter == 1 or letter == 3 or letter == 13 or letter == 14 or letter == 22 or letter == 23 or letter == 24)
	then
		array[1][1] = false
	end
	
	--position 2 1
	if(letter == 8 or letter == 11 or letter == 12 or letter == 13 or letter == 14 or letter == 21 or letter == 22 or letter == 23 or letter == 24 or letter == 25)
	then
		array[2][1] = false
	end
	
	--position 3 1
	if(letter == 1 or letter == 2 or letter == 3 or letter == 4 or letter == 12 or letter == 13 or letter == 14 or letter == 22 or letter == 23 or letter == 24)
	then
		array[3][1] = false
	end
	
	--position 1 2
	if(letter == 9 or letter == 10 or letter == 20 or letter == 24 or letter == 26)
	then
		array[1][2] = false
	end
	
	--position 2 2
	if(letter ~= 9 and letter ~= 10 and letter ~= 20)
	then
		array[2][2] = false
	end
	
	--position 3 2
	if(letter == 5 or letter == 6 or letter == 9 or letter == 10 or letter == 12 or letter == 14 or letter == 19 or letter == 20 or letter == 24)
	then
		array[3][2] = false
	end
	
	--position 1 3
	if(letter == 9 or letter == 10 or letter == 20 or letter == 25)
	then
		array[1][3] = false
	end
	
	--position 2 3
	if(letter == 3 or letter == 4 or letter == 12 or letter == 15 or letter == 21 or letter == 22 or letter == 23 or letter == 24)
	then
		array[2][3] = false
	end
	
	--position 3 3
	if(letter == 2 or letter == 3 or letter == 5 or letter == 6 or letter == 9 or letter == 10 or letter == 11 or letter == 12 or letter == 18 or letter == 20 or letter == 25)
	then
		array[3][3] = false
	end
	
	--position 1 4
	if(letter == 7 or letter == 9 or letter == 10 or letter == 17 or letter == 19 or letter == 20 or letter == 24 or letter == 25)
	then
		array[1][4] = false
	end
	
	--position 2 4
	if(letter ~= 9 and letter ~= 10 and letter ~= 20 and letter ~= 23 and letter ~= 24 and letter ~= 25)
	then
		array[2][4] = false
	end
	
	--position 3 4
	if(letter == 5 or letter == 6 or letter == 9 or letter == 10 or letter == 12 or letter == 16 or letter == 20 or letter == 24 or letter == 25 or letter == 26)
	then
		array[3][4] = false
	end
	
	--position 1 5
	if(letter == 3 or letter == 17 or letter == 20 or letter == 22 or letter == 25)
	then
		array[1][5] = false
	end
	
	--position 2 5
	if(letter == 1 or letter == 6 or letter == 8 or letter == 11 or letter == 13 or letter == 14 or letter == 16 or letter == 17 or letter == 18 or letter == 23 or letter == 24)
	then
		array[2][5] = false
	end
	
	--position 3 5
	if(letter == 2 or letter == 3 or letter == 4 or letter == 6 or letter == 10 or letter == 16 or letter == 20 or letter == 22 or letter == 25)
	then
		array[3][5] = false
	end
	
	if(letter == 27)
	then
		for i=1,3 do
		   for j=1,5 do
			  array[i][j] = false
		   end
		end
	end
	
	return array
end

letters = {}

for i=1,27 do
    letters[i] = generateLetter(i)
end


function printLetters(which)
	print(letters[which][1][1] .. letters[which][2][1] .. letters[which][3][1] .. "\n" .. letters[which][1][2] .. letters[which][2][2] .. letters[which][3][2] .. "\n" .. letters[which][1][3] .. letters[which][2][3] .. letters[which][3][3] .. "\n" .. letters[which][1][4] .. letters[which][2][4] .. letters[which][3][4] .. "\n" .. letters[which][1][5] .. letters[which][2][5] .. letters[which][3][5])
end


function outOfBlocks()
	if(turtle.getItemCount == 0)
	then
		if(turtle.getSelectedSlot() < 16)
		then
			turtle.select(turtle.getSelectedSlot() + 1)
		end
	end
end

function buildLetter(letter)
	local x,y = 1,5
	turtle.down()
	turtle.down()
	turtle.down()
	turtle.down()
	turtle.down()
	for i=1, 5 do
		if(letters[letter][x][y])
		then
			turtle.placeDown()
			outOfBlocks()
		end
		x = 2
		turtle.forward()
		if(letters[letter][x][y])
		then
			turtle.placeDown()
			outOfBlocks()
		end
		x = 3
		turtle.forward()
		if(letters[letter][x][y])
		then
			turtle.placeDown()
			outOfBlocks()
		end
		y = y - 1
		turtle.up()
		
		turtle.back()
		turtle.back()
		x = 1
	end
end


word = "hello"
word = string.lower(word)
length = string.len(word)

turtle.select(1)
turtle.refuel()
turtle.up()
turtle.up()
turtle.up()
turtle.up()
turtle.up()
turtle.forward()
turtle.select(2)

for i = 1, length, 1 do
	letter = string.byte(word, i) - 96
	if(letter >= 1 and letter <= 27)
	then
		printLetters(letter)
		print()
		buildLetter(letter)
		for i=1, 5 do
			turtle.forward()
		end
	end
end



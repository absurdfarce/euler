data = File.new("euler11_data.txt")

foo = []
fooidx = 0
data.each_line { |line|

	foo[fooidx] = []
	line.split(/\s/).each_with_index { |obj,i|

		foo[fooidx][i] = obj.to_i
	}
	fooidx += 1
}

print foo[1][2],"\n"

max = 0

# Check verticals first
0.upto(16) { |row|
	
	0.upto(19) { |col|
	
		bar = foo[row][col] * foo[row + 1][col] * foo[row + 2][col] * foo[row + 3][col]		
		#print "Vertical row: ",row,", col: ",col,", sum: ",bar,"\n"
		if bar > max
			max = bar
		end
	}
}

# Now horizontals
0.upto(19) { |row|
	
	0.upto(16) { |col|
	
		bar = foo[row][col] * foo[row][col + 1] * foo[row][col + 2] * foo[row][col + 3]		
		#print "Horizontal row: ",row,", col: ",col,", sum: ",bar,"\n"
		if bar > max
			max = bar
		end
	}
}

# Check SE diagonals
0.upto(16) { |row|
	
	0.upto(16) { |col|
	
		bar = foo[row][col] * foo[row + 1][col + 1] * foo[row + 2][col + 2] * foo[row + 3][col + 3]		
		#print "Horizontal row: ",row,", col: ",col,", sum: ",bar,"\n"
		if bar > max
			max = bar
		end
	}
}

# Check SW diagonals
0.upto(16) { |row|
	
	19.downto(3) { |col|
	
		bar = foo[row][col] * foo[row + 1][col - 1] * foo[row + 2][col - 2] * foo[row + 3][col - 3]		
		#print "SE diagonal row: ",row,", col: ",col,", sum: ",bar,", NE: ",foo[row][col],", SW: ",foo[row - 3][col - 3],"\n"
		if bar > max
			max = bar
		end
	}
}
print "Max is ",max,"\n"

def is_palindrome? (val)

	val_str = val.to_s
	return val_str.length == 6 &&
		val_str[0] == val_str[5] &&
		val_str[1] == val_str[4] &&
		val_str[2] == val_str[3]
end

# Go all the way down, although we only need one answer.  Could break out of 
# these iterators once we find a satisfactory result... but I'm not sure how to
# do that yet.
999.downto(900) do |val1|

	(val1 - 1).downto(val1 - 101) do |val2|
	
		multiple = val1 * val2
		if is_palindrome? multiple
			print "Palindrome: ",val1," ",val2,"\n"
		end
	end
end

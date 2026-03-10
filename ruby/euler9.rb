# c = sqrt(a**2 + b**2)
# a + b + sqrt(a**2 + b**2) = 1000
# a**2 + b**2 = (1000 - a - b)**2
# a**2 + b**2 = 1000**2 - 1000a - 1000b + (-1000a + a**2 + ab) + (-1000b + ab + b**2)
# a**2 + b**2 = 1000000 - 1000a -1000b - 1000a + a**2 + ab - 1000b + ab + b**2
# 0 = 1000000 - 2000a - 2000b + 2ab
# 1000000 = 2000a + 2000b - 2ab
# 500000 = 1000a + 1000b - ab
# 500000 - 1000b = 1000a - ab
# (500000 - 1000b) = a (1000 - b)
# (500000 - 1000b)/(1000 - b) = a

# Find candidates for a, b.  For each of them, add their squares 
# and determine if the result is a perfect square.
(1...1000).each do |b|

	a = (500000 - 1000 * b)/(1000 - b)
	if (a.to_int == a && a > 0)
		c = a**2 + b**2
		csqrt = Math.sqrt(c)
		if (csqrt.to_int == csqrt)
			prod = a * b * csqrt
			puts a,b,csqrt,prod,"\n"
		end
	end
end

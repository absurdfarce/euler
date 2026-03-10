# This solution assumes that the largest prime is < 10000.  No real basis for
# this assumption, just intuition.
arr = Array.new(9999)
arr.fill {|index| index + 2 }

target = 317584931803

# Simple Sieve of Eratosthenes implementation
while target != 1
	prime = arr.shift
	arr.delete_if { |item| item % prime == 0 }		
	if target % prime == 0
		target = target/prime
	end
end
puts prime

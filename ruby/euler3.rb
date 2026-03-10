start = 317584931803

# This solution assumes that the largest prime is < 10000.  No real basis for
# this assumption, just intuition.
b = Array.new(9999)
b.fill {|index| index + 2 }

# Simple Sieve of Eratosthenes implementation
def sieve(arr)
	start = 317584931803
	if arr.empty?
		return []
	end
	prime = arr.shift
	if start % prime == 0
		puts prime
	end
	return [prime] + sieve(arr.delete_if { |item| item % prime == 0 })
end

primes = sieve(b)


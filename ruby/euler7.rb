# Assuming no knowledge of the magnitude of the 10001st prime, so
# Sieve of Eratosthenes doesn't really apply here; we don't have any
# way to bound the set of numbers we're considering (and therefore eliminating
# as the program progresses).
#
# So we settle for second-best; brute force over a limited set of candidates
# until we find everything we need.
#
# bmcguire$ time ruby euler7.rb
# 104743
#
# real    0m36.372s
# user    0m35.448s
# sys     0m0.091s

# Once again, Python's generators are a more natural way to express "the list
# of all candidate primes"

# Start with all primes less than 10
primes = [2,3,5,7]
limit = 10001
	
possiblePrimes do|candidate|
	
	if primes.length >= limit
		break
	end
	#puts "Candidate: ",candidate
	if primes.all? { |prime| candidate % prime != 0 }
		primes.push candidate
		#puts "Winner: ",candidate
	end
end

puts primes[limit - 1]


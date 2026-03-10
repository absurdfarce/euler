def sieve()

	primes = []
	init = [2,3,5,7]

	# We start using tests array at 11; square root of 11 is
	# greater than 2 and 3 but not 5
	tests = [2,3]

	# Index of the last "failed" sample from primes (i.e. the last
	# checked prime which was not less than or equal to the pivot
	# value.
	testidx = 2

	pow = 10

	while 1
		if init.length > 0
			rv = init.shift
			primes.push rv
			yield rv
		else
			[1,3,7,9].each { |item|

				candidate = pow + item
				pivot = Math.sqrt(candidate)

				# Tests array can only grow larger; start
				# with the last failed index and see if we're
				# less than or equal to the pivot.
				sample = primes[testidx]
				while sample != nil and sample <= pivot and testidx <= (primes.length - 1)

					tests.push sample
					testidx += 1
					sample = primes[testidx]
				end

				test = tests.any? do |obj|
					candidate % obj == 0
				end
				if not test

					# Since we're testing primes that are
					# less than or equal to the square root
					# of our candidate value (which can be
					# no more than two million) we preserve
					# only primes that are less than or
					# equal to sqrt(2000000) = 1414.214
					if candidate < 1415
						primes.push candidate
					end
					yield candidate
				end
			}
			pow += 10
		end
	end
end

total = 0
cnt = 0
sieve do |prime|

	if prime < 2000000
		total += prime
		cnt += 1
		if rand < 0.001
			print "New prime: ",prime,", count: ",cnt,"\n"
		end
	else
		break
		print "Shouldn't be here"
	end
end

puts "Total: ",total,"\n"
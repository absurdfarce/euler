# Python's generators are a more natural fit here.  What we really need is something to
# provide the set of even Fibonacci numbers up to some limit, ideally encapsulating all
# logic surrounding the generation of these numbers within that function.  Python's
# generators do this, but Ruby's syntax is a bit more constrained; there doesn't appear
# to be any way to get the array of all values that would be yielded by a function.
def fibToMil(limit)
	curr = 2
	prev = 1
	while curr < limit
		yield curr
		prev,curr = curr,curr + prev # next
		prev,curr = curr,curr + prev # second
		prev,curr = curr,curr + prev # third
	end
end

sum = 0
fibToMil(1000000) { |num| sum += num }
print sum


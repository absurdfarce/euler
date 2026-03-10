print (1...1000).find_all { |val| val % 3 == 0 || val % 5 == 0 }.inject {|sum,n| sum + n },"\n"



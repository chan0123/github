def integer_testing

	# small integer will have class Fixnum
	puts 1.class

	# bigger integer will have class Bignum
	puts 1221132344234321231321321.class

	# float class
	puts 12.34.class

	# integer division, so will give 33
	puts "100/3  is #{100/3}" 

	# float division, so will give 33.333333
	puts "100/3.0  is #{100/3.0}" 

	puts 1234.56.floor #1234
	puts 1234.11.ceil #1235

end


def string_testing
	# double quote will resolve the \t and \n
	#		a	
	# c
	# d
	puts "\ta\t\b\nc\nd"

	puts "Hello".reverse #olleH 
	puts "Hello".capitalize #Hello
	puts "Hello".downcase #hello
	puts "Hello".upcase #HELLO
	puts "Hello".length #5

end

def array_testing

	data_set = [] # empty array

	# clear the array, empty array, which is different from setting data_set to nil
	data_set.clear
	data_set = []

	data_set = ["a", "b", "c"]
	data_set << "d"

	puts data_set.inspect # return a string ["a", "b", "c", "d"]
	puts data_set # return the array which is abcd

	# create an array
	x = "1,5,3,8,2,3,4,5"
	array = x.split(',')
	puts array.inspect # ["1", "5", "3", "8", "2", "3", "4", "5"] # array of string

	array.sort
	array.uniq
	array.uniq!
	puts array.inspect #["1", "5", "3", "8", "2", "4"]

	array.delete_at(2) # delete position 2 in array
	array.delete("4") # delete string 4 in array
	array.push(100)
	puts array.inspect

end

def hash_testing

	person = {} # empty hash

	person = {'first_name'=>"Kevin", "last_name"=>"John"}
	puts person["first_name"] # Kevin
	puts person["last_name"] # John	
	puts person.key("Kevin") # first_name

	puts person.keys.inspect # ["first_name", "last_name"]
	puts person.values.inspect # ["Kevin", "John"]

	# hash to array
	puts person.to_a.inspect # [["first_name", "Kevin"], ["last_name", "John"]]

	# symbols (use as label)
	# store in memory one time
	# string will store each time
	puts "test".object_id
	puts :test.object_id
	puts "test".object_id 
	puts :test.object_id # same everytime

end

def boolean_testing

	puts true.class # Trueclass
	puts false.class # Falseclass

	puts 2.between?(1,4)

	puts [].empty?

	puts [1,2,3].include?(2)

	x = {"a"=>1, "b"=>2}.has_key?('a')
	y = {"a"=>1, "b"=>2}.has_value?(2)

	puts x
	puts y

end

def range_testing
	1..10 # include 10
	1...10 # exclue 10, same as 1..9


	(1..10).class #Range

	x = 1..10
	x.begin # 1
	x.end # 10
	x.first # 1
	x.last # 10

	y = 'a'..'m'

	# spread opeartor
	z = [*x] # [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
end	

#integer_testing
#string_testing
#array_testing
hash_testing
boolean_testing
range_testing
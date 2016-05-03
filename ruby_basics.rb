require 'date'

class RubyBasics

	attr_accessor :first_name, :last_name, :birthdate # create the getter and setter method
	attr_accessor :prefix
	attr_accessor :school
	attr_accessor :gpa
	attr_accessor :favorite_food
	attr_reader :created_at # read-only

	# constructor
	def initialize(first_name, last_name, school_status={}, favorite_food=[])
		self.first_name = first_name # self. is calling the setter function
		self.last_name = last_name
		@created_at = Time.now # no setter method is generated, so need to use @ sign
		self.birthdate = Date.new(2015,1,2)
		self.school = school_status[:school_name]
		self.gpa = school_status[:gpa]
		self.favorite_food = favorite_food
		puts sprintf("%.2f", self.gap) # this will print 2 decimal points for float
	end


	# class methods
	def self.class_method
	end

	# count the number of fruit inside person's favorite food
	def count_fruit_in_favorite_food
		count = 0
		fruit_array = ['apple', 'orange','banana'] # define the fruit array
		favorite_food.each do |food| 
			if fruit_array.include? food
				count = count + 1
			end
		end
		return count # not necessary, but just more clear to have that
	end

	# print out the full name of a person
	def full_name
		[@first_name, @last_name].join(' ')
	end

	def titled_name
		@prefix ||= "Mr. "
		titled_name = @prefix + full_name
	end

	def can_vote?
		(Date.today - @birthdate) > 18*365
	end

	def vote_status
		can_vote? ? "Can Vote" : "Cannot Vote" # ternary operator
	end

end

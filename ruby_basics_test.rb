require 'test/unit'
require_relative 'ruby_basics' # require_relative is for require files in same folder as this test file

class RubyBasicsTest < Test::Unit::TestCase

	def test_name
		person = RubyBasics.new("Peter", "Pan", {school_name: "UCLA", gpa: 3.0}, ['apple', 'orange','banana'])
		# make sure all the attributes are good
		assert_equal(person.last_name, "Pan")
		assert_equal(person.first_name, "Peter")
		assert_equal(person.full_name, "Peter Pan")
		assert_equal(person.birthdate.year, 2015)
		assert_equal(person.birthdate.month, 1)
		assert_equal(person.birthdate.day, 2)
		assert_equal(person.school, "UCLA")
		assert_equal(person.gpa, 3.0)
		assert_equal(person.count_fruit_in_favorite_food, 3)
		# check the method calls
		assert_equal(person.titled_name, "Mr. Peter Pan")
		assert_equal(person.can_vote?, false)
		assert_equal(person.vote_status, "Cannot Vote")
	end

	def test_date_read_only
		person = RubyBasics.new("Peter", "Pan")
		person.created_at = Time.now
	rescue NoMethodError # no need begin and end if it is inside method
		puts "created_at attribue is read-only, cannot be written"
	end





end

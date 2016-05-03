require 'test/unit'

class RubyTypesTest < Test::Unit::TestCase

	# ruby test method need to start with "test_"
	def test_integer
		assert_equal(1.class.to_s, "Fixnum")
		assert_equal(123132828321398932813298.class.to_s, "Bignum")

	end
end

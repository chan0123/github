#comment

require 'test/unit'
require_relative 'ruby_bits' # require_relative is for require files in same folder as this test file

class SimpleTest < Test::Unit::TestCase

	def test_new_game
		game = new_game(name="Street Figher II")
		assert_equal(game, {name: "Street Figher II", year: nil, system: nil})
	end

	def test_game_class
		game = Game.new("Street Figher II")
		assert_equal(game.name, "Street Figher II")
		assert_equal(game.year, nil)
		assert_equal(game.system, nil)

		begin
  			game2 = Game.new(nil)
		rescue Exception
  			puts "The Game does not have a name, but it is expected."
		end

	end

	def test_mixin_instance
		game = Game.new("Street Figher II")
		game.lend_to_friend("Peter") # call the mixin function
	end

	def test_mixin_class
		Game.find_all_from_user("Peter")
	end

	def test_yield
		games = [
		  Game.new('Contra', year: 1987, system: 'NES'),
		  Game.new('Civilization', year: 1991, system: 'PC'),
		  Game.new('The Legend of Zelda', year: 1986, system: 'NES'),
		  Game.new('Mega Man X2', year: 1995, system: 'SNES'),
		  Game.new('Super Metroid', year: 1994, system: 'SNES'),
		  Game.new('Sim City 2000', year: 1993, system: 'PC'),
		  Game.new('Starcraft', year: 1998, system: 'PC')
		]

		library = Library.new(games)

		library.simple_each_on_system("SNES") do 
			puts "found a SNES game"
		end

		library.each_on_system("SNES") do |g| 
			puts g.name
		end

		library.list { |game| "#{game.name} (#{game.system}) - #{game.year}" }

	end

	def test_proc
		games = [
		  Game.new('Contra', year: 1987, system: 'NES'),
		  Game.new('Civilization', year: 1991, system: 'PC'),
		  Game.new('The Legend of Zelda', year: 1986, system: 'NES'),
		  Game.new('Mega Man X2', year: 1995, system: 'SNES'),
		  Game.new('Super Metroid', year: 1994, system: 'SNES'),
		  Game.new('Sim City 2000', year: 1993, system: 'PC'),
		  Game.new('Starcraft', year: 1998, system: 'PC')
		]
		library = Library.new(games)
		print_details = Proc.new do |game|
			puts "in test_proc..."
 			puts "#{game.name} (#{game.system}) - #{game.year}"
		end
		library.exec_game("Contra", print_details)
	end


end

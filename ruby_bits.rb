# add a comment
# added one more comment
# 3 comment
# 4 comment
# add comment on branch
# comment

def new_game(name, year=nil, system=nil)
  {
    name: name,
    year: year,
    system: system
  }
end

module GameUtils

	def lend_to_friend(friend)
		puts "lend a game to friend #{friend}."
	end
end

module Utils

	def find_all_from_user(username)
		puts "find all the games from user #{username}"
	end
end	

class Game 

  include GameUtils # mixin for instance
  extend Utils # mixin for class
  
  attr_accessor :name, :year, :system # make name, year and system accessible 
  attr_reader :created_at # not allow someone to set it directly

 # when use attr_accessor, it is same as define those setter and getter methods
 # attr_accessor :baz

 # def baz=(value)
 # 	@baz = value
 # end
 
 # def baz
 # 	@baz
 # end

  def initialize(name, options={})
  	if name == nil
  		raise Exception.new("Game should have a name")
  	end	
  	self.name = name
  	self.year = options[:year]
  	self.system = options[:system]
  	@created_at = Time.now
  end

  def ==(game)
	name == game.name && system == game.system && year == game.year
  end

  def to_s
    self.name
  end

  def description
    "#{self} was released in #{self.year}."
  end
end

class ConsoleGame < Game
  def to_s
    "#{self.name} - #{self.system}"
  end
end

class Library
  attr_accessor :games

  def initialize(games = [])
    self.games = games
  end

  def add_game(game)
  	self.games << game
  	self.log(game.name)
  end

  def has_game?(search_game)
    for game in games
      return true if game == search_game
    end
    false
  end

  def simple_each_on_system(system)
  	puts "### simple_each_on_system: printing the game selected in system :#{system}"
    games.each do |game|
      yield if game.system == system
    end

    # yield will replace by the block statement
    # 
    # 	library.simple_each_on_system("SNES") do 
	#		puts "found a SNES game"
	#	end
  end

  def each_on_system(system)
  	puts "### printing the game selected in system :#{system}"
    games.each do |game|
      yield game if game.system == system
    end

    # yeild game will passing game object to the block, then print out the name
    # 
    # library.each_on_system("SNES") do |g| 
	#		puts g.name
	# end
  end

  def list
  	puts "### printing list of game..."
    games.each do |game|
      puts yield game
    end

    # in this way, can define a more generic method
    # control the format of printing when calling the functions
    # library.list { |game| "#{game.name} (#{game.system}) - #{game.year}" }
  end

  # action is a proc
  def exec_game(name, action)
    # find the game match the name
    game = games.detect do |game| 
      game.name == name      
    end
    action.call(game)
  end

  private 
  def log(game_name)
  	puts "#{game_name} is added to library"
  end

end








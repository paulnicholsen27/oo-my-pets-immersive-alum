class Owner
	attr_accessor :name, :pets
	attr_reader :species

	@@all = []

	def initialize(species)
		@species = species
		@@all << self
		@pets = _reset_pets
	end



	def self.all 
		@@all
	end

	def self.count
		@@all.length
	end

	def say_species
		"I am a #{@species}."
	end

	def self.reset_all
		@@all = []
	end

	def buy_fish(name)
		fish = Fish.new(name)
		self.pets[:fishes] << fish
	end

	def buy_cat(name)
		cat = Cat.new(name)
		self.pets[:cats] << cat 
	end

	def buy_dog(name)
		dog = Dog.new(name)
		self.pets[:dogs] << dog
	end

	def walk_dogs
		self.pets[:dogs].each {|dog| dog.mood = "happy"}
	end

	def play_with_cats
		self.pets[:cats].each {|cat| cat.mood = "happy"}
	end

	def feed_fish
		self.pets[:fishes].each {|fish| fish.mood = "happy"}
	end

	def sell_pets
		self.pets.each do |type, pets|
			pets.each do |pet|
				pet.mood = "nervous"
			end
		end
		@pets = _reset_pets
	end

	def list_pets
		dogs = @pets[:dogs].length
		cats = @pets[:cats].length
		fish = @pets[:fishes].length
		return "I have #{fish} fish, #{dogs} dog(s), and #{cats} cat(s)."
	end
	private
	def _reset_pets
		@pets = {:fishes => [],
				 :dogs => [],
				 :cats => []}
	end
end
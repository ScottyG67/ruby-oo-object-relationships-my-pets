require 'pry'
class Owner
  # code goes here

  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
    
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
    #Dog.reset_all
    #Cat.reset_all

  end

  def cats
    #binding.pry
    Cat.all.select{|cat|cat.owner==self}
  end

  def dogs
    Dog.all.select{|dog|dog.owner==self}
  end

  def buy_cat(cat_name_to_buy)
    Cat.new(cat_name_to_buy,self)
  end
  def buy_dog(dog_name_to_buy)
    Dog.new(dog_name_to_buy,self)
  end

  def walk_dogs
    dogs.each do |dog|
      dog.go_on_walk
    end
  end

  def feed_cats
    cats.each do |cat|
      cat.get_fed
    end
  end

  def sell_pets
    cats.each do |cat|
      cat.owner = nil
      cat.mood = "nervous"
    end

    dogs.each do |dog|
      dog.owner = nil
      dog.mood = "nervous"
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end
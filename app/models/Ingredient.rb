class Ingredient

@@all = []

def self.all
  @@all
end

def self.most_common_allergen
  allergen_hash = {}
  self.all.each {|ingredient|
    allergen_hash[ingredient] = 0
    Allergen.all.each {|allergen| if allergen.ingredient == ingredient
      allergen_hash[ingredient] += 1
    end}
  }

  allergen_hash.max_by {|ingredient, freq| freq}
end

  attr_accessor :name

  def initialize(name)
    @name = name
    @@all << self
  end

end

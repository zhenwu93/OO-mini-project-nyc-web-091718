class Recipe

@@all = []

def self.all
  @@all
end

def self.most_popular
  most_popular_hash = {}

  Recipe.all.each do |recipe|
    most_popular_hash[recipe] = 0
    RecipeCard.all.each do |recipecard|
      if recipecard.recipe == recipe
        most_popular_hash[recipe] += 1
      end
    end
  end

  most_popular_hash.max_by do |recipe, value|
    value
  end

end

def initialize(name)
  @name = name
  @@all << self
end

def users
RecipeCard.all.map do |recipe_card|
recipe_card.user
end
end

def ingredients
  recipe_ingredient = RecipeIngredient.all.select do |recipe_ingredient|
    recipe_ingredient.recipe == self
  end
  recipe_ingredient.map do |recipe_ingredient|
    recipe_ingredient.ingredient
  end

end

def allergens
  self.ingredients.select {|ingredient|
    Allergen.all.map{|allergen| allergen.ingredient}.include?(ingredient)}

end

def add_ingredients(ingredient_array)
  ingredient_array.each {|ingredient| RecipeIngredient.new(self, ingredient)}


end




end #end of Recipe class

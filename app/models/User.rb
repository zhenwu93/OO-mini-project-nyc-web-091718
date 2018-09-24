class User
   @@all = []
   def self.all
     @@all
   end

   def initialize(name)
     @name = name
     @@all << self
   end

   def recipes
     RecipeCard.all.select {|recipecard| recipecard.user == self}
   end

   def add_recipe_card(recipe, date, rating)
     RecipeCard.new(self, recipe, date, rating)
   end

   def declare_allergen(ingredient)
     Allergen.new(self, ingredient)
   end

   def user_allergens
     Allergen.all.select {|allergen| allergen.user == self}
     .map {|allergen| allergen.ingredient}
   end

   def top_3_recipes
     self.recipes.sort_by {|recipe| recipe.rating}.last(3)
   end

   def most_recent_recipe
     self.recipes.sort_by {|recipe| recipe.date}.last
   end

   ##safe recipes: recipes the user is not allergic to
   def safe_recipes
     #Look at each allergen. Look at each recipeingredient to determine if any ingredients match any allergens. return recipe if not
     allergens = self.user_allergens ##array of allergies (ingredients objects)
     ri_array = RecipeIngredient.all
     binding.pry
     allergens.each do |allergen|
       binding.pry
       ri_array.delete_if {|recipeingredient| recipeingredient.ingredient == allergen}
     end
     binding.pry
     ri_array.map {|recipeingredient| recipeingredient.recipe}


   end

end #end User class

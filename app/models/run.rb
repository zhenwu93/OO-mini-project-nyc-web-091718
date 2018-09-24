# require 'bundler/setup'
# Bundler.require
# require_rel './models'
require 'pry'
Dir['./app/models/*'].each {|file| require file}

binding.pry

u1 = User.new("Keevinnnn")
u2 = User.new("fdsdfsdf")
u3 = User.new("wingus")

r1 = Recipe.new("eggs")
r2 = Recipe.new("bacon")

i1 = Ingredient.new("dust")
i2 = Ingredient.new("bones")
i3 = Ingredient.new("Chips")
binding.pry
u1.add_recipe_card(r1, "today", "5")
u2.add_recipe_card(r2, "yesrerday", "0")
u3.add_recipe_card(r1, "hello", "2")


u1.declare_allergen(i1)
u1.declare_allergen(i2)
u2.declare_allergen(i2)
u3.declare_allergen(i2)

r1.add_ingredients([i1,i2])
r2.add_ingredients([i3])

#u1.safe recipes should return r2 aka bacon

binding.pry





00

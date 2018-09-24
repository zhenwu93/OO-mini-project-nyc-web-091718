class RecipeCard

@@all = []

def self.all
  @@all
end

attr_accessor :rating
attr_reader :user, :recipe, :date

  def initialize(user, recipe, date, rating)
    @user = user
    @recipe = recipe
    @date = date
    @rating = rating
    @@all << self
  end


end

records = JSON.parse(File.read('db/seeds/recipes.json'))
records.each do |record|
  if (record["category"] && !Category.find_by_name(record["category"]))
    category = Category.new
    category.name = record["category"]
    category.save!
  elsif (record["category"])  
    category = Category.find_by_name(record["category"])
  end
  if (record["cuisine"] && !Cuisine.find_by_name(record["cuisine"]))
    cuisine = Cuisine.new
    cuisine.name = record["cuisine"]
    cuisine.save!
  elsif (record["cuisine"])  
    cuisine = Cuisine.find_by_name(record["cuisine"])
  end
  if (record["author"] && !Author.find_by_name(record["author"]))
    author = Author.new
    author.name = record["author"]
    author.save!
  elsif (record["author"])  
    author = Author.find_by_name(record["author"])
  end

  recipe = Recipe.new
  recipe.title = record["title"]
  recipe.prep_time = record["prep_time"]
  recipe.cook_time = record["cook_time"]
  recipe.ratings = record["ratings"]
  recipe.image = record["image"]
  recipe.author = author
  recipe.category = category
  recipe.cuisine = cuisine
  recipe.save!
  record["ingredients"].each do |ingredient|
    i = Ingredient.new
    i.description = ingredient
    i.recipe = recipe
    i.save!
  end
end

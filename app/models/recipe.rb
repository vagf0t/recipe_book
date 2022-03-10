
class Recipe < ApplicationRecord
  belongs_to :author
  belongs_to :category, optional: true
  belongs_to :cuisine, optional: true
  has_many :ingredients
  
  def self.all_recipes
    Recipe.includes(:author, :category, :cuisine, :ingredients)
        .select('recipes.title')
        .select('recipes.prep_time')
        .select('recipes.cook_time')
        .select('recipes.ratings as rating')
        .select('authors.name as author')
        .select('categories.name as category')
        .select('cuisines.name as cuisine')
        .select('recipes.id')
        .select('recipes.author_id')
        .select('recipes.category_id')
        .select('recipes.cuisine_id')
  end

  def self.search_results_for(params)
    query = Recipe.all_recipes
    query = define_criteria(query, params)
    query.group(:title)
    .group('recipes.prep_time')
    .group('recipes.cook_time')
    .group('recipes.ratings')
    .group('authors.name')
    .group('categories.name')
    .group('cuisines.name')
    .group('recipes.id')
    .group('authors.id')
    .group('categories.id')
    .group('cuisines.id')
    .group('ingredients.id')
    .distinct.order(ratings: :desc)
  end

  def self.define_criteria(query, params)
    search_input_criteria = params[:query]
    unless search_input_criteria.blank?
      query = query.where('recipes.title LIKE ? OR
                authors.name LIKE ? OR
                categories.name LIKE ? OR
                cuisines.name LIKE ? OR
                ingredients.description LIKE ?',
                          "%#{search_input_criteria}%",
                          "%#{search_input_criteria}%",
                          "%#{search_input_criteria}%",
                          "%#{search_input_criteria}%",
                          "%#{search_input_criteria}%")
    end
    name = params[:name_query]
    query = query.where('authors.name LIKE ?', "%#{name}%") unless name.blank?
    title = params[:title_query]
    query = query.where('recipes.title LIKE ?', "%#{title}%") unless title.blank?
    category = params[:category_query]
    query = query.where('categories.name LIKE ?', "%#{category}%") unless category.blank?
    cuisine = params[:cuisine_query]
    query = query.where('cuisines.name LIKE ?', "%#{cuisine}%") unless cuisine.blank?
    ingredient = params[:ingredient_query]
    query = query.where('ingredients.description LIKE ?', "%#{ingredient}%") unless ingredient.blank?
    ratings = params[:ratings_query]
    query = query.where('recipes.ratings >= ?', ratings.to_i) unless ratings.blank?
    prep_time = params[:prep_time_query]
    query = query.where('recipes.prep_time <= ?', prep_time.to_i) unless prep_time.blank?
    cook_time = params[:cook_time_query]
    query = query.where('recipes.cook_time <= ?', cook_time.to_i) unless cook_time.blank?
    
    query.references(:authors, :categories, :cuisines, :ingredients)
  end
end

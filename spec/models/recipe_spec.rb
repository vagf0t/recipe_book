require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it { should belong_to(:author) }
  it { should belong_to(:category) }
  it { should belong_to(:cuisine) }
  it { should have_many(:ingredients) }


  describe '#search_results_for' do
    context 'general search' do
      it 'should contain the right fields in the result set' do
        result = Recipe.search_results_for(query: 'jjelli1').first.attributes
        expect(result.keys).to contain_exactly(
          'title',
          'prep_time',
          'cook_time',
          'rating',
          'author',
          'category',
          'cuisine',
          'id',
          'author_id',
          'category_id',
          'cuisine_id',
          'created_at',
          'image',
          'ratings',
          'updated_at')
      end

      it 'should search in the author field' do
        results = Recipe.search_results_for(query: 'jjelli1')
        expect(results.all.map(&:author_id).size).to eq 1
      end

      it 'should search in the title field' do
        results = Recipe.search_results_for(query: "Crawfish Pistolettes")
        expect(results.count(:title).size).to eq 15
      end

      it 'should search in the category field' do
        results = Recipe.search_results_for(query: 'Crawfish Recipes')
        expect(results.all.map(&:category).size).to eq 3
      end

      it 'should search in the cuisine field' do
        results = Recipe.search_results_for(query: 'Crawfish Pistolettes')
        expect(results.all.map(&:cuisine).size).to eq 1
      end

      it 'should search in the ingredient field' do
        results = Recipe.search_results_for(query: '1 green bell pepper, finely chopped')
        expect(results.all.map(&:title).size).to eq 7
      end

    end

    context 'name query' do
      it 'should search by author' do
        results = Recipe.search_results_for(name_query: 'jjelli1')
        expect(results.all.map(&:title).size).to eq 1
      end
    end

    context 'title query' do
      it 'should search by title' do
        results = Recipe.search_results_for(title_query: 'Crawfish')
        expect(results.all.map(&:title).size).to eq 5
      end
    end

    context 'category query' do
      it 'should search by category' do
        results = Recipe.search_results_for(category_query: 'Crawfish')
        expect(results.all.map(&:title).size).to eq 3
      end
    end

    context 'ingredient query' do
      it 'should search by ingredient' do
        results = Recipe.search_results_for(ingredient_query: 'Cajun')
        expect(results.all.map(&:title).size).to eq 61
      end
    end

    context 'rating query' do
      it 'should filter by rating' do
        results = Recipe.search_results_for(rating_query: 5)
        expect(results.all.map(&:title).size).to eq 10013
      end
    end

    context 'preparation time query' do
      it 'should filter by preparation time' do
        results = Recipe.search_results_for(prep_time_query: 5)
        expect(results.all.map(&:title).size).to eq 1235
      end
    end

    context 'cook time query' do
      it 'should filter by cooking time' do
        results = Recipe.search_results_for(cook_time_query: 10)
        expect(results.all.map(&:title).size).to eq 3198
      end

    end

    context 'composite searches' do
      it 'should filter 5 star recipes that can be prepared in less than 10 minutes' do
        results = Recipe.search_results_for(ratings_query: 5, prep_time_query: 10)
        expect(results.count(:all).size).to eq 3592
      end

      it 'should filter recipes that are cooked in less than 20 and contain butter' do
        results = Recipe.search_results_for(cook_time_query: 20, ingredient_query: 'butter')
        expect(results.count(:all).size).to eq 1708
      end

      it 'should filter recipes of an author  and specific category' do
        results = Recipe.search_results_for(name_query: 'jjelli1', category_query: 'Crawfish')
        expect(results.count(:all).size).to eq 15
      end
    end
  end
end

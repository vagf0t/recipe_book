require 'rails_helper'

RSpec.describe Api::RecipesController, type: :controller do
  describe 'GET #index' do
    it 'renders empty json' do
      get :index
      expect(response.body).to eq '{[]}'
      expect(response.code).to eq '200'
    end
  end

  describe 'GET #search' do
    context 'param query' do
      it 'renders the search json' do
        expect(Recipe).to receive(:search_results_for).with(
            query: 'bar',
            controller: 'api/recipes',
            action: 'search').and_return 'foo'
        get :search, query: 'bar'
        expect(response.body).to eq 'foo'
        expect(response.code).to eq '200'
      end
    end

    context 'param category query' do
      it 'renders the search json' do
        expect(Recipe).to receive(:search_results_for).with(
            category_query: 'bar',
            controller: 'api/recipes',
            action: 'search').and_return 'foo'
        get :search, category_query: 'bar'
        expect(response.body).to eq 'foo'
        expect(response.code).to eq '200'
      end
    end

    context 'param name_query' do
      it 'renders the search json' do
        expect(Recipe).to receive(:search_results_for).with(
            name_query: 'bar',
            controller: 'api/recipes',
            action: 'search').and_return 'foo'
        get :search, name_query: 'bar'
        expect(response.body).to eq 'foo'
        expect(response.code).to eq '200'
      end
    end

    context 'param title_query' do
      it 'renders the search json' do
        expect(Recipe).to receive(:search_results_for).with(
            title_query: 'bar',
            controller: 'api/recipes',
            action: 'search').and_return 'foo'
        get :search, title_query: 'bar'
        expect(response.body).to eq 'foo'
        expect(response.code).to eq '200'
      end
    end

    context 'param ingredient_query' do
      it 'renders the search json' do
        expect(Recipe).to receive(:search_results_for).with(
            ingredient_query: 'bar',
            controller: 'api/recipes',
            action: 'search').and_return 'foo'
        get :search, ingredient_query: 'bar'
        expect(response.body).to eq 'foo'
        expect(response.code).to eq '200'
      end
    end

    context 'param ratings_query' do
      it 'renders the search json' do
        expect(Recipe).to receive(:search_results_for).with(
            ratings_query: 'bar',
            controller: 'api/recipes',
            action: 'search').and_return 'foo'
        get :search, ratings_query: 'bar'
        expect(response.body).to eq 'foo'
        expect(response.code).to eq '200'
      end
    end

    context 'param cuisine_query' do
      it 'renders the search json' do
        expect(Recipe).to receive(:search_results_for).with(
            cuisine_query: 'bar',
            controller: 'api/recipes',
            action: 'search').and_return 'foo'
        get :search, cuisine_query: 'bar'
        expect(response.body).to eq 'foo'
        expect(response.code).to eq '200'
      end
    end

    context 'param prep_time_query' do
      it 'renders the search json' do
        expect(Recipe).to receive(:search_results_for).with(
            prep_time_query: 'bar',
            controller: 'api/recipes',
            action: 'search').and_return 'foo'
        get :search, prep_time_query: 'bar'
        expect(response.body).to eq 'foo'
        expect(response.code).to eq '200'
      end
    end

    context 'param cook_time_query' do
      it 'renders the search json' do
        expect(Recipe).to receive(:search_results_for).with(
            cook_time_query: 'bar',
            controller: 'api/recipes',
            action: 'search').and_return 'foo'
        get :search, cook_time_query: 'bar'
        expect(response.body).to eq 'foo'
        expect(response.code).to eq '200'
      end
    end
  end
end

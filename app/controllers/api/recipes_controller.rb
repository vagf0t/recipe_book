
module Api
  class RecipesController < ApplicationController
    def index
      render json: '{[]}'
    end

    def search
      render json: Recipe.search_results_for(params)
    end
  end
end

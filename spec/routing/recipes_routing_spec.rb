require 'rails_helper'

RSpec.describe 'routes for Recipes', type: :routing do
  it 'routes api/recipes to the recipes controller' do
    expect(get: '/api/recipes').to route_to(controller: 'api/recipes', action: 'index')
  end

  it 'routes api/recipes/search to the recipes controller' do
    expect(get: '/api/recipes/search').to route_to(controller: 'api/recipes', action: 'search')
  end
end
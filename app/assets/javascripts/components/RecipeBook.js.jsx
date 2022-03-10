
var RecipeBook = createReactClass({
    getInitialState: function() {
        return { recipes: [],
            query: null,
            name_query: null,
            title_query: null,
            category_query: null,
            cuisine_query: null,
            ingredient_query: null,
            ratings_query: null,
            prep_time_query: null,
            cook_time_query: null};
    },
    componentDidMount: function() {
        this.getDataFromApi();
    },
    getDataFromApi: function() {
        var self = this;
        $.ajax({
            url: '/api/recipes',
            success: function(data) {
                self.setState({ recipes: data });
            },
            error: function(xhr, status, error) {
                console.log('Cannot get data from API: '+ error);
            }
        });
    },
    handleSearch: function(recipes,
                           query,
                           name_query,
                           title_query,
                           category_query,
                           cuisine_query,
                           ingredient_query,
                           ratings_query,
                           prep_time_query,
                           cook_time_query) {
        this.setState((prevState) => {
            return {
                recipes: prevState.recipes !== recipes ? recipes : prevState.recipes,
                query: prevState.query !== query ? query : prevState.query,
                name_query: prevState.name_query !== name_query ? name_query : prevState.name_query,
                title_query: prevState.title_query !== title_query ? title_query : prevState.title_query,
                category_query: prevState.category_query !== category_query ? category_query : prevState.category_query,
                cuisine_query: prevState.cuisine_query !== cuisine_query ? cuisine_query : prevState.cuisine_query,
                ingredient_query: prevState.ingredient_query !== ingredient_query ? ingredient_query : prevState.ingredient_query,
                ratings_query: prevState.ratings_query !== ratings_query ? ratings_query : prevState.ratings_query,
                cook_time_query: prevState.cook_time_query !== cook_time_query ? cook_time_query : prevState.cook_time_query,
                prep_time_query: prevState.prep_time_query !== prep_time_query ? prep_time_query : prevState.prep_time_query
            }
        });
    },
    render: function() {
        return(
            <div className="container">
                <div className="jumbotron">
                    <h1>Recipes Book</h1>
                    <p>find the recipe that matches the occasion</p>
                </div>
                <div className="row">
                    <div className="col-md-4">
                        <SearchForm
                            handleSearch={this.handleSearch}
                            name_query={this.state.name_query}
                            title_query={this.state.title_query}
                            category_query={this.state.category_query}
                            cuisine_query={this.state.cuisine_query}
                            ingredient_query={this.state.ingredient_query}
                            ratings_query={this.state.ratings_query}
                            cook_time_query={this.state.cook_time_query}
                            prep_time_query={this.state.prep_time_query}
                        />
                    </div>
                    <div className="col-md-2">
                        
                    </div>
                    <div className="col-md-2">
                        
                            <IngredientSearchForm
                                handleSearch={this.handleSearch}
                                query={this.state.query}
                                name_query={this.state.name_query}
                                title_query={this.state.title_query}
                                category_query={this.state.category_query}
                                prep_time_query={this.state.prep_time_query}
                                cook_time_query={this.state.cook_time_query}
                                ratings_query={this.state.ratings_query}
                                cuisine_query={this.state.cuisine_query}/>
                            
                    </div>
                    <div className="col-md-2">
                        
                    </div>
                    <div className="col-md-2">
                        
                    </div>
                </div>
                <div className="row">
                    <div className="col-md-12">
                        <RecipeTable
                            handleSearch={this.handleSearch}
                            recipes={this.state.recipes}
                            query={this.state.query}
                            name_query={this.state.name_query}
                            title_query={this.state.title_query}
                            category_query={this.state.category_query}
                            cuisine_query={this.state.cuisine_query}
                            ratings_query={this.state.ratings_query}
                            cook_time_query={this.state.cook_time_query}
                            prep_time_query={this.state.prep_time_query}
                        />
                    </div>
                </div>
            </div>
        )
    }
});

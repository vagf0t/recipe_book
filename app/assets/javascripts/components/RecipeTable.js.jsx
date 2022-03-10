
var RecipeTable = createReactClass({
    render: function() {
        var recipes = [];
        this.props.recipes.forEach(function(recipe) {
            recipes.push(<Recipe recipe={recipe}
                               key={'recipe' + recipe.id}/>);
        }.bind(this));
        return(
            <table className="table table-striped">
                <thead>
                <tr>
                    <th className="col-md-2">
                        <div>Author</div>
                        <div><NameSearchForm
                                handleSearch={this.props.handleSearch}
                                query={this.props.query}
                                title_query={this.props.title_query}
                                category_query={this.props.category_query}
                                cuisine_query={this.props.cuisine_query}
                                ingredient_query={this.props.ingredient_query}
                                ratings_query={this.props.ratings_query}
                                prep_time_query={this.props.prep_time_query}
                                cook_time_query={this.props.cook_time_query}/>
                        </div>
                    </th>
                    <th className="col-md-2">
                        <div>Title</div>
                        <div>
                            <TitleSearchForm
                                handleSearch={this.props.handleSearch}
                                query={this.props.query}
                                name_query={this.props.name_query}
                                category_query={this.props.category_query}
                                cuisine_query={this.props.cuisine_query}
                                ingredient_query={this.props.ingredient_query}
                                ratings_query={this.props.ratings_query}
                                prep_time_query={this.props.prep_time_query}
                                cook_time_query={this.props.cook_time_query}/>
                        </div>
                    </th>
                    <th className="col-md-2">
                        <div>Category</div>
                        <div>
                            <CategorySearchForm
                                handleSearch={this.props.handleSearch}
                                query={this.props.query}
                                name_query={this.props.name_query}
                                title_query={this.props.title_query}
                                cuisine_query={this.props.cuisine_query}
                                ingredient_query={this.props.ingredient_query}
                                ratings_query={this.props.ratings_query}
                                prep_time_query={this.props.prep_time_query}
                                cook_time_query={this.props.cook_time_query}/>
                        </div>
                    </th>
                    <th className="col-md-1">
                        <div>Cuisine</div>
                        <div>
                            <CuisineSearchForm
                                handleSearch={this.props.handleSearch}
                                query={this.props.query}
                                name_query={this.props.name_query}
                                title_query={this.props.title_query}
                                category_query={this.props.category_query}
                                ingredient_query={this.props.ingredient_query}
                                ratings_query={this.props.ratings_query}
                                prep_time_query={this.props.prep_time_query}
                                cook_time_query={this.props.cook_time_query}/>
                        </div>
                    </th>
                    <th className="col-md-1">
                        <div>Rating</div>
                        <div>
                            <RatingSearchForm
                                handleSearch={this.props.handleSearch}
                                query={this.props.query}
                                name_query={this.props.name_query}
                                title_query={this.props.title_query}
                                category_query={this.props.category_query}
                                cuisine_query={this.props.cuisine_query}
                                ingredient_query={this.props.ingredient_query}
                                cook_time_query={this.props.cook_time_query}
                                prep_time_query={this.props.prep_time_query}/>
                        </div>
                    </th>
                    <th className="col-md-1">
                        <div>Preperation Time (min)</div>
                        <div>
                            <PrepTimeSearchForm
                                handleSearch={this.props.handleSearch}
                                query={this.props.query}
                                name_query={this.props.name_query}
                                title_query={this.props.title_query}
                                category_query={this.props.category_query}
                                cuisine_query={this.props.cuisine_query}
                                ingredient_query={this.props.ingredient_query}
                                ratings_query={this.props.ratings_query}
                                cook_time_query={this.props.cook_time_query}/>
                        </div>
                    </th>
                    <th className="col-md-1">
                        <div>Cooking Time (min)</div>
                        <div>
                            <CookTimeSearchForm
                                handleSearch={this.props.handleSearch}
                                query={this.props.query}
                                name_query={this.props.name_query}
                                title_query={this.props.title_query}
                                category_query={this.props.category_query}
                                cuisine_query={this.props.cuisine_query}
                                ingredient_query={this.props.ingredient_query}
                                ratings_query={this.props.ratings_query}
                                prep_time_query={this.props.prep_time_query}/>
                        </div>
                    </th>
                </tr>
                </thead>
                <tbody>{recipes}</tbody>
            </table>
        )
    }
});

var CuisineSearchForm = createReactClass({
    handleSearch: function() {
        var cuisine_query = ReactDOM.findDOMNode(this.refs.cuisine_query).value;
        var query = this.props.query;
        var name_query = this.props.name_query;
        var title_query = this.props.title_query;
        var category_query = this.props.category_query;
        var ratings_query = this.props.ratings_query;
        var ingredient_query = this.props.ingredient_query;
        var cook_time_query = this.props.cook_time_query;
        var prep_time_query = this.props.prep_time_query;

        var self = this;
        $.ajax({
            url: '/api/recipes/search',
            data: { query: query,
                    name_query: name_query,
                    title_query: title_query,
                    category_query: category_query,
                    cuisine_query: cuisine_query,
                    ratings_query: ratings_query,
                    cook_time_query: cook_time_query,
                    prep_time_query: prep_time_query,
                    ingredient_query: ingredient_query},
            success: function(recipes) {
                self.props.handleSearch(
                    recipes,
                    query,
                    name_query,
                    title_query,
                    category_query,
                    cuisine_query,
                    ratings_query,
                    prep_time_query,
                    ingredient_query,
                    cook_time_query);
            },
            error: function(xhr, status, error) {
                alert('Search error: ', status, xhr, error);
            }
        });
    },
    render: function() {
        return(
            <input onChange={this.handleSearch}
                   type="text"
                   className="form-control"
                   placeholder="Search by cuisine..."
                   ref="cuisine_query"
                   id="cuisine_query_input"/>
        )
    }
});


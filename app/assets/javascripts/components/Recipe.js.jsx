var Recipe = createReactClass({
  propTypes: {
    author: PropTypes.string,
    title: PropTypes.string,
    category: PropTypes.string,
    rating: PropTypes.number,
    cook_time: PropTypes.number,
    prep_time: PropTypes.number,
    cuisine:  PropTypes.string,
    id: PropTypes.number,
    author_id: PropTypes.number,
    category_id: PropTypes.number,
    cuisine_id: PropTypes.number
  },

  render: function() {
    return (
      <tr>
        <td>{this.props.recipe.author.name}</td>
        <td>{this.props.recipe.title}</td>
        <td>{this.props.recipe.category.name}</td>        
        <td>{this.props.recipe.cuisine.name}</td>
        <td>{this.props.recipe.rating}</td>
        <td>{this.props.recipe.prep_time}</td>
        <td>{this.props.recipe.cook_time}</td>
      </tr>
    )
  }
});


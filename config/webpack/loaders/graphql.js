module.exports = {
  test: /\.(gql|graphql)$/,
  use: [{
    loader: 'graphql-tag/loader'
  }]
}
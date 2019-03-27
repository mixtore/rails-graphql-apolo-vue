module Queries
  class ProductsQuery < BaseQuery
    type [Types::ProductType], null: false
    description "List all products"

    def resolve
      Product.all
    end
  end
end
module Queries
  class ProductQuery < BaseQuery
    type Types::ProductType, null: false
    description "Find a product by ID"

    argument :id, Integer, required: true

    def resolve(id:)
      Product.find(id)
    end
  end
end
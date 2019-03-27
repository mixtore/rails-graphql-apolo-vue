module Queries
  class BrandsQuery < BaseQuery
    type [Types::BrandType], null: false
    description "List all brands"

    def resolve
      Brand.all
    end
  end
end
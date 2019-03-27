module Queries
  class BrandQuery < BaseQuery
    type Types::BrandType, null: false
    description "Find a brand by ID"

    argument :id, Integer, required: true

    def resolve(id:)
      Brand.find(id)
    end
  end
end
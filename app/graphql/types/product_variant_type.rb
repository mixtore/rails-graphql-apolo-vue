module Types
    class ProductVariantType < Types::BaseObject
        description "A variant of a product"

        field :id, ID, null: false
        field :name, String, null: false
        field :options, [String], null: false
    end
end

module Types
    class ProductType < Types::BaseObject
        description "A product from the store"

        field :name, String, null: false
        field :price, Float, null: false
        field :brand, BrandType, null: false
    end
end

module Types
    class BrandType < Types::BaseObject
        description "A brand of products"

        field :id, ID, null: false
        field :name, String, null: false
    end
end

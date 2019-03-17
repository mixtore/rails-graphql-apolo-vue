module Types
    class BrandType < Types::BaseObject
        description "A brand of products"

        field :name, String, null: false
    end
end

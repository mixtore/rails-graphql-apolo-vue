module Types
    class QueryType < Types::BaseObject

        field :product, ProductType, null: false do
            argument :id, Integer, required: true
        end

        def product(id:)
            Product.find(id)
        end

        field :products, [ProductType], null: false

        def products
            Product.all
        end

    end
end

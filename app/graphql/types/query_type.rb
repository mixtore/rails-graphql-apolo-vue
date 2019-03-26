module Types
    class QueryType < Types::BaseObject

        # Products

        field :product, ProductType, null: false do
            description "Find a product by ID"
            argument :id, Integer, required: true
        end
        def product(id:)
            Product.find(id)
        end

        field :products, [ProductType], null: false do
            description "List all products"
        end
        def products
            Product.all
        end

        # Brands

        field :brand, BrandType, null: false do
            description "Find a brand by ID"
            argument :id, Integer, required: true
        end
        def brand(id:)
            Brand.find(id)
        end

        field :brands, [BrandType], null: false do
            description "List all brands"
        end
        def brands
            Brand.all
        end

    end
end

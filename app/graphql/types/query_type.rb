module Types
    class QueryType < Types::BaseObject

        # Products
        field :product, resolver: Queries::ProductQuery
        field :products, resolver: Queries::ProductsQuery

        # Brands
        field :brand, resolver: Queries::BrandQuery
        field :brands, resolver: Queries::BrandsQuery

    end
end

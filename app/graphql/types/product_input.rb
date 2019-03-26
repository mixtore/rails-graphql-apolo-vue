module Types
    class ProductInput < BaseInputObject
        argument :name, String, null: false
        argument :price, Float, null: false
        argument :brand, BrandType, null: false
        argument :variants, [ProductVariantType], null: false
    end
end

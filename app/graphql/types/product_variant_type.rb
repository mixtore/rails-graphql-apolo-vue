module Types
    class ProductVariantType < Types::BaseObject
        description "A variant of a product"

        field :id, ID, null: false
        field :name, String, null: false
        field :option1, String, null: true
        field :option2, String, null: true
        field :option3, String, null: true
        field :barcode, String, null: true
    end
end

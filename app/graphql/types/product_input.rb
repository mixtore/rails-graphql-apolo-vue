module Types
  class ProductInput < BaseInputObject
    description 'Input required to create a product'

    argument :name, String, required: true
    argument :price, Integer, required: true
    argument :brandId, Integer, required: true
    argument :variants, [Types::ProductVariantInput], required: false
  end
end
module Mutations
  class UpdateProduct < BaseMutation
    description 'Create a new product with variants'
    argument :id, Int, required: true
    argument :name, String, required: true
    argument :price, Integer, required: true
    argument :brandId, Integer, required: false
    argument :variants, [Types::ProductVariantInput], required: false

    type Types::ProductType

    def resolve(id: nil, name: nil, price: nil, brand_id: nil, variants: nil)
      product = Product.find(id)

      product.update_attributes!(
        name: name,
        price: price,
        brand_id: brand_id
      )
      product
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
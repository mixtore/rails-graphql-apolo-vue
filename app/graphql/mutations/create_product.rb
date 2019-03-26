module Mutations
  class CreateProduct < BaseMutation
    argument :name, String, required: true
    argument :price, Integer, required: true
    argument :brandId, Integer, required: true
    argument :variants, [Types::ProductVariantInput], required: false

    type Types::ProductType

    def resolve(name: nil, price: nil, brand_id: nil, variants: nil)
      product = Product.create!(
        name: name,
        price: price,
        brand_id: brand_id
      )
      product.variants = ProductVariant.create(variants&.map(&:to_hash))
      product
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
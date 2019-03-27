module Mutations
  class CreateProduct < BaseMutation
    description 'Create a new product with variants'
    argument :input, Types::ProductInput, required: true

    type Types::ProductType

    def resolve(name: nil, price: nil, brand_id: nil, variants: nil)
      product = Product.create!(
        name: name,
        price: price,
        brand_id: brand_id
      )
      product.variants = ProductVariant.create(variants&.map(&:to_h))
      product
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
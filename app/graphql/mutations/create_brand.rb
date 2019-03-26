module Mutations
  class CreateBrand < BaseMutation
    description 'Create a new brand'
    argument :name, String, required: true

    type Types::BrandType

    def resolve(name: nil)
      Brand.create!(
          name: name
      )
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
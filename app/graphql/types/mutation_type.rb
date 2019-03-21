module Types
  class MutationType < BaseObject
    field :create_brand, mutation: Mutations::CreateBrand
    field :create_product, mutation: Mutations::CreateProduct
  end
end

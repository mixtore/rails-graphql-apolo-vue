module Types
  class MutationType < BaseObject
    field :create_brand, mutation: Mutations::CreateBrand
    field :create_product, mutation: Mutations::CreateProduct
    field :update_product, mutation: Mutations::UpdateProduct
  end
end

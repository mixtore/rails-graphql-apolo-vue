module Types
  class ProductVariantInput < BaseInputObject
      argument :name, String, required: true
      argument :option1, String, required: false
      argument :option2, String, required: false
      argument :option3, String, required: false
      argument :barcode, String, required: false
  end
end
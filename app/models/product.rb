class Product < ApplicationRecord
    alias_attribute :variants, :product_variants

    belongs_to :brand
    has_many :product_variants
end

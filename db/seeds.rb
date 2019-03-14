supreme = Brand.create(name: 'Supreme')
nike = Brand.create(name: 'Nike')

jacket = Product.create(name: 'Stars Puff Jacket Supreme', price: 198, brand: supreme)
shirt = Product.create(name: 'Stripe Twill Shirt', price: 128, brand: supreme)
backpack = Product.create(name: 'Backpack Olive', price: 158, brand: nike)
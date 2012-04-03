module Products
  include Spinach::DSL

  def setup_products
    products = [
      {
        title: 'Blueberry and Apple Preserve',
        description: 'Blueberries and apples blended together with sugar and a
        dash of lemon juice to create a simple flavour which is not too
        sweet.',
        image_url: 'apple_and_blueberry_preserve.jpg',
        price: 2.85
      },
      {
        title: 'Apricot and Ginger Preserve',
        description: 'Sweet apricots infused with ginger, with sugar and a dash
        of lemon.',
        image_url: 'apricot_and_ginger_preserve.jpg',
        price: 2.85
      },
      {
        title: 'Blackberry Preserve',
        description: 'Reminds me of summer picking blackcurrants with Nan, this
        preserve contains simple blackcurrants and sugar to create a perfectly
        sweet blackcurrant favourite.',
        image_url: 'blackcurrant_preserve.jpg',
        price: 2.85
      }
    ]

    products.each do |product|
      Product.create!(product)
    end
  end

  And 'some products have been created' do
    setup_products
  end

  And 'I click an "Add to Cart" button' do
    within('.products li:first-child') do
      click_button('Add to Cart')
    end
  end
end
module Orders
  include Spinach::DSL

  When 'I create an invalid order' do
    fill_in 'order_name', with: ''
    fill_in 'order_address', with: ''
    fill_in 'order_email', with: ''
    click_button 'Place Order'
  end

  When 'I create a valid order' do
    fill_in 'order_name', with: 'Dave Thomas'
    fill_in 'order_address', with: '123 Main St'
    fill_in 'order_email', with: 'customer@pragprog.com'
    click_button 'Place Order'
  end
end
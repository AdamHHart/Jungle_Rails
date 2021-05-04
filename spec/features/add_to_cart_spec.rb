require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They can add to cart" do
    # ACT
    visit root_path
    puts page.html
    click_on("Add", match: :first)

    # DEBUG
    
    # VERIFY
    expect(page).to have_content ('My Cart (1)')
    save_screenshot "capy_img_cart.png"
  end
end
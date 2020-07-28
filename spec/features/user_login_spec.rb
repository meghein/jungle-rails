require 'rails_helper'

RSpec.feature "users can login successfully.", type: :feature, js: true do

  # SETUP
  before :each do
    @user = User.create!(
      name: Faker::Internet.user_name,
      email: Faker::Internet.email,
      password: "test",
      password_confirmation: "test"
    )
  end

  scenario 'Taken to the home page once signed in' do
    visit login_path

    fill_in("email", :with => @user.email)
    fill_in("password", :with => "test")
    click_button("Submit")

    # VERIFY
    save_screenshot "user_login.png"

    # DEBUG
    expect(page.current_path).to eq root_path
  end

end


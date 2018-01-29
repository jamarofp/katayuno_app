require 'rails_helper'
require 'capybara'

describe 'Kata' do

  before(:each) do
    log_in
  end

  it 'can be read' do
    kata_title = 'Second title'
    kata_description = 'Second description'
    create_kata
    create_kata(title: kata_title, description: kata_description)

    visit root_path
    click_on(kata_title)

    expect(page).to have_content(kata_title)
    expect(page).to have_content(kata_description)
  end

  it 'can be created' do
    kata_title = 'Kata title'
    kata_description = 'Kata description'

    visit root_path
    click_on('New Kata')
    fill_in(:kata_title, with: kata_title)
    fill_in(:kata_description, with: kata_description)
    click_on('Save')

    expect(page).to have_content(kata_title)
    expect(page).to have_content(kata_description)
  end

  it 'can be updated' do
    kata_title = 'Kata title initial'
    kata_description = 'Kata description initial'
    kata_title_edited = 'Kata title edited'
    kata_description_edited = 'Kata description edited'
    create_kata(title: kata_title, description: kata_description)

    visit root_path
    click_on('Edit')
    fill_in(:kata_title, with: kata_title_edited)
    fill_in(:kata_description, with: kata_description_edited)
    click_on('Save')

    expect(page).to have_content(kata_title_edited)
    expect(page).to have_content(kata_description_edited)
  end

  it 'can be deleted' do
    kata = create_kata

    visit root_path
    click_on('Delete')

    expect(page).to have_no_content(kata.title)
  end


  def log_in
    user = User.new(
        email: 'admin@test.com',
        password: '12345678'
      )
    user.save

    visit '/users/sign_in'
    fill_in(:user_email, with: user.email)
    fill_in(:user_password, with: user.password)
    click_on('Log in')
  end

  def create_kata(title: 'Kata_title', description: 'Kata_description')
    kata = Kata.new(title: title, description: description)
    kata.save

    kata
  end
end

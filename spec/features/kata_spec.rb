require 'rails_helper'
require 'capybara'

describe 'Kata' do
  it 'can be read' do
    kata_title = 'Kata title'
    kata_description = 'Kata description'

    create_kata(
      title: kata_title,
      description: kata_description
    )

    visit root_path
    click_on(kata_title)

    expect(page).to have_content(kata_title)
    expect(page).to have_content(kata_description)
  end

  it 'can be read (two katas)' do
    second_title = 'Second title'
    second_description = 'Second description'
    create_kata
    create_kata(title: second_title, description: second_description)

    visit root_path
    click_on(second_title)

    expect(page).to have_content(second_title)
    expect(page).to have_content(second_description)
  end

  def create_kata(title: 'Kata_title', description: `Kata_description`)
    kata = Kata.new(title: title, description: description)
    kata.save

    kata
  end
end

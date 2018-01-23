require 'rails_helper'

describe 'Kata' do
  it 'needs a title' do
    kata = Kata.new(
      title: nil,
      description: 'any'
    )

    kata.save

    expect(kata.errors.size).to eq(1)
  end

  it 'needs a description' do
    kata = Kata.new(
      title: 'any',
      description: nil
    )

    kata.save

    expect(kata.errors.size).to eq(1)
  end

end

require 'rails_helper'
RSpec.describe Author, type: :model do 
  it 'should have attributes :name, :email' do
    expect(subject.attributes).to include('name', 'email')
  end

  it'should validate name amd email presence' do
    expect(Author.new(name: "")).not_to be_valid
    expect(Author.new(name: "Kat")).not_to be_valid
    expect(Author.new(name: "Kat", email: "katH")).to be_valid
  end

  it 'should have many posts' do
    t=Author.reflect_on_association(:posts)
    expect(t.macro).to equal :has_many
  end

  it 'should belong to user' do
    t=Author.reflect_on_association(:user)
    expect(t.macro).to equal :belongs_to
  end

end
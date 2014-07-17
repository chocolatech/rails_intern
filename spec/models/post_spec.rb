require 'rails_helper'
RSpec.describe Post, type: :model do 
  it 'should have attributes :text' do
    expect(subject.attributes).to include('text')
  end

  it 'should validate text presence' do
    expect(Post.new(text: "")).not_to be_valid
    expect(Post.new(text: "taki tekst")).to be_valid
  end

  it 'should have many comments' do
    t = Post.reflect_on_association(:comments)
    expect(t.macro).to equal :has_many
  end

  it 'should belong to author' do
  t = Post.reflect_on_association(:author)
  expect(t.macro).to equal :belongs_to
  end

  it 'should have working :published scope' do
    @post1, @post2 = Post.create(text: "tekst", published: true), Post.create(text: "inny", published: false)
    expect(Post.published).to include @post1
    expect(Post.published).not_to include @post2
  end
  
end
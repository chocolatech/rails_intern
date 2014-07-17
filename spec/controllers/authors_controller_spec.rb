require 'rails_helper'
RSpec.describe AuthorsController, type: :controller do 

  before(:each) do
    @user=User.create(email: "test@test.pl", password: "testpassword")
    sign_in @user
  end

    describe "GET #index" do
    it 'should render properly with status 200' do
    get :index
    expect(response).to be_success
    expect(response).to have_http_status(200)
end

    it 'should render index template' do
      get :index
      expect(response).to render_template('index')
  end

    it 'should have @authors with all authors' do
      author1 = Author.create(name: "Ola", email: "test@test.pl")
      author2 = Author.create(name: "Ala", email: "testy@test.pl")
      get :index
      expect(assigns(:authors)).to match_array([author2, author1])
    end
  end

  describe "POST #create" do
    it'redirects to authors_path after successfuul creation' do
    post :create, author: {name:"Ola", email: "test@test.pl"}
    expect(response).to redirect_to(authors_path)
  end
end

end
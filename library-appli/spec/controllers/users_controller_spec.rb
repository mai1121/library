require 'rails_helper'
describe UsersController type: :controller do
  describe 'GET #show' do
    it "assigns the requested post to @post" do
      posts = create_list(:post, 3)
      get :show
      expect(assigns(:posts)).to match (posts)
    end

    it "renders the :show templete" do
      get :show, id: 1
      expect(response).to render_template :show
    end
  end
end


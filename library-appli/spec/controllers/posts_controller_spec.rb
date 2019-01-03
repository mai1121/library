require 'rails_helper'
describe PostsController, type: :controller do
  describe 'GET #new' do
    it "renders the :new templete" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "assigns the requested post to @post" do
      post = create(:post)
      get :edit, id: post
      expect(assigns(:post)).to eq post
    end

    it "renders the :edit templete" do
      post = create(:post)
      get :edit, id: post
      expect(response).to render_template :edit
    end
  end
end


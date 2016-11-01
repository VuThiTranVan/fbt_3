require "rails_helper"

RSpec.describe ToursController, type: :controller do
  let(:tour) {FactoryGirl.create :tour}

  context "GET #index" do
    it "should render index" do
      get :index
      expect(response).to render_template "index"
    end
  end

  context "GET #show" do
    it "should render a tour" do
      get :show, {id: tour}
      expect(response).to render_template "show"
    end

    it "render show a tour failure" do
      get :show, id: 0
      expect(response).to redirect_to root_path
    end
  end
end

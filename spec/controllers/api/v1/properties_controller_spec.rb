require 'spec_helper'

require 'rails_helper'
RSpec.describe Api::V1::PropertiesController do
  describe "index" do
    before do
      property = create(:property_with_unit)
      get :index
    end
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
    it "JSON body response contains expected recipe attributes" do
      json_response = JSON.parse(response.body)
      expect(json_response.keys).to  eq ["status", "message", "data"]
    end
  end

  describe "show" do
    before do
      @property = create(:property)
      get :show, format: JSON, params: { id: @property.id }
    end
    it "returns http success" do
      expect(response.status).to eq(200)
    end
    it "JSON body response contains expected recipe attributes" do
      json_response = JSON.parse(response.body)
      expect(json_response.keys).to  eq ["status", "message", "data"]
    end
  end

  describe "create" do
    context "with valid attributes" do
      it "a new property" do
        expect{
          post :create, :params => { :property => attributes_for(:property), :format => :json }
        }.to change(Property,:count).by(1)
      end
    end

    context "with invalid attributes" do
      it "does not save the new property" do
        expect{
          post :create, :params => { :property => attributes_for(:property, :invalid), :format => :json }
        }.to_not change(Property,:count)
      end
    end
  end

  describe 'destroy' do
    before :each do
      @property = create(:property)
    end

    it "deletes the property" do
      expect{
        delete :destroy, params: { id: @property.id }
      }.to change(Property,:count).by(-1)
    end
  end

  describe 'update' do
    before :each do
      @property = create(:property)
    end

    context "with valid attributes" do
      it "change @property's attributes" do
        put :update, params: {id: @property.id, property: attributes_for(:property, name: "Larry", description: "some text")}
        @property.reload
        @property.name.should eq("Larry")
        @property.description.should eq("some text")
      end
    end

    context "with invalid attributes" do
      it "does not change @property's attributes" do
        put :update, params: {id: @property.id, property: attributes_for(:property, name: nil, description: "some text")}
        @property.reload
        @property.name.should_not eq("Larry")
        @property.description.should eq("MyString")
      end
    end
  end
end
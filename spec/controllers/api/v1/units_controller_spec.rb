require 'spec_helper'
require 'rails_helper'

RSpec.describe Api::V1::UnitsController do

  describe "create" do
    before do
      property = create(:property)
    end

    it "a new unit" do
      expect{
        post :create, :params => { :unit => attributes_for(:unit), :format => :json }
      }.to change(Unit,:count).by(1)
    end
  end

  describe 'destroy' do
    before :each do
      @unit = create(:unit)
    end

    it "not found unit" do
      expect{
        delete :destroy, params: { id: @unit.id + 1 }
      }.to raise_error(ActiveRecord::RecordNotFound)
    end

    it "deletes the unit" do
      expect{
        delete :destroy, params: { id: @unit.id }
      }.to change(Unit,:count).by(-1)
    end
  end

  describe 'update' do
    before :each do
      @unit = create(:unit)
    end

    it "change @unit's attributes" do
      put :update, params: {id: @unit.id, unit: attributes_for(:unit, unit_number: 12, area: "some text")}
      @unit.reload
      @unit.unit_number.should eq(12)
      @unit.area.should eq("some text")
    end
  end
end
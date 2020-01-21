module Api
  module V1
    class UnitsController < ApplicationController
      def create
        @unit = Unit.new(unit_params)
        if @unit.save
          render json: { status: 'SUCCESS', message: 'loaded the unit', data: @unit }
        else
          render json: { status: 'ERROR', message: 'unit not saved', data: @unit.errors }
        end
      end

      def destroy
        @unit = Unit.find(params[:id])
        @unit.destroy
        render json: { status: 'SUCCESS', message: 'deleted the unit', data: @unit }
      end

      def update
        @unit = Unit.find(params[:id])
        if @unit.update(unit_params)
          render json: { status: 'SUCCESS', message: 'updated the unit', data: @unit }
        else
          render json: { status: 'SUCCESS', message: 'loaded the unit', data: @unit }
        end
      end

      private

      def unit_params
        params.require(:unit).permit(:unit_number, :area, :property_id)
      end
    end
  end
end

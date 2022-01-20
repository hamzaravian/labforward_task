# frozen_string_literal: true

module Api
  module V1
    class IdentifyPeaksController < ApplicationController
      def peaks_calculator
        request = Api::EvaluateRequest.new(identify_peaks_params)
        if request.valid?(:peaks_calculator)
          begin
            result = PeaksCalculator.new(request.sample_data, request.threshold).perform
            render json: { data: result }, status: 200
          rescue Exception => e
            failure(e.message)
          end
        else
          errors(req.errors, 'Required Params are not validated.')
        end
      end

      private

      def identify_peaks_params
        params.require(:identify_peaks).permit({ sample_data: [] }, :threshold)
      end
    end
  end
end

# frozen_string_literal: true

module Api
  module V1
    class IdentifyPeaksController < ApplicationController
      def peaks_calculator
        request = Api::EvaluateRequest.new(identify_peaks_params)
        if request.valid?(:peaks_calculator)
          begin
            result = PeaksCalculator.new(request.sample_data, request.threshold).perform
            render json: {data: result}, status: 200
          rescue StandardError => e
            failure(e.message)
          end
        else
          errors(request.errors, "provided values are not correct.")
        end
      end

      private

      def identify_peaks_params
        params.require(:identify_peaks).permit({sample_data: []}, :threshold)
      end
    end
  end
end

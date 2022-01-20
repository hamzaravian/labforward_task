class Api::V1::IdentifyPeaksController < ApplicationController

    def peaks_calculator
        request = Api::EvaluateRequest.new(identify_peaks_params)
        if request.valid?(:peaks_calculator)
            begin
                result = PeaksCalculator.new(request.sample_data, request.threshold).perform
                render json: result, status: 200

            rescue Exception => e
                render json: {errors: exception.message}.to_json, status: 500
            end
        else
            render json: {errors: request.errors.messages}.to_json, status: 400
        end
    end

    private

    def identify_peaks_params
      params.require(:identify_peaks).permit( {:sample_data => []}, :threshold )
    end

end

class Api::V1::IdentifyPeaksController < ApplicationController

    def peaks_calculator
        sample_data = identify_peaks_params[:sample_data]
        threshold = identify_peaks_params[:threshold]
        if sample_data.present? && threshold.present?
            result = PeaksCalculator.new(sample_data, threshold).perform
            render json: result
        else
            render json: {data: "Kindly provide both i.e threshold and sample_data"}
        end
    end

    private

    def identify_peaks_params
      params.require(:identify_peaks).permit( {:sample_data => []}, :threshold )
    end

end

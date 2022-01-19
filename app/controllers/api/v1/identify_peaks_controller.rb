class Api::V1::IdentifyPeaksController < ApplicationController

    def peaks_calculator

    end

    private

    def identify_peaks_params
      params.permit( {:sample_data => []}, :threshold )
    end
    
end

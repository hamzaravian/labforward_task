class Api::EvaluateRequest < Api::ApiCommonRequest

    attr_accessor :sample_data, :threshold
  
    validates :sample_data, :threshold, presence: true, on: [:peaks_calculator]
    validate :verify_sample_data, on: [:peaks_calculator]
    validate :verify_threshold, on: [:peaks_calculator]
  
    def verify_sample_data
        return errors.add(:error_messages, 'Data is not an array.') unless sample_data.kind_of?(Array)
    end

    def verify_threshold
        return errors.add(:error_messages, 'Threshold is not integer.') unless threshold.kind_of?(Integer)
    end
end
# frozen_string_literal: true

module Api
  class EvaluateRequest < Api::ApiCommonRequest
    attr_accessor :sample_data, :threshold

    validates :sample_data, :threshold, presence: true, on: [:peaks_calculator]
    validate :verify_sample_data, on: [:peaks_calculator]
    validate :verify_threshold, on: [:peaks_calculator]

    def verify_sample_data
      return errors.add(:base, "sample_data is not an array.") unless sample_data.is_a?(Array)
    end

    def verify_threshold
      return errors.add(:base, "threshold is not an integer.") unless threshold.is_a?(Integer)
    end
  end
end

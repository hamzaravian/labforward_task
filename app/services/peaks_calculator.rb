# frozen_string_literal: true

class PeaksCalculator
  def initialize(sample_data, threshold)
    @data = sample_data
    @threshold = threshold
  end

  def perform
    average = (@data.sum / @data.length)
    average_differences = @data.map {|point| (point - average) * (point - average) }
    standard_deviation = Math.sqrt(average_differences.sum / @data.length)
    @data.map {|point| ((point - average) / standard_deviation) > @threshold ? 1 : 0 }
  end
end

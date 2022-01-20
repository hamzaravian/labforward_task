# frozen_string_literal: true

require "rails_helper"

RSpec.describe PeaksCalculator, type: :service do
  let(:threshold) { 1 }
  let(:sample_data) { [1, 1.1, 0.9, 1, 1, 1.2, 2.5, 2.3, 2.4, 1.1, 0.8, 1.2, 1] }
  describe "#perform" do
    subject { described_class.new(sample_data, threshold).perform }
    context "when given correct data" do
      it "will give output in Array" do
        expect(subject).to be_a(Array)
      end

      it "will give correct result" do
        expect(subject).to eq([0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0])
      end

      it "will have only binary result" do
        expect(subject).not_to include(/\b(?![01]\b)\d{1,4}\b/)
      end
    end
  end
end

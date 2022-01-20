# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::V1::IdentifyPeaksController, type: :request do
  subject do
    post "/api/v1/identify_peaks/peaks_calculator",
         params: {identify_peaks:
                                  {threshold:   threshold,
                                   sample_data: sample_data}}, as: :json
  end

  let(:threshold) { 1 }
  let(:sample_data) { [1, 1.1, 0.9, 1, 1, 1.2, 2.5, 2.3, 2.4, 1.1, 0.8, 1.2, 1] }

  context "when correct params" do
    it "returns 200 status code" do
      subject
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end
  end

  context "when incorrect params" do
    let(:sample_data) { {} }
    it "returns 400 status code" do
      subject
      expect(response).to have_http_status(400)
    end
  end
end

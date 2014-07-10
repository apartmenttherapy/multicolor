require 'spec_helper'

describe Multicolor::REST::SearchBuilder do
  let(:keys)   {  []  }
  let(:params) {  {}  }

  let(:colors) {
    [
     {
       color: "red",
       weight: 50,
     },
     {
       color: "blue",
     },
     {
       color: "green",
       weight: 70,
     }
    ]
  }

  subject { Multicolor::REST::SearchBuilder.new(params.with_indifferent_access, *keys) }
  let(:request) { subject.request }

  context 'filepath' do
    let(:params) {
      { filepath: "poop" }
    }

    it 'keeps filepath intact' do
      expect(request["filepath"]).to eq("poop")
    end
  end

  context 'param whitelist' do
    let(:params) {
      {
        limit: 10,
        offset: 20,
        min_score: 100,
        wu_tang: :killah_bees
      }
    }

    it 'keeps whitelisted params and strips rest' do
      expect(request.keys.count).to eq(4)
      expect(request["wu_tang"]).to eq(nil)
    end
  end

  context 'colors' do
    let(:params) {
      { colors: colors }.stringify_keys
    }

    it 'formats colors into array indexes colors and weight' do
      expect(request["colors[0]"]).to eq("red")
      expect(request["colors[1]"]).to eq("blue")
      expect(request["colors[2]"]).to eq("green")
    end

    it 'formats colors into array indexes colors and weight' do
      expect(request["weights[0]"]).to eq(50)
      expect(request["weights[1]"]).to eq(nil)
      expect(request["weights[2]"]).to eq(70)
    end

    it 'skips adding a weight for the second color' do
      expect(request.keys.count).to eq(6)
      expect(request["weights[1]"]).to eq(nil)
    end
  end
end

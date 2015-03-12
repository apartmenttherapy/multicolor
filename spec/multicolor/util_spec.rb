require 'spec_helper'

describe Multicolor::Util do
  subject { Multicolor::Util }

  let(:params) do
    { poop: "haha", filepaths: [:first, :second, :third] }
  end

  let(:output) {
    {
      "filepaths[0]" => :first,
      "filepaths[1]" => :second,
      "filepaths[2]" => :third
    }
  }

  describe '.param_builder' do
    it 'builds filepath params' do
      expect(subject.param_builder(params)).to eq(output)
    end
  end

  describe '.filepaths' do
    it 'formats a single filepath' do
      expect(subject.filepaths("whatever")).to eq({ "filepaths[0]" => "whatever" })
    end

    it 'formats an list (array) of filepaths' do
      expect(subject.filepaths(params[:filepaths])).to eq(output)
    end
  end

  context 'colors via ajax' do
    let(:data) {
      {
        "0" => {
          "color" => "red",
          "weight" => "23"
        }
      }
    }

    describe '.flatten_colors' do
      it 'should turn a ajax encoded colors hash back to an array' do
        expect(subject.flatten_colors(data)).to eq([ { "color" => "red", "weight" => "23" } ])
      end

      it 'leaves properly formatted data alone' do
        safe_data = [{ "color" => "red" }]
        expect(subject.flatten_colors(safe_data)).to eq(safe_data)
      end
    end

    describe '.build_colors' do
      let(:output) { { "colors[0]" => "red", "weights[0]" => "23" } }

      it 'flattens the processed hash and encodes as API params' do
        expect(subject.build_colors(data)).to eq(output)
      end
    end
  end

  context 'payload builder' do
    let(:entry) {
      {
        "filepath" => "poop",
        "url" => "http://url.com",
        "metadata" => {
          "keywords" => [:huh, :hee],
          "post_id"   => { "action" => "return", "type"   => "uint",   "" => rand(0..45) }
        }
      }
    }

    let(:payload) { [entry, entry, entry]  }

    describe '.payload_builder' do
      it 'transforms an array of hashes into array indexed param parts' do
        output = subject.payload_builder(payload)

        expect(output.keys.count).to eq(9)

        expect(output["filepaths[0]"]).to_not eq(nil)
        expect(output["filepaths[1]"]).to_not eq(nil)
        expect(output["filepaths[2]"]).to_not eq(nil)

        expect(output["urls[0]"]).to_not eq(nil)
        expect(output["urls[1]"]).to_not eq(nil)
        expect(output["urls[2]"]).to_not eq(nil)

        expect(output["metadata[0]"]).to_not eq(nil)
        expect(output["metadata[1]"]).to_not eq(nil)
        expect(output["metadata[2]"]).to_not eq(nil)
      end
    end

    describe '.modify_options_for_keys' do
      let(:data) do
        {
          other: [1, 4],
          things: [1, 2],
          cant_touch: :this,
          please_hammer: :dont_hurt_em,
          colors: [
            {
              color: "huh",
              weight: "20"
            },
            {
              color: "nope",
              weight: "30"
            },
          ]
        }
      end

      let(:modifiable_keys) { [:other, :things, :colors] }

      it 'transforms a hash of arrays into array indexed param parts for specified keys' do
        transformed = subject.modify_options_for_keys(data, modifiable_keys)
        expect((transformed.keys & modifiable_keys).count).to eq(0)
        expect((transformed.keys & ["things[0]", "things[1]"]).count).to eq(2)
        expect((transformed.keys & ["others[0]", "others[1]"]).count).to eq(2)
      end
    end
  end
end

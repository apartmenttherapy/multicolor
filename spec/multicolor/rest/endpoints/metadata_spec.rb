require 'spec_helper'

describe Multicolor::REST::Endpoints::Filepath do
  before do
    class TransportMetadataClass
      include Multicolor::REST::Endpoints::Metadata
    end
  end

  subject{ TransportMetadataClass.new }

  describe '#count_collection_colors' do

    let(:params) do
      {
        count_colors: [ "red", "green", "blue"],
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

    it 'makes a get request' do
      expect(subject)
        .to receive(:get)
        .with(:count_collection_colors, {})
      subject.send(:count_collection_colors, {})
    end
  end

  describe '#get_search_metadata' do
    it 'makes a get request' do
      expect(subject)
        .to receive(:get)
        .with(:get_search_metadata)
      subject.send(:get_search_metadata)
    end
  end

  describe '#get_return_metadata' do
    it 'makes a get request' do
      expect(subject)
        .to receive(:get)
        .with(:get_return_metadata)
      subject.send(:get_return_metadata)
    end
  end

  describe '#count' do
    it 'makes a get request' do
      expect(subject)
        .to receive(:get)
        .with(:count)
      subject.send(:count)
    end
  end

  describe '#list' do
    it 'makes a get request' do
      expect(subject)
        .to receive(:get)
        .with(:list, {})
      subject.send(:list)
    end
  end

  describe '#ping' do
    it 'makes a get request' do
      expect(subject)
        .to receive(:get)
        .with(:ping)
      subject.send(:ping)
    end
  end
end

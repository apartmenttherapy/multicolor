require 'spec_helper'

describe Multicolor::REST::Endpoints::Filepath do
  before do
    class TransportClass
      include Multicolor::REST::Endpoints::Filepath
    end
  end

  subject{ TransportClass.new }

  describe '#color_search' do
    it 'makes a post request' do
      expect(subject)
        .to receive(:post)
        .with(:color_search, {})
      subject.send(:color_search, {})
    end
  end

  describe '#extract_collection_colors' do
    it 'makes a post request' do
      expect(subject)
        .to receive(:get)
        .with(:extract_collection_colors, {})

      subject.send(:extract_collection_colors, {})
    end
  end

  describe '#get_metadata' do
    it 'makes a post request' do
      expect(subject)
        .to receive(:get)
       .with(:get_metadata, { "filepaths[0]" => "huh" })
      subject.send(:get_metadata, "huh")
    end
  end
end

require 'spec_helper'

describe Multicolor::REST::Endpoints::Indexing do
  before do
    class IndexingTransportClass
      include Multicolor::REST::Endpoints::Indexing
    end
  end

  subject{ IndexingTransportClass.new }

  describe '#color_search' do
    it 'makes a post request' do
      expect(subject)
        .to receive(:post)
        .with(:add, {})

      expect(Multicolor::Util)
        .to receive(:payload_builder)
        .with({})
        .and_return({})

      subject.send(:add, {})
    end
  end

  describe '#extract_collection_colors' do
    it 'makes a post request' do
      expect(subject)
        .to receive(:post)
        .with(:delete, {})

      expect(Multicolor::Util)
        .to receive(:filepaths)
        .with({})
        .and_return({})

      subject.send(:delete, {})
    end
  end
end

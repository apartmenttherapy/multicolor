require 'spec_helper'

describe Multicolor::REST::Client do
  context 'delegation to transport' do
    describe '.delegate' do
      let(:delegated) {
        [:get_search_metadata, :get_return_metadata,
         :count, :list, :ping, :add, :delete, :get_metadata,
         :update_metadata, :color_search,
         :extract_collection_colors
        ]
      }

      let(:transport) { double('Transport') }

      before do
        Multicolor::REST::Transport.stub(:new).and_return(transport)
      end

      it 'delegates' do
        delegated.each do |method|
          transport.should_receive(method)
          expect(subject.respond_to?(:method)).to eq(true)
          subject.send(method)
        end
      end
    end
  end

  describe '#initialize' do
    it 'yields self if block_given?' do
      expect{ |block| Multicolor::REST::Client.new(&block) }.to yield_control
    end
  end

  describe '#transport' do
    it 'should initialize a transport object' do
      Multicolor::REST::Transport.should_receive(:new)
      subject.send(:transport)
    end
  end

  describe '#config' do
    it 'should initialize a configuration object' do
      Multicolor::Configuration.should_receive(:new)
      subject.config
    end
  end
end

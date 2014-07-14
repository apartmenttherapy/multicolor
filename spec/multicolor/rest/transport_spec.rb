require 'spec_helper'

describe Multicolor::REST::Transport do
  let(:config) { Multicolor::Configuration.new }
  subject      { Multicolor::REST::Transport.new(config) }

  context 'request helpers' do
    let(:client) { double("Client") }

    before do
      allow(Faraday).to receive(:new).and_return(client)
      expect(subject).to receive(:api_path).and_return("/something")
    end

    describe '#get' do
      it 'should proxy get to the initialized Faraday client' do
        expect(client).to receive(:get).with("/something", {})
        subject.send(:get, "/something", {})
      end
    end

    describe '#post' do
      it 'should proxy get to the initialized Faraday client' do
        expect(client).to receive(:post).with("/something", {})
        subject.send(:post, "/something", {})
      end
    end
  end

  describe '#api_path' do
    context 'when no company has been configured' do
      it 'should raise an error' do
        expect{ subject.send(:api_path, "poop") }
          .to raise_error(Multicolor::Errors::CompanyNotSet)
      end
    end
  end

  it 'sets the url to point at tineye multicolor' do
    expect(subject.send(:url)).to eq("http://multicolorengine.tineye.com")
  end
end

require 'spec_helper'

describe Multicolor::Configuration do
  describe '#timeout' do
    it 'defaults to 40' do
      expect(subject.timeout).to eq(40)
    end

    it 'sets timeout' do
      subject.timeout = 20
      expect(subject.timeout).to eq(20)
    end
  end

  describe '#authenticate?' do
    it 'is true' do
      expect(subject.authenticate?).to eq(true)
    end
  end

  describe '#open_timeout' do
    it 'defaults to 40' do
      expect(subject.open_timeout).to eq(40)
    end

    it 'sets open_timeout' do
      subject.open_timeout = 20
      expect(subject.open_timeout).to eq(20)
    end
  end
end

require 'spec_helper'
require 'gobuster/response'

describe Gobuster::Response do
  let(:path)   { '/test' }
  let(:url)    { "https://example.com#{path}" }
  let(:status) { 200 }
  let(:size)   { 176368 }

  describe "#initialize" do
    context "when initialized with the path: keyword argument" do
      subject { described_class.new(path: path, status: status, size: size) }

      it "must set #path" do
        expect(subject.path).to eq(path)
      end

      it "must set #url to nil" do
        expect(subject.url).to be(nil)
      end

      it "must set #status" do
        expect(subject.status).to eq(status)
      end

      it "must set #size" do
        expect(subject.size).to eq(size)
      end
    end

    context "when initialized with the url: keyword argument" do
      subject { described_class.new(url: url, status: status, size: size) }

      it "must set #url" do
        expect(subject.url).to eq(url)
      end

      it "must set #path to nil" do
        expect(subject.path).to be(nil)
      end

      it "must set #status" do
        expect(subject.status).to eq(status)
      end

      it "must set #size" do
        expect(subject.size).to eq(size)
      end
    end
  end

  describe "#to_s" do
    context "when initialized with the path: keyword argument" do
      subject { described_class.new(path: path, status: status, size: size) }

      it "must return #path" do
        expect(subject.to_s).to eq(path)
      end
    end

    context "when initialized with the url: keyword argument" do
      subject { described_class.new(url: url, status: status, size: size) }

      it "must return #url" do
        expect(subject.to_s).to eq(url)
      end
    end
  end

  describe "#to_str" do
    context "when initialized with the path: keyword argument" do
      subject { described_class.new(path: path, status: status, size: size) }

      it "must return #path" do
        expect(subject.to_s).to eq(path)
      end
    end

    context "when initialized with the url: keyword argument" do
      subject { described_class.new(url: url, status: status, size: size) }

      it "must return #url" do
        expect(subject.to_s).to eq(url)
      end
    end
  end
end

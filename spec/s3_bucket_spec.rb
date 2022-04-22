require 'spec_helper'
require 'gobuster/s3_bucket'

describe Gobuster::S3Bucket do
  let(:url) { 'http://test.s3.amazonaws.com/' }

  subject { described_class.new(url) }

  describe "#initialize" do
    it "must set #url" do
      expect(subject.url).to eq(url)
    end
  end

  describe "#to_s" do
    it "must return #url" do
      expect(subject.to_s).to eq(url)
    end
  end

  describe "#to_str" do
    it "must return #url" do
      expect(subject.to_str).to eq(url)
    end
  end
end

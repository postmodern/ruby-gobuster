require 'spec_helper'
require 'gobuster/parsers/s3'

describe Gobuster::Parsers::S3 do
  describe ".parse" do
    let(:url)  { "http://test.s3.amazonaws.com/" }
    let(:line) { url }
    let(:io)   { StringIO.new(line + $/) }

    it "must parse each line and yield Gobuster::S3Bucket objects" do
      yielded_s3_buckets = []

      subject.parse(io) do |s3_bucket|
        yielded_s3_buckets << s3_bucket
      end

      expect(yielded_s3_buckets.length).to eq(1)
      expect(yielded_s3_buckets.first).to be_kind_of(Gobuster::S3Bucket)

      yielded_s3_bucket = yielded_s3_buckets.first

      expect(yielded_s3_bucket.url).to eq(url)
    end
  end
end

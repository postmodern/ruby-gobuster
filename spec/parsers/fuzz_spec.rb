require 'spec_helper'
require 'gobuster/parsers/fuzz'

describe Gobuster::Parsers::Fuzz do
  describe ".parse" do
    let(:url)    { '/test' }
    let(:status) { 200     }
    let(:size)   { 176368  }

    let(:line) { "Found: [Status=#{status}] [Length=#{size}] #{url}" }
    let(:io)   { StringIO.new(line + $/) }

    it "must parse each line and yield Gobuster::Response objects" do
      yielded_responses = []

      subject.parse(io) do |response|
        yielded_responses << response
      end

      expect(yielded_responses.length).to eq(1)
      expect(yielded_responses.first).to be_kind_of(Gobuster::Response)

      yielded_response = yielded_responses.first

      expect(yielded_response.url).to eq(url)
      expect(yielded_response.path).to be(nil)
      expect(yielded_response.status).to eq(status)
      expect(yielded_response.size).to eq(size)
    end
  end
end

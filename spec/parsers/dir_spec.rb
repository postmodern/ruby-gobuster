require 'spec_helper'
require 'gobuster/parsers/dir'

describe Gobuster::Parsers::Dir do
  describe ".parse" do
    let(:path)   { '/test' }
    let(:status) { 200     }
    let(:size)   { 176368  }

    let(:line) { "#{path}                 (Status: #{status}) [Size: #{size}]" }
    let(:io)   { StringIO.new(line + $/) }

    it "must parse each line and yield Gobuster::Response objects" do
      yielded_responses = []

      subject.parse(io) do |response|
        yielded_responses << response
      end

      expect(yielded_responses.length).to eq(1)
      expect(yielded_responses.first).to be_kind_of(Gobuster::Response)

      yielded_response = yielded_responses.first

      expect(yielded_response.path).to eq(path)
      expect(yielded_response.status).to eq(status)
      expect(yielded_response.size).to eq(size)
    end
  end
end

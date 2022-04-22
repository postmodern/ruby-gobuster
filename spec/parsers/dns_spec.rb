require 'spec_helper'
require 'gobuster/parsers/dns'

describe Gobuster::Parsers::DNS do
  describe ".parse" do
    let(:name) { "www.twitter.com" }
    let(:line) { "Found: #{name}" }
    let(:io)   { StringIO.new(line + $/) }

    it "must parse each line and yield Gobuster::Hostname objects" do
      yielded_hostnames = []

      subject.parse(io) do |hostname|
        yielded_hostnames << hostname
      end

      expect(yielded_hostnames.length).to eq(1)
      expect(yielded_hostnames.first).to be_kind_of(Gobuster::Hostname)

      yielded_hostname = yielded_hostnames.first

      expect(yielded_hostname.name).to eq(name)
    end
  end
end

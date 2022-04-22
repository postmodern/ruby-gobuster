require 'spec_helper'
require 'gobuster/hostname'

describe Gobuster::Hostname do
  let(:name) { 'www.example.com' }

  subject { described_class.new(name) }

  describe "#initialize" do
    it "must set #name" do
      expect(subject.name).to eq(name)
    end
  end

  describe "#to_s" do
    it "must return #name" do
      expect(subject.to_s).to eq(name)
    end
  end

  describe "#to_str" do
    it "must return #name" do
      expect(subject.to_str).to eq(name)
    end
  end
end

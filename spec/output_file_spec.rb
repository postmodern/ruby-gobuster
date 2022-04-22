require 'spec_helper'
require 'gobuster/output_file'

describe Gobuster::OutputFile do
  let(:fixtures_dir) { File.expand_path(File.join(__dir__,'fixtures')) }

  describe "PARSERS" do
    subject { described_class::PARSERS }

    describe ":dir" do
      it { expect(subject[:dir]).to eq(Gobuster::Parsers::Dir) }
    end

    describe ":dns" do
      it { expect(subject[:dns]).to eq(Gobuster::Parsers::DNS) }
    end

    describe ":fuzz" do
      it { expect(subject[:fuzz]).to eq(Gobuster::Parsers::Fuzz) }
    end

    describe ":s3" do
      it { expect(subject[:s3]).to eq(Gobuster::Parsers::S3) }
    end
  end

  describe "#initialize" do
    let(:path)   { "/path/to/file.txt" }
    let(:format) { :dir }

    subject { described_class.new(path, format: format) }

    it "must set #path" do
      expect(subject.path).to eq(path)
    end

    it "must set #format" do
      expect(subject.format).to be(format)
    end

    it "must set #parser based on #format" do
      expect(subject.parser).to eq(described_class::PARSERS[subject.format])
    end
  end

  let(:path) { File.join(fixtures_dir,'dir_output.txt') }

  subject { described_class.new(path) }

  describe "#each" do
    context "when initialized with `gobuster dir` output file" do
      let(:path) { File.join(fixtures_dir,'dir_output.txt') }

      subject { described_class.new(path, format: :dir) }

      context "and when a block is given" do
        it "must yield each parsed Response object" do
          yielded_responses = []

          subject.each do |response|
            yielded_responses << response
          end

          expect(yielded_responses).to_not be_empty
          expect(yielded_responses).to all(be_kind_of(Gobuster::Response))
        end
      end

      context "and when no block is given" do
        it "must return an Enumerator of the parsed Response objects" do
          responses = subject.each.to_a

          expect(responses).to_not be_empty
          expect(responses).to all(be_kind_of(Gobuster::Response))
        end
      end
    end

    context "when initialized with `gobuster dns` output file" do
      let(:path) { File.join(fixtures_dir,'dns_output.txt') }

      subject { described_class.new(path, format: :dns) }

      context "and when a block is given" do
        it "must yield each parsed Hostname object" do
          yielded_hostnames = []

          subject.each do |hostname|
            yielded_hostnames << hostname
          end

          expect(yielded_hostnames).to_not be_empty
          expect(yielded_hostnames).to all(be_kind_of(Gobuster::Hostname))
        end
      end

      context "and when no block is given" do
        it "must return an Enumerator of the parsed Hostname objects" do
          hostnames = subject.each.to_a

          expect(hostnames).to_not be_empty
          expect(hostnames).to all(be_kind_of(Gobuster::Hostname))
        end
      end
    end

    context "when initialized with `gobuster fuzz` output file" do
      let(:path) { File.join(fixtures_dir,'fuzz_output.txt') }

      subject { described_class.new(path, format: :fuzz) }

      context "and when a block is given" do
        it "must yield each parsed Response object" do
          yielded_responses = []

          subject.each do |response|
            yielded_responses << response
          end

          expect(yielded_responses).to_not be_empty
          expect(yielded_responses).to all(be_kind_of(Gobuster::Response))
        end
      end

      context "and when no block is given" do
        it "must return an Enumerator of the parsed Response objects" do
          responses = subject.each.to_a

          expect(responses).to_not be_empty
          expect(responses).to all(be_kind_of(Gobuster::Response))
        end
      end
    end

    context "when initialized with `gobuster s3` output file" do
      let(:path) { File.join(fixtures_dir,'s3_output.txt') }

      subject { described_class.new(path, format: :s3) }

      context "and when a block is given" do
        it "must yield each parsed S3Bucket object" do
          yielded_s3_buckets = []

          subject.each do |s3_bucket|
            yielded_s3_buckets << s3_bucket
          end

          expect(yielded_s3_buckets).to_not be_empty
          expect(yielded_s3_buckets).to all(be_kind_of(Gobuster::S3Bucket))
        end
      end

      context "and when no block is given" do
        it "must return an Enumerator of the parsed S3Bucket objects" do
          s3_buckets = subject.each.to_a

          expect(s3_buckets).to_not be_empty
          expect(s3_buckets).to all(be_kind_of(Gobuster::S3Bucket))
        end
      end
    end
  end

  describe "#to_s" do
    let(:path)   { "/path/to/file.txt" }
    let(:format) { :dir }

    subject { described_class.new(path, format: format) }

    it "must return #path" do
      expect(subject.to_s).to eq(path)
    end
  end
end

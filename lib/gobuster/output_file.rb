require 'gobuster/parsers/dir'
require 'gobuster/parsers/dns'
require 'gobuster/parsers/fuzz'
require 'gobuster/parsers/s3'

module Gobuster
  #
  # Parses an output file created by `gobuster -o ...`.
  #
  # ## Example
  #
  #     require 'gobuster/output_file'
  #     
  #     output_file = Gobuster::OutputFile.new('/path/to/file.txt')
  #     output_file.each do |object|
  #       p object
  #     end
  #
  # @api public
  #
  class OutputFile

    # Mapping of formats to parsers.
    #
    # @api semipublic
    PARSERS = {
      dir:  Parsers::Dir,
      dns:  Parsers::DNS,
      fuzz: Parsers::Fuzz,
      s3:   Parsers::S3
    }

    # The path to the output file.
    #
    # @return [String]
    attr_reader :path

    # The format of the output file.
    #
    # @return [:dir, :dns, :fuzz, :s3]
    attr_reader :format

    # The parser for the output file format.
    #
    # @return [Parsers::Dir, Parsers::DNS, Parsers::Fuzz, Parsers:S3]
    #
    # @api private
    attr_reader :parser

    #
    # Initializes the output file.
    #
    # @param [String] path
    #   The path to the output file.
    #
    # @param [:dir, :dns, :fuzz, :s3] format
    #   The optional format of the output file.
    #
    def initialize(path, format: )
      @path   = File.expand_path(path)
      @format = format

      @parser = PARSERS.fetch(format) do
        raise(ArgumentError,"unrecognized file type: #{@path.inspect}")
      end
    end

    #
    # Parses the contents of the output file.
    #
    # @yield [object]
    #   The given block will be passed each parsed object.
    #
    # @yieldparam [Response, Hostname, S3Bucket] object
    #   A parsed object from the output file.
    #
    # @return [Enumerator]
    #   If no block is given, an Enumerator object will be returned.
    #
    def each(&block)
      return enum_for(__method__) unless block

      File.open(@path) do |file|
        @parser.parse(file,&block)
      end
    end

    #
    # Converts the output file to a String.
    #
    # @return [String]
    #   The path to the output file.
    #
    def to_s
      @path
    end

  end
end

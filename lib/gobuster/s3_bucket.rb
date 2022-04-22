module Gobuster
  #
  # Represents an S3 bucket found by `gobuster s3`.
  #
  class S3Bucket

    # The URL to the S3 bucket.
    #
    # @return [String]
    attr_reader :url

    #
    # Initializes the S3 bucket.
    #
    # @param [String] url
    #
    def initialize(url)
      @url = url
    end

    #
    # Converts the S3 bucket to a String.
    #
    # @return [String]
    #
    def to_s
      @url
    end

    alias to_str to_s

  end
end

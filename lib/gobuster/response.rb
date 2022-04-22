module Gobuster
  #
  # Represents a HTTP response found by `gobuster dir` or `gobuster fuzz`.
  #
  class Response

    # The path of the response.
    #
    # @return [String, nil]
    attr_reader :path

    # The URL of the response.
    #
    # @return [String, nil]
    attr_reader :url

    # The HTTP status code.
    #
    # @return [Integer]
    attr_reader :status

    # The size of the response.
    #
    # @return [Integer]
    attr_reader :size

    #
    # Initializes the HTTP response.
    #
    # @param [String, nil] path
    #
    # @param [String, nil] url
    #
    # @param [Integer] status
    #
    # @param [Integer] size
    #
    # @raise [ArgumentError]
    #   The `path:` or `url:` keyword argument is required.
    #
    def initialize(path: nil, url: nil, status: , size: )
      if url
        @url  = url
        @path = nil
      elsif path
        @url  = nil
        @path = path
      else
        raise(ArgumentError,"path: or url: keyword argument must be given")
      end

      @status = status
      @size   = size
    end

    #
    # Converts the response to a String.
    #
    # @return [String]
    #
    def to_s
      @path || @url
    end

    alias to_str to_s

  end
end

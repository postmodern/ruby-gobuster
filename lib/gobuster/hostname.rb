module Gobuster
  #
  # Represents a hostname found by `gobuster dns`.
  #
  class Hostname

    # The host name.
    #
    # @return [String]
    attr_reader :name

    #
    # Initializes the hostname.
    #
    # @param [String] name
    #
    def initialize(name)
      @name = name
    end

    #
    # Converts the hostname to a String.
    #
    # @return [String]
    #
    def to_s
      @name
    end

    alias to_str to_s

  end
end

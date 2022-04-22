require 'gobuster/response'

module Gobuster
  module Parsers
    module Fuzz
      #
      # Parses `gobuster fuzz` output.
      #
      # @param [IO] io
      #   The IO stream to parse.
      #
      # @yield [response]
      #   The given block will be passed each parsed response.
      #
      # @yieldparam [Response] response
      #   The parsed response.
      #
      # @return [Enumerator]
      #   If no block is given, an Enumerator will be returned.
      #
      def self.parse(io)
        return enum_for(__method__,io) unless block_given?

        line_regexp = /^Found:\s+\[Status=(\d{3})\]\s+\[Length=(\d+)\]\s+([^\s]++)/

        io.each_line do |line|
          if (match = line.match(line_regexp))
            yield Response.new(
              status: match[1].to_i,
              size:   match[2].to_i,
              url:    match[3],
            )
          end
        end
      end
    end
  end
end

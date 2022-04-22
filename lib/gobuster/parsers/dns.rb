require 'gobuster/hostname'

module Gobuster
  module Parsers
    module DNS
      #
      # Parses `gobuster dns` output.
      #
      # @param [IO] io
      #   The IO stream to parse.
      #
      # @yield [hostname]
      #   The given block will be passed each parsed hostname.
      #
      # @yieldparam [Hostname] hostname
      #   The parsed hostname.
      #
      # @return [Enumerator]
      #   If no block is given, an Enumerator will be returned.
      #
      def self.parse(io)
        return enum_for(__method__,io) unless block_given?

        io.each_line do |line|
          if line.start_with?('Found: ')
            line.chomp!
            line.sub!('Found: ','')

            yield Hostname.new(line)
          end
        end
      end
    end
  end
end

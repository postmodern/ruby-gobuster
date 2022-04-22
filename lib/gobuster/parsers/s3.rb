require 'gobuster/s3_bucket'

module Gobuster
  module Parsers
    module S3
      #
      # Parses `gobuster s3` output.
      #
      # @param [IO] io
      #   The IO stream to parse.
      #
      # @yield [s3bucket]
      #   The given block will be passed each parsed s3bucket.
      #
      # @yieldparam [S3Bucket] s3bucket
      #   The parsed s3bucket.
      #
      # @return [Enumerator]
      #   If no block is given, an Enumerator will be returned.
      #
      def self.parse(io)
        return enum_for(__method__,io) unless block_given?

        io.each_line do |line|
          line.chomp!

          if line.start_with?('http://') && line.end_with?('s3.amazonaws.com/')
            yield S3Bucket.new(line)
          end
        end
      end
    end
  end
end

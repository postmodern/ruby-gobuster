require 'command_mapper/command'

#
# Represents the `gobuster` command
#
module Gobuster
  class Command < CommandMapper::Command

    #
    # Represents the type for `--delay` and `--timeout` options.
    #
    # @api private
    #
    class Duration < CommandMapper::Types::Str

      #
      # Validates the given value.
      #
      # @param [Object] value
      #   The given value to validate.
      #
      # @return [true, (false, String)]
      #   Returns true if the value is considered valid, or false and a
      #   validation message if the value is not valid.
      #
      def validate(value)
        valid, message = super(value)

        unless valid
          return [valid, message]
        end

        value = value.to_s

        unless value =~ /\A\d+(?:m|s|ms|ns)\z/
          return [false, "must be a number and end with 'm', 's', 'ms', or 'ns'"]
        end

        return true
      end

    end

    command "gobuster" do
      option "--delay", value: {type: Duration.new}
      option "--no-error"
      option "--no-progress"
      option "--output", value: true
      option "--pattern", value: true
      option "--quiet"
      option "--threads", value: {type: Num.new}
      option "--verbose"
      option "--wordlist", value: true

      subcommand "completion" do
        subcommand "bash" do
          option "--help"
          option "--no-descriptions"
        end

        subcommand "fish" do
          option "--help"
          option "--no-descriptions"
        end

        subcommand "powershell" do
          option "--help"
          option "--no-descriptions"
        end

        subcommand "zsh" do
          option "--help"
          option "--no-descriptions"
        end
      end

      subcommand "dir" do
        option "--add-slash"
        option "--cookies", value: true
        option "--discover-backup"
        option "--exclude-length", value: {type: Num.new}, repeats: true
        option "--expanded"
        option "--extensions", value: true
        option "--follow-redirect"
        option "--headers", value: true, repeats: true
        option "--help"
        option "--hide-length"
        option "--method", value: true
        option "--no-status"
        option "--no-tls-validation"
        option "--password", value: true
        option "--proxy", value: true
        option "--random-agent"
        option "--status-codes", value: true
        option "--status-codes-blacklist", value: true
        option "--timeout", value: {type: Duration.new}
        option "--url", value: true
        option "--useragent", value: true
        option "--username", value: true
        option "--wildcard"
      end

      subcommand "dns" do
        option "--domain", value: true
        option "--help"
        option "--resolver", value: true
        option "--show-cname"
        option "--show-ips"
        option "--timeout", value: {type: Duration.new}
        option "--wildcard"
      end

      subcommand "fuzz" do
        option "--cookies", value: true
        option "--exclude-length", value: {type: Num.new}, repeats: true
        option "--excludestatuscodes", value: true
        option "--follow-redirect"
        option "--headers", value: true, repeats: true
        option "--help"
        option "--method", value: true
        option "--no-tls-validation"
        option "--password", value: true
        option "--proxy", value: true
        option "--random-agent"
        option "--timeout", value: {type: Duration.new}
        option "--url", value: true
        option "--useragent", value: true
        option "--username", value: true
        option "--wildcard"
      end

      subcommand "help" do
        option "--help"

        argument :command, required: false
      end

      subcommand "s3" do
        option "--help"
        option "--maxfiles", value: {type: Num.new}
        option "--proxy", value: true
        option "--random-agent"
        option "--timeout", value: {type: Duration.new}
        option "--useragent", value: true
      end

      subcommand "version" do
        option "--help"
      end

      subcommand "vhost" do
        option "--cookies", value: true
        option "--follow-redirect"
        option "--headers", value: true, repeats: true
        option "--help"
        option "--method", value: true
        option "--no-tls-validation"
        option "--password", value: true
        option "--proxy", value: true
        option "--random-agent"
        option "--timeout", value: {type: Duration.new}
        option "--url", value: true
        option "--useragent", value: true
        option "--username", value: true
      end
    end

  end
end

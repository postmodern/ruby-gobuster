# ruby-gobuster

[![CI](https://github.com/postmodern/ruby-gobuster/actions/workflows/ruby.yml/badge.svg)](https://github.com/postmodern/ruby-gobuster/actions/workflows/ruby.yml)
[![Gem Version](https://badge.fury.io/rb/ruby-gobuster.svg)](https://badge.fury.io/rb/ruby-gobuster)

* [Source](https://github.com/postmodern/ruby-gobuster/)
* [Issues](https://github.com/postmodern/ruby-gobuster/issues)
* [Documentation](http://rubydoc.info/gems/ruby-gobuster/frames)

## Description

A Ruby interface to [gobuster], a tool used to bruteforce URIs, DNS, VHosts, S3.

## Features

* Provides a [Ruby interface][Gobuster::Command] for running the `gobuster`
  command.
* Supports [parsing][Gobuster::OutputFile] `gobuster -o ... {dir|dns|fuzz|s3}`
  output files.

[Gobuster::Command]: https://rubydoc.info/gems/ruby-gobuster/Gobuster/Command
[Gobuster::OutputFile]: https://rubydoc.info/gems/ruby-gobuster/Gobuster/OutputFile

## Examples

Run `gobuster --wordlist /path/to/wordlist.txt dir -u https://example.com` from Ruby:

```ruby
require 'gobuster/command'

Gobuster::Command.run(wordlist: '/path/to/wordlist.txt', dir: {url: 'https://example.com'})
```

## Requirements

* [ruby] >= 2.0.0
* [gobuster] >= 3.1.0
* [command_mapper] ~> 0.2

[ruby]: https://www.ruby-lang.org/
[command_mapper]: https://github.com/postmodern/command_mapper.rb#readme

## Install

```shell
$ gem install ruby-gobuster
```

### gemspec

```ruby
gemspec.add_dependency 'ruby-gobuster', '~> 0.1'
```

### Gemfile

```ruby
gem 'ruby-gobuster', '~> 0.1'
```

## License

Copyright (c) 2022 Hal Brodigan

See {file:LICENSE.txt} for license information.

[gobuster]: https://github.com/OJ/gobuster#readme

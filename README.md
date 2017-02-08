# sinatra-sane-logging

[![Code Climate](https://codeclimate.com/github/tomekw/sinatra-sane-logging/badges/gpa.svg)](https://codeclimate.com/github/tomekw/sinatra-sane-logging) [![Gem Version](https://badge.fury.io/rb/sinatra-sane-logging.svg)](https://badge.fury.io/rb/sinatra-sane-logging) [![CircleCI](https://circleci.com/gh/tomekw/sinatra-sane-logging.svg?style=svg)](https://circleci.com/gh/tomekw/sinatra-sane-logging)

Sinatra logging for human beings.

It allows to set both Rack, error and application logger.

It uses `Rack::Commonlogger` under the hood so the logger has to respond to:

* `<<(message)`
* `puts(message)`
* `flush`

## Installation

Add this line to your application's Gemfile:

```ruby
gem "sinatra-sane-logging", require: "sinatra/sane_logging"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sinatra-sane-logging

## Usage

```ruby
require "logger"
require "sinatra/base"
require "sinatra/sane_logging"

class FileLogger < Logger
  def flush; end
end

class App < Sinatra::Base
  include Sinatra::SaneLogging

  sane_logging logger: Filelogger.new(File.open("log/app.log", "a+").tap { |log_file| log_file.sync = true })

  get "/" do
    logger.info "OK"

    "OK"
  end
end
```

## Development

Build the Docker image:

    $ docker-compose build

Create services:

    $ docker-compose create

Run specs:

    $ docker-compose run --rm app rspec spec

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tomekw/sinatra-sane-logging. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

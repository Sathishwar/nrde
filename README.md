# Nrde

A Ruby gem to export a New Relic dashboard PDF or image programmatically.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nrde' , '~>0.1.2'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install nrde

## Usage

```ruby
require 'nrde'
def exporter()
    nrde_download = Nrde::DashboardExporter.exporter(guid = "<Newrelic GUID>", personal_api_key = "New Relic Personal API key")
    tempfile = File.new("test.pdf","w")
    File.open(tempfile.path, 'w') do |f|
        f.write(nrde_download.body)
    end
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Sathishwar/nrde. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/Sathishwar/nrde/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Nrde project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Sathishwar/nrde/blob/master/CODE_OF_CONDUCT.md).

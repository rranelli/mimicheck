# MimiCheck

A Quickcheck inspired testing library with dependency injection in mind.

[![Build Status](https://travis-ci.org/rranelli/mimicheck.svg)](https://travis-ci.org/rranelli/mimicheck)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mimicheck'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mimicheck

## Usage

# TODO: ~

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake rspec` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/[USERNAME]/mimicheck.

### Pending Features && TODO

* Fix splat to properties. All properties should take only *one* argument
* Add support for the Frequency generator
* Add a better support for instantiating generators (probably including them in
a module with factory methods)
* Add support for shrinking (**big feature**!)
* Allow better support of "sized" generators. Passing in a range sucks

## License

The gem is available as open source under the terms of the
[MIT License](http://opensource.org/licenses/MIT).

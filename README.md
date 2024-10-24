# Shigeki
A simple stimulus wrapper to prevent stupidly long data attributes

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add shigeki

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install shigeki

## Usage

To use Shigeki, first create a Shigeki instance by passing in the Stimulus controller name.
```ruby
- counter_stimulus = Shigeki.new('shigeki--example--counter')
```

Then, you can use this instance inside your `data` hash to set Stimulus attributes

### Controllers
```ruby
%div{ data: { controller: 'shigeki--example--counter' } }
%div{ data: counter_stimulus.data { controller } }
```

### Actions
#### With an Event Specified
```ruby
%button{ data: { action: "click->shigeki--example--counter#increment" } } Increment
%button{ data: counter_stimulus.data { action(method: 'increment', event: 'click') } } Increment
```

For common Stimulus Action event triggers, the following syntax is also supported
```ruby
%button{ data: counter_stimulus.data { action_click('increment') } } Increment
%button{ data: counter_stimulus.data { action_submit('increment') } } Increment
%button{ data: counter_stimulus.data { action_change('increment') } } Increment
```

#### Without an Event Specified
```ruby
%button{ data: { action: "shigeki--example--counter#increment" } } Increment
%button{ data: counter_stimulus.data { action(method: 'increment') } } Increment
```

### Targets
```ruby
%span{ data: { shigeki__example__counter_target: "count" } } 0
%span{ data: counter_stimulus.data { target('count') } } 0
```


### Values
```ruby
%div{ data: { shigeki__example__counter_initial_count_value: initial_count } }
%span{ data: counter_stimulus.data { value(name: 'initial_count', content: initial_count) } }
```

### Outlets
Coming soon

### Other
This is used if there are any other data attributes you want that is not Stimulus related. 
This essentially does a deep merge of the passed in hash with the other Stimulus data you may want.
```ruby
%div{ data: { key1: value1 } }
%span{ data: counter_stimulus.data { other({ key1: value1 }) } }
```

## Examples Using Multiple Stimulus Data Attributes
You can combine multiple of these by chaining the different supported methods.
For example, as of Stimulus version 3.2.2, Stimulus values need to be defined in the same element as the controller, which can be done 
```ruby
%div{ data: { controller: 'shigeki--example--counter', shigeki__example__counter_initial_count_value: initial_count } }
%div{ data: counter_stimulus.data { controller.value(name: 'initial_count', content: initial_count) } }
```

You can also split the data up into multiple lines if it gets too long
```ruby
%div{ data: counter_stimulus.data do
 controller
  .value(name: 'initial_count', content: initial_count)
  .action_click('increment')
  .target('count')
end }
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/shigeki.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

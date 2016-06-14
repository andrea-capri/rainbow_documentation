# rainbow_documentation
A documentation for RSpec that keeps things colourful

Simply add it to your Gemfile using 

```ruby
gem 'rainbow_documentation'
```

and add the following to RSpec through the .rspec file

```ruby
--color
--require spec_helper
--format RainbowDocumentation
```

or in your spec_helper.rb file

```ruby
RSpec.configure do |config|
  config.color = true
  config.formatter = 'RainbowDocumentation'
end
```

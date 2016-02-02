# npm2gem

npm2gem is a tool to help you maintain
['gemified assets'](http://www.prioritized.net/blog/gemify-assets-for-rails/)
for Ruby on Rails,
by automatically pulling assets from NPM.

## Installation

Add this line to your application's Gemfile:

```ruby
group :development do
  gem "npm2gem"
end
```

Then run:

    $ bundle

## Usage

`npm2gem` uses a configuration file: `.npm2gem.yml`.

Once that file is set up,
you just run `npm2gem`
and it'll automatically download the correct package from `npm`,
and copy the files you want into your gem.

It assumes that all files will go into `vendor/assets`,
with javascript files going into `vendor/assets/javascripts`
and stylesheet files going into `vendor/assets/stylesheets`.


### `.npm2gem.yml`

Here is the specification for the `.npm2gem.yml` file:

```yaml
bootstrap:
  - dist/css/boostrap.css
  - dist/css/bootstrap-theme.css
  - dist/js/bootstrap.js

```


#### Subdirectories

You can also tell `npm2gem` which subfolder
you'd like the assets to be placed in.

Note: all `.css` files go into `vendor/assets/stylesheets`
and all `.js` files go into `vendor/assets/javascripts`,
this is currently a default that you cannot override.

You can create subdirectories though.

Let's say you wanted to put the `bootstrap-theme.css` file into
`vendor/assets/stylesheets/themes` instead.

Here's the `.npm2gem.yml` you'd use:

```yaml
bootstrap:
  - dist/css/boostrap.css
  - dist/js/bootstrap.js
  - themes:
    - dist/css/bootstrap-theme.css

```

## TODO:

- [ ] Support SCSS, Coffee, etc.
- [ ] Add support for fonts?
- [ ] Add tests for:
  - [ ] ensuring you can group JS and CSS files together in `.npm2gem.yml`
  - [ ] ensuring subdirectories can be nested

## Future work
Eventually, I'd like there to be a service that uses this gem to
intermittenly poll `npm` to check for new packages.

Once it finds one,
it'll open a PR with the project
to see if they want to update their gem.

## Development

Bug reports, support requests and pull requests are welcome on GitHub at
https://github.com/cllns/npm2gem.
This project is intended to be a safe,
welcoming space for collaboration,
and contributors are expected to adhere to the
[code of conduct](code_of_conduct.md).

## License

The gem is available as open source under the terms of the
[MIT License](http://opensource.org/licenses/MIT).

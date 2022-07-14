# Itamae::Plugin::Recipe::Rust
[Itamae](https://github.com/itamae-kitchen/itamae) plugin to install [Rust](https://www.rust-lang.org/)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'itamae-plugin-recipe-rust'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install itamae-plugin-recipe-rust

## Usage

### System wide installation
Install Rust to `/usr/local/cargo` or some shared path

#### Recipe
```ruby
# your recipe
include_recipe "rust::system"
```

#### Node
Use this with `itamae -y node.yml`

```yaml
rust:
  # Rust install dir, optional (default: /usr/local/cargo)
  cargo_home: /usr/local/cargo

  # Version of Rust to install, optional (default: latest)
  # version: 1.58.1
```

#### .bashrc
Recommend to append this to `.bashrc` in your server.

```bash
export CARGO_HOME=/usr/local/rust
export PATH="${CARGO_HOME}/bin:${PATH}"
```

### Installation for a user
Install Rust to `~/#{node[:rust][:user]}/.cargo`

#### Recipe
```ruby
# your recipe
include_recipe "rust::user"
```

#### Node
Use this with `itamae -y node.yml`

```yaml
rust:
  # User to be installed, optional (default: ENV["USER"])
  user: deploy

  # Version of Rust to install, optional (default: latest)
  # version: 1.58.1
```

## mitamae
This plugin can be used for [mitamae](https://github.com/itamae-kitchen/mitamae) too. Put this repository under `./plugins` as git submodule.

```ruby
node.reverse_merge!(
  rbenv: {
    user: "deploy",
    version: "1.58.1",
  }
)

include_recipe "rust::user"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/itamae-plugins/itamae-plugin-recipe-rust.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

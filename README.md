# Middleman Async Image
Load your images asynchronously with Middleman : like Medium.

## Why?
Because loading images on poor connections is really ugly. Medium as a great image loader so I develop a Gem to make it same as Middleman.

## Configuration
You can set the image-dir of your choice (follow the Middleman assets directories configuration).

Simple configuration: just add `gem 'middleman-async-image'` to your __Gemfile__ and `activate :async_image` to your __config.rb__. If will work whatever your images dir.

By default, compressed images are stored in the *compress* dir in your image folder. If you want to name this dir differently : add the following configuration to your __config.rb__:
```RUBY
activate :async_image do |i|
  i.compress_image_path = "THE_DIRECTORY_NAME_OF_YOUR_CHOISE"
end
```

By default again, the compression level is *low (15)*. If you want to use a different one, you can configure it as the following:
```RUBY
activate :async_image do |i|
  i.quality = "medium"
end
```
List of options:
- Low: 10
- Medium: 25
- High: 35

## Contributing

1. Fork it ( https://github.com/bastienrobert/middleman-async-image/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request


## License

See LICENSE, which applies to everything in this repository.

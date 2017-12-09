# Require core library
require 'middleman-core'
# Require RMagick to manipulate images
require 'rubygems'
require 'rmagick'
# Require FileUtils to manage filesystem
require 'fileutils'

# Extension namespace
class AsyncImage < ::Middleman::Extension
  option :compress_image_path, 'compress', 'async'

  def initialize(app, options_hash={}, &block)
    # Call super to build options from the options_hash
    super

    # set up your extension
    # puts options.my_option
  end

  def compress_dir
    dir = "source/#{app.config[:images_dir]}/" + AsyncImage.config[:compress_image_path]
    unless Dir.exists?(dir)
      FileUtils.mkdir(dir)
    end
  end

  def after_configuration
    compress_dir
    puts "Compress source/" + app.config[:images_dir] + " to source/#{app.config[:images_dir]}/" + options.compress_image_path
  end

  helpers do
    def image_async_tag(path, params={})
      complete_path = "source/#{app.config[:images_dir]}/" + AsyncImage.config[:compress_image_path] + '/' + path
      FileUtils.mkdir_p(complete_path.match(/(.*\/)+(.*$)/)[1])

      Magick::Image::read("source/#{app.config[:images_dir]}/" + path)[0]
      .scale(0.3)
      .write(complete_path){|f| f.quality = 0.1 }

      return {
        full: path,
        compress: AsyncImage.config[:compress_image_path] + '/' + path
      }
    end
  end

end

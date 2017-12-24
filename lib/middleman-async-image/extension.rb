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
  option :quality, 'low', 'medium'

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

  def image_quality
    case AsyncImage.config[:quality]
    when 'low'
      return 15
    when 'medium'
      return 25
    when 'high'
      return 35
    end
  end

  def after_configuration
    compress_dir
    puts "Async loaded images will be compress from source/" + app.config[:images_dir] + " to source/#{app.config[:images_dir]}/" + options.compress_image_path
  end

  helpers do
    def image_async_tag(path, params={})
      complete_path = "source/#{app.config[:images_dir]}/" + AsyncImage.config[:compress_image_path] + '/' + path
      FileUtils.mkdir_p(complete_path.match(/(.*\/)+(.*$)/)[1])

      Magick::Image::read("source/#{app.config[:images_dir]}/" + path)[0]
      .scale(0.3)
      .write(complete_path){|f| f.quality = 10 }

      params['data-compress'] = image_path(AsyncImage.config[:compress_image_path] + '/' + path)
      begin
        params[:class] += ' async-image'
      rescue
        params['class'] += ' async-image'
      end

      return image_tag(path, params)
    end
  end

end

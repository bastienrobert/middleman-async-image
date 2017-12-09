require "middleman-core"

Middleman::Extensions.register :async_image do
  require "middleman-async-image/extension"
  AsyncImage
end

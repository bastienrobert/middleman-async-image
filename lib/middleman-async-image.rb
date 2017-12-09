require "middleman-core"

Middleman::Extensions.register :middleman-async-image do
  require "middleman-async-image/extension"
  MyExtension
end

require 'bundler'
require "./app"

Bundler.require

opal = Opal::Server.new {|s|
  s.append_path 'js'
  s.main = 'app'
}

sprockets   = opal.sprockets
maps_prefix = '/__OPAL_SOURCE_MAPS__'
maps_app    = Opal::SourceMapServer.new(sprockets, maps_prefix)

# Monkeypatch sourcemap header support into sprockets
::Opal::Sprockets::SourceMapHeaderPatch.inject!(maps_prefix)

map maps_prefix do
  run maps_app
end

map '/assets' do
  run sprockets
end

run(Cuba)

require_relative 'app'
ROUTES = {
  '/time' => App.new
}

run Rack::URLMap.new(ROUTES)

use Rack::ContentType, "text/plain"

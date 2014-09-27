require 'rubygems'
require 'bundler'

Bundler.require # Load the needed gems from the gemfile.

$: << File.expand_path('../', __FILE__) # Required so that Sinatra knows where to find all the routes and such.

require 'app/routes.rb'

module SinatraBootstrap
  class App < Sinatra::Application
    configure do
      disable :method_override
      disable :static # Disable static files.

      set :sessions,
          :httponly     => true,
          :secure       => production?,
          :expire_after => 31557600, # 1 year
          :secret       => ENV['SESSION_SECRET']
    end

    use Rack::Deflater
    use SinatraBootstrap::Routes::Client
  end
end

# To easily access models in the console
# include SinatraBootstrap::Models
# From the root directory, to launch an interactive console w/ Models loaded:
  # irb -r ./app.rb
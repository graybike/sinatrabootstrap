require 'rubygems'
require 'bundler'

Bundler.require #Load the needed gems from the gemfile.

$: << File.expand_path('../', __FILE__) # Required so that Sinatra knows where to find all these files.

require 'app/routes.rb'

module SinatraBootstrap
  class App < Sinatra::Application
    configure do
      disable :method_override
      disable :static

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
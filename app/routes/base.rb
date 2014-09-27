module SinatraBootstrap
  module Routes
    class Base < Sinatra::Application
      configure do
        set :views, 'app/views'
        set :root, App.root
      end
    end
  end
end
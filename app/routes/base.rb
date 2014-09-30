module SinatraBootstrap
  module Routes
    class Base < Sinatra::Application
      configure do
        set :views, 'app/views' # Tell Sinatra where the views are kept.
        set :root, App.root     # Tell Sinatra where your route's current working directory is.
      end

      helpers do
        def warden
          request.env['warden']
        end
      
        def current_user
          warden.authenticated? ? User[warden.user] : nil
        end
      end
    end
  end
end
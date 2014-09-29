module SinatraBootstrap
  module Routes
    class Client < Base
      
      get '/' do
        warden.authenticate!
        haml :index
      end

    end
  end
end
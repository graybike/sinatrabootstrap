module SinatraBootstrap
  module Models
    class User < Sequel::Model
      include BCrypt

      def authenticate(attempted_password)
        !!(self.password == attempted_password)
      end

      def password
        @password ||= Password.new(password_hash)
      end

      def password=(new_password)
        @password = Password.create(new_password)
        self.password_hash = @password
      end
    end
  end
end


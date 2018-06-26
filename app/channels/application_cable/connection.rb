module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
      # logger.add_tags 'ActionCable', current_user.email        # used to display debugging information in the console
    end

    protected

    def find_verified_user # this checks whether a user is authenticated with devise
      if current_user = env['warden'].user
        current_user
      else
        reject_unauthorized_connection
      end
    end
  end
end

class ApplicationController < ActionController::Base
def after_sign_in_path_for(current_user)
  projects_path
end

before_action :authenticate_user!
end

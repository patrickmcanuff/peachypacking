class ApplicationController < ActionController::Base
def after_sign_in_path_for(resource)
  home_path(resource)
end

before_action :authenticate_user!
end

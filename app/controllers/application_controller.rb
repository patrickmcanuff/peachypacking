class ApplicationController < ActionController::Base
def after_sign_in_path_for(current_user)
  projects_path
end

before_action :authenticate_user!
end

def default_url_options
  { host: ENV["www.peachypacking.com"] || "localhost:3000" }
end

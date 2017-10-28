class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include StudentSessionsHelper
  include TeacherSessionsHelper
  include ApplicationHelper
end

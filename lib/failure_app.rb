require 'devise'

class Sebastian::FailureApp < Devise::FailureApp
  def redirect_url
    sign_in_path
  end
end

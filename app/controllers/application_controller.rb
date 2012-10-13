class ApplicationController < ActionController::Base
  protect_from_forgery

  def welcome
  end

  private

  def authenticate!
    redirect_to root_path unless user_signed_in?
  end

  def repository_from_path
    Repository.where(params.slice(:owner_name, :name)).first
  end

  def repository_path(repository)
    super(repository.attributes.slice('owner_name','name'))
  end
  helper_method :repository_path
end

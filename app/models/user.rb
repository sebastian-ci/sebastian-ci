class User < ActiveRecord::Base
  devise :omniauthable

  attr_accessible :name, :login, :email, :github_id, :github_oauth_token, :gravatar_id, :locale

  has_many :repositories, :as => :owner

  class << self
    def find_or_create_for_oauth(payload)
      find_or_create_by(payload)
    end

    def find_or_create_by(payload)
      attrs = attributes_from(payload)
      user = User.find_by_github_id(attrs['github_id'])
      user ? user.update_attributes(attrs) : user = User.create!(attrs)
      user
    end

    def attributes_from(payload)
      {
        'name'               => payload['info']['name'],
        'email'              => payload['info']['email'],
        'login'              => payload['info']['nickname'],
        'github_id'          => payload['uid'].to_i,
        'github_oauth_token' => payload['credentials']['token'],
        'gravatar_id'        => payload['extra']['raw_info']['gravatar_id']
      }
    end
  end

  def all_repositories
    with_github do
      GH['user/repos?type=private'].map do |payload|
        repository   = Repository.by_slug(payload['full_name'])
        repository ||= repositories.build({
          :name         => payload['name'],
          :url          => payload['_links']['self']['href'],
          :description  => payload['description'],
          :owner_name   => payload['owner']['login'],
        })
      end
    end
  end

  def link_repository(slug)
    with_github do
      repository   = Repository.by_slug(slug)
      repository ||= begin
        payload = GH["repos/#{slug}"]
        repositories.create({
          :name         => payload['name'],
          :url          => payload['_links']['html']['href'],
          :description  => payload['description'],
          :owner_name   => payload['owner']['login'],
        })
      end
    end
  end

  private

  def with_github
    GH.with(:token => github_oauth_token) do
      yield
    end
  end
end

class Repository < ActiveRecord::Base
  attr_accessible :name, :url, :description, :owner_name

  belongs_to :owner, :polymorphic => true

  has_many :builds, :dependent => :delete_all
  has_one :last_build,   :class_name => 'Build', :order => 'id DESC', :conditions => { :state  => ['started', 'finished']  }
  has_one :last_success, :class_name => 'Build', :order => 'id DESC', :conditions => { :result => 0 }
  has_one :last_failure, :class_name => 'Build', :order => 'id DESC', :conditions => { :result => 1 }

  validates :name,       :presence => true, :uniqueness => { :scope => :owner_name }
  validates :owner_name, :presence => true

  class << self
    def recent
      limit(25)
    end
    def by_slug(slug)
      where(:owner_name => slug.split('/').first, :name => slug.split('/').last).first
    end
  end

  def to_param
    @slug ||= [owner_name, name].join('/')
  end
  alias :slug :to_param

  def source_url
    "git@github.com:#{slug}.git"
  end
end

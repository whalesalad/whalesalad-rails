class Tag < ActiveRecord::Base
  attr_accessible :name

  validates_uniqueness_of :name, :case_sensitive => false
  validates_presence_of :name

  has_and_belongs_to_many :posts

  acts_as_url :name, :url_attribute => :slug, :sync_url => true

  def to_s
    name
  end

  def to_param
    slug
  end

end

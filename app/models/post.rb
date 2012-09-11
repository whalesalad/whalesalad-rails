class Post < ActiveRecord::Base
  attr_accessible :title, :body, :link, :slug, :published, :tags

  has_and_belongs_to_many :tags

  validates :title, :presence => true
  validates :body, :presence => true

  acts_as_url :title, :url_attribute => :slug, :sync_url => true

  def to_param
    slug
  end

  def to_s
    title
  end

  def tag_string
    if tags.present?
      return tags.map { |tag| "<a href=\"/tagged/#{tag.slug}/\">#{tag.name}</a>" }
    end
  end
end

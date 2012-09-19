class Post < ActiveRecord::Base
  attr_accessible :title, :body, :link, :slug, :published, :tag_names

  has_and_belongs_to_many :tags

  attr_writer :tag_names
  after_save :assign_tags

  validates_presence_of :title, :body

  acts_as_url :title, :url_attribute => :slug, :sync_url => true

  def to_param
    slug
  end

  def to_s
    title
  end

  def is_link?
    @link.present?
  end

  def mkdown
    require 'rdiscount'
    markdown = RDiscount.new(self.body)
    return markdown.to_html
  end

  def tag_string
    tags.map { |tag| "<a href=\"/tagged/#{tag.slug}/\">#{tag.name}</a>" }
  end

  def tag_names
    @tag_names || tags.map(&:name).join(', ')
  end

  private

  def assign_tags
    if @tag_names
      self.tags = @tag_names.split(',').map do |name|
        Tag.find_or_create_by_name(name.strip)
      end
    end
  end

end

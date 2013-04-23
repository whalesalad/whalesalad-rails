class Post < ActiveRecord::Base
  attr_writer :tag_names

  has_and_belongs_to_many :tags
  
  after_save :assign_tags

  validates_presence_of :title, :body

  acts_as_url :title, :url_attribute => :slug, :sync_url => true

  default_scope -> { order("created_at DESC") }

  scope :published, -> { where(:published => true).includes(:tags) }

  def to_param
    slug
  end

  def to_s
    title
  end

  def is_link?
    @link.present?
  end

  def format_markdown
    require 'redcarpet'
    redcarpet = Redcarpet::Markdown.new PygmentizeHTML, :fenced_code_blocks => true
    return redcarpet.render self.body
  end

  def formatted
    format_markdown
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

class PygmentizeHTML < Redcarpet::Render::HTML
  def block_code(code, language)
    require 'pygmentize'
    Pygmentize.process(code, language)
  end
end
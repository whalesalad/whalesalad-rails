# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string(255)
#

class Tag < ActiveRecord::Base
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

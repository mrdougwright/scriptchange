class Script < ActiveRecord::Base
  has_attached_file :pdf
  validates_attachment_content_type :pdf, content_type: ["application/pdf","application/msword","text/plain"]
  validates_presence_of :slug

  has_many :authors
  has_many :ratings
  has_many :stars

  # http://www.filmsite.org/genres.html
  Genres = %w(action adventure comedy crime drama epic horror musical sci-fi war western)

  def to_param
    # overwrite rails method to return slug for id
    slug
  end

  def set_slug
    slug = title.downcase.gsub(/\W/, "-")
    count = Script.pluck(:slug).select{|s| s == slug }.count
    slug = "#{slug}-#{count}" if count >= 1
    slug
  end

  def count_view
    self.views += 1
    self.save
  end

  def uploaded_by?(user_id)
    self.authors.pluck(:user_id).include? user_id
  end

end

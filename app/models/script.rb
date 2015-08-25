class Script < ActiveRecord::Base
  has_attached_file :pdf
  validates_attachment_content_type :pdf, content_type: ["application/pdf","application/msword","text/plain"]
  validates_presence_of :slug

  before_validation do
    self.slug = self.set_slug
    self
  end

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

end

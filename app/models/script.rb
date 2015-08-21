class Script < ActiveRecord::Base
  def uploaded_file=(incoming_file)
    self.filename = incoming_file.original_filename
    self.content_type = incoming_file.content_type
    # may want to user Paperclip gem or similar
    # pretty sure the gsub(\u0000) hack messes up formatting
    self.data = incoming_file.read.gsub("\u0000",'')
  end

  def filename=(new_filename)
    write_attribute("filename", sanitize_filename(new_filename))
  end

private
  def sanitize_filename(filename)
    just_filename = File.basename(filename)
    just_filename.gsub(/[^\w\.\-]/, '_')
  end
end

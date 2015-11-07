module CreateS3Object
  def self.with_file(filename, tempfile)
    obj = S3_BUCKET.object(filename)
    obj.upload_file(tempfile)
    obj
  end
end
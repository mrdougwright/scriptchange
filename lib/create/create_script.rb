module CreateScript
  def self.with_user(user, params)
    script = Script.new(params.except(:file))
    script.slug = script.set_slug

    if ["application/pdf","application/msword","text/plain"].include? params[:file].content_type
      script.save!
      Author.create(user_id: user.id, script_id: script.id, name: user.name)
    else
      script.errors.add(:base, 'File type must be pdf, text or word.')
    end

    return script
  end

end

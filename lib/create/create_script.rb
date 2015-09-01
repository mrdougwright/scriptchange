module CreateScript
  def self.with_user(user, params)
    script = Script.new(params)
    script.slug = script.set_slug
    script.save!

    Author.create(user_id: user.id, script_id: script.id, name: user.name)
    return script
  end
end
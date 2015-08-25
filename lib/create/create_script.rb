module CreateScript
  def self.with_user(user, params)
    script = Script.create(params)
    Author.create(user_id: user.id, script_id: script.id)
    return script
  end
end
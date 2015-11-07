module ApplicationHelper
  def authenticate_script_author(script_slug)
    return false unless current_user
    script = current_user.scripts.find_by_slug(script_slug)
    unless current_script_author?(script)
      raise 'Must be current script author.'
    end
  end

  def current_script_author?(script)
    current_user && current_user.scripts.include?(script)
  end

  def pretty_errors(obj)
    obj.errors && obj.errors.full_messages.join('<br>').html_safe
  end
end

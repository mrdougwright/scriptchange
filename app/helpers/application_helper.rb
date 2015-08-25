module ApplicationHelper
  def authenticate_script_author!
    unless current_script_author?
      raise 'Must be current script author.'
    end
  end

  def current_script_author?
    return false unless current_user
    current_user.authors.pluck(:user_id).include? current_user.id
  end
end

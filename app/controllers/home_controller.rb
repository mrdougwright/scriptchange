class HomeController < ApplicationController

  def index
    taglines ||= YAML.load_file "lib/assets/taglines.yml"
    @tagline = taglines.to_a.sample
  end

end

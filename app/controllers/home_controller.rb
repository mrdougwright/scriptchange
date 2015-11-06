class HomeController < ApplicationController

  def index
    taglines ||= Taglines.to_a
    @tagline ||= taglines.sample
  end

end

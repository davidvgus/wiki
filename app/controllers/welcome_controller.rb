

class WelcomeController < ApplicationController
  def index
    @pages = Page.public
  end
end

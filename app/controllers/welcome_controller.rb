

class WelcomeController < ApplicationController
  def index
    #@my_pages = current_user.pages if current_user
    @pages = Page.public
  end
end

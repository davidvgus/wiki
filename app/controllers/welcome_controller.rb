

class WelcomeController < ApplicationController
  def index
    @pages = Page.public
    if current_user
      @pages.concat( current_user.joint_pages )
    end
  end
end

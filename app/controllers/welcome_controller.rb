

class WelcomeController < ApplicationController
  def index
    @pages = Page.public
    authorize @pages
    if current_user
      @pages.concat( current_user.joint_pages )
    end
  end
end

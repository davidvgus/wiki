class WelcomeController < ApplicationController
  def index
    @pages = Page.public
    authorize @pages
    if current_user
      @pages = @pages.concat( current_user.joint_pages ).uniq
      @pages = @pages.concat( current_user.pages.where(private: true) )
    end
  end
end

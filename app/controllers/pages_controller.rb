class PagesController < ApplicationController

  def dashboard
    @chalets = Chalet.where(user: current_user)
  end
end

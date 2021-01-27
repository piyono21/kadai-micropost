class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.fav(micropost)
    flash[:success] = "お気に入りに登録しました。"
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @micropost = Micropost.find(params[:micropost_id])
    current_user.unfav(micropost)
    redirect_back(fallback_location: root_path)
  end
end

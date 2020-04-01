class ZaikosController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  
  def index
    @zaiko = current_user.zaikos.build
    @zaikos = current_user.zaikos
    @user = current_user
  end
  
  def create
    @zaiko = current_user.zaikos.build(zaiko_params)
    if @zaiko.save
      flash[:success] = '追加しました。'
      redirect_to zaikos_path
    else
      flash.now[:danger] = '追加に失敗しました。'
      render zaikos_path
    end
  end
  
  def destroy
    @zaiko = Zaiko.find(params[:id])
    @zaiko.destroy
    flash[:success] = '削除しました。'
    redirect_back(fallback_location:zaiko_path )
  end
  
  def update
    @zaiko = Zaiko.find(params[:id])
    num = params[:num]
    @number = @zaiko.number + num.to_i
    if @number >= 0
      @zaiko.number = @number
      @zaiko.save
    else
      flash[:danger] = '更新できませんでした。在庫がマイナスとなります。'
    end
  end
  
  def graph
    @user = current_user
  end
  
  def order
    @user = current_user
  end
  
  def add
    @zaiko = current_user.zaikos.build
    @user = current_user
  end
  
  private
  
  def zaiko_params
    params.require(:zaiko).permit(:content, :number, :image_name)
  end
end

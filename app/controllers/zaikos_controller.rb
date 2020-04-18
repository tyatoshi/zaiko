class ZaikosController < ApplicationController
  before_action :require_user_unlogged_in
  before_action :zaiko_first, only: [:index, :graph, :order, :add]
  
  def index

  end
  
  def create
    @zaiko = current_user.zaikos.build(zaiko_params)
    if @zaiko.save
      flash[:success] = '追加しました。'
      graph = @zaiko.trends.build(article:zaiko_params[:number], user_id:current_user.id, zaiko_id:@zaiko.id)
      graph.save
      redirect_to zaikos_path
    else
      flash.now[:danger] = '追加に失敗しました。'
      #render "/zaikos/#{@zaiko.user_id}/add",formats: :html ,handlers: :html ,variants: :html
      #render add_zaiko_path locals: { id: @zaiko.user_id }
      #render create
      zaiko_first
      render :add
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
    
    num = params[:num].to_i
    @number = @zaiko.number + num
    
    if @number >= 0
      @zaiko.number = @number
      @zaiko.save
      if num == 1
        graph = @zaiko.trends.build(article:@number, increase:num, user_id:current_user.id)
        graph.save
      else
        graph = @zaiko.trends.build(article:@number, decrease:num,user_id:current_user.id)
        graph.save
        if @number == 0
          NotificationMailer.info_message(@zaiko).deliver
        end
      end
    else
      flash[:danger] = '更新できませんでした。在庫がマイナスとなります。'
    end
    
  end
  
  def graph
    @zaikos = current_user.zaikos
    @graph = Trend.all
  end
  
  def order
    @zaikos = current_user.zaikos
  end
  
  def add

  end
  
  private
  
  def zaiko_params
    params.require(:zaiko).permit(:content, :number, :image_name)
  end
  
  def zaiko_first
    @zaiko = current_user.zaikos.build
    @zaikos = current_user.zaikos
    @user = current_user
    @have = current_user.zaikos.first
  end
  
end

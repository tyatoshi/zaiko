class ZaikoController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  
  def index
  
  end
  
end

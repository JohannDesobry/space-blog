class UsersController < ApplicationController

    before_action :find_user, only: [:edit, :update, :show, :delete]
  
    def index
        @users = User.order('created_at DESC')
    end
  
    def show
        @user = User.find(params[:id])
        @posts = @user.posts.order('created_at DESC')
    end
  
    def new
        @user = User.new
    end
  
    def create
        @user = User.create(params[:user].permit!)
        redirect_to user_path(@user.id) if @user.persisted?
    end
  
    private
  
    def find_user
        @user = User.find(params[:id])
    end
  
  end
  
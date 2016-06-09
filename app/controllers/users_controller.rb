class UsersController < ApplicationController
  before_action :user, except: [:index, :new, :create]

  def index
    # BAD Practice
    @users = User.all.by_last_name

    # GOOD Practice - Paginate (eg. will_paginate)
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

    def user
      @user = User.find(params[:id])
    end

    def user_params
      # More Secure
      # params.require(:user).permit(:email, :first_name, :last_name, tasks_attributes: ['0' => :name, '1' => :name, '2' => :name], address_attributes: [:city, :street, :zip, :state])
      
      # Less secure but we have defense in our model
      params.require(:user).permit!
    end
end

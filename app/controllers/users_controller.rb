#coding: utf-8
class UsersController < ApplicationController
  layout 'greeting', only: [:new, :create]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:info] = 'An confirmation email has sent to your mailbox'
      redirect_to root_url
    else
      flash[:error] = @user.errors.full_messages
      render 'new'
    end
  end

  def edit
    @user = User.new
  end

  def update
    #@user = User.find(params[:id])
    #if @user.update_attribute(params[:user])
    #  render 'show'
    #else
    #  render 'edit'
    #end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "Successfully removed user #{@user.name}"
    redirect_to users_path
  end
end

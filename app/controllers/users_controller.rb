#coding: utf-8
class UsersController < ApplicationController
  layout 'greeting', only: [:new, :create]

  def index
    @users = User.page(params[:page]).per_page(15)
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
      # send out the activation email to the user
      @user.send_registration_confirmation
      # route user to the confirmation email sent page
      flash[:info] = 'An confirmation email has sent to your mailbox'
      redirect_to root_path
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
    #if @user.update_attributes(params[:user])
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

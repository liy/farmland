#coding: utf-8
class UserMailer < ActionMailer::Base
  default :from => 'theenglishpostoffice@gmail.com'

  def registration_confirmation(user)
    @user = user
    mail :to => "#{user.name} <#{user.email}>", :subject => '奥坤帐户认证'
  end

  def password_reset(user)
    @user = user
    mail :to => "#{user.name} <#{user.email}>", :subject => '奥坤修改密码'
  end

end
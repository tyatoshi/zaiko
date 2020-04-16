class NotificationMailer < ApplicationMailer
  include SessionsHelper

  def send_message(name)
    @email = name.email
    @name =  name.name

    mail to: @email, subject: 'Zaikoへの登録が完了しました'
  end
  
  def info_message(zaiko)
    @content = zaiko.content
    @email = zaiko.user.email
    mail to: @email, subject: "在庫が0となりました"
  end  
  
end
class Notifier < ActionMailer::Base
  default :from => "ckesurf@gmail.com"

  # send a signup email to the user, pass in the user object that contains the user's email address
  def signup_email(user)
    mail( :to => user.email,
    :subject => "Thanks for signing up!" )
  end

  def contact(buyer, seller)
  	mail( 
  	:from => buyer.email,
  	:to => seller.email,
  	:subject => "Buy request!",
  	:body => "#{buyer.email} is interested in buying your product!
  				Contact the buyer with details of when and where to meet")
  end

end
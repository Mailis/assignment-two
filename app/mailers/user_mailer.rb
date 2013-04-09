class UserMailer < ActionMailer::Base
  default from: "noReply@gmail.com"
  
    
  def teavitus_email(post, comment) 
    @post = post
    @comment = comment
    email_with_name = "#{@post.name} <#{@post.author_email}>"
    mail(:to => email_with_name,
         :subject => "Teie postitusele \"#{@post.title}\" on lisandunud 
          kasutaja #{@comment.commenter} kommentaar.")
  end
end

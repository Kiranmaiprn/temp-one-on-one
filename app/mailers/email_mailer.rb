class EmailMailer < ApplicationMailer
    def signup_mail(email)
        mail to: email,
        subject: "Signup email",
        body: email
    end
end

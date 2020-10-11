require 'sendgrid-ruby'
include SendGrid

class UserMailer < ApplicationMailer
  def activate(user)
    from = SendGrid::Email.new(email: Settings.email.from)
    to = SendGrid::Email.new(email: user.email)
    subject = t('email.activation.subject')
    content = SendGrid::Content.new(
      type: 'text/plain',
      value: t(
        'email.activation.content',
        :url => "#{Settings.url}/#/users/#{user.id}/activation/#{user.library_users.first.activation_code}/"
      )
    )

    mail = SendGrid::Mail.new(from, subject, to, content)
    sg = SendGrid::API.new(api_key: Rails.application.credentials.dig(:email, :api_key))
    response = sg.client.mail._('send').post(request_body: mail.to_json)
  end
end

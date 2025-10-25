# frozen_string_literal: true


class SendEmailService
  attr_reader :to, :html_content, :subject, :attachments

  def initialize(to:, html_content:, subject:, attachments: [])
    @to = to
    @html_content = html_content
    @subject = subject
    @attachments = attachments
  end

  def call
    Mailjet::Send.create(
      messages: [{
        'From'=> {
          'Email'=> sender,
          'Name'=> subject
        },
        'To'=> [{
          'Email'=> to,
          # 'Name'=> params[:name] # Note(mantecajc): value not printed in the email
        }],
        'Subject'=> subject,
        # 'TextPart'=> params[:message], # Note(mantecajc): value not printed in the email when sending HTMLPart
        'HTMLPart'=> html_content,
        'Attachments'=> attachments
      }]
    )
  end

  private

  def sender
    ENV['MAILJET_SENDER']
  end
end

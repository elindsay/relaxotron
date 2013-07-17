unless Rails.env.development?
  Paperclip::Attachment.default_options[:url] = ':s3_domain_url'
end

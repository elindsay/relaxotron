if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['PUBLISHABLE_KEY'],
    :secret_key      => ENV['SECRET_KEY']
  }
else
  #test keys
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_ZR5ub2OuTpr5ucgDlcGdTPYr',
    :secret_key      => 'sk_test_9aKZdwLrYgU7IEpexI6yvw8E'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]

class AdminController < ApplicationController
  before_filter :authenticate

  protected
    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        username == "thebusman" && password == "AsDf1234!"
      end
  end
end

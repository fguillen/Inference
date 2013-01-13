class ApplicationController < ActionController::Base
  protect_from_forgery
  http_basic_authenticate_with :name => "inference", :password => "pass"

  after_filter :metrics

  private

  def metrics
    Inference::Client.insert("key.request", Time.now, rand(100))
  end
end

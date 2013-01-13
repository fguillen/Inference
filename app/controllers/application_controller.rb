class ApplicationController < ActionController::Base
  protect_from_forgery

  after_filter :metrics

  private

  def metrics
    Inference::Client.insert("key.request", Time.now.to_i, rand(100))
  end
end

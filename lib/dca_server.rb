require 'goliath'
require 'faye'
require 'faye/redis'

require File.expand_path('../dca_server/application', __FILE__)

class FayeServer < Goliath::API
  def response(env)
    App.call(env)
  end
end
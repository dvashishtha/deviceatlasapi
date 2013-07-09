require "deviceatlasapi/version"
require "uri"
require 'httparty'

module DeviceAtlasApi
  autoload :ControllerHelpers, 'deviceatlasapi/controller'

  def self.setup
    yield self
  end


  class Client

    def initialize user_agent
      @user_agent = user_agent
      @cloud_host = 'api.deviceatlascloud.com'
    end

    def get_device_data
      HTTParty.get("http://#{@cloud_host}/#{prepare_request_header}")["properties"]
    end

    private

    def prepare_request_header
      "/v1/detect/properties?licencekey=#{ENV['DEVICE_ATLAS_LICENCE_KEY']}&useragent=#{URI.escape(@user_agent)}"
    end
  end
end

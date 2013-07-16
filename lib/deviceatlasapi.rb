require "deviceatlasapi/version"
require "uri"
require 'httparty'

module DeviceAtlasApi
  autoload :ControllerHelpers, 'deviceatlasapi/controller'

  def self.setup
    yield self
  end

  class Client

    def initialize request
      @user_agent = request.env['HTTP_USER_AGENT']
      @headers = prepare_headers request
      @cloud_host = 'api.deviceatlascloud.com'
    end

    def get_device_data
      url = prepare_url
      HTTParty.get(url, @headers)["properties"]
    end

    private

    def prepare_headers request
      {
          'HTTP_X_PROFILE' => request.env['HTTP_X_PROFILE'],
          'HTTP_X_WAP_PROFILE' => request.env['HTTP_X_WAP_PROFILE'],
          'HTTP_X_ATT_DEVICEID' => request.env['HTTP_X_ATT_DEVICEID'],
          'HTTP_ACCEPT' => request.env['HTTP_ACCEPT'],
          'HTTP_ACCEPT_LANGUAGE' => request.env['HTTP_ACCEPT_LANGUAGE'],
          'HTTP_X_DEVICE_USER_AGENT' => request.env['HTTP_X_DEVICE_USER_AGENT'],
          'HTTP_X_ORIGINAL_USER_AGENT' => request.env['HTTP_X_ORIGINAL_USER_AGENT'],
          'HTTP_X_OPERAMINI_PHONE_UA' => request.env['HTTP_X_OPERAMINI_PHONE_UA'],
          'HTTP_X_SKYFIRE_PHONE' => request.env['HTTP_X_SKYFIRE_PHONE'],
          'HTTP_X_BOLT_PHONE_UA' => request.env['HTTP_X_BOLT_PHONE_UA'],
          'HTTP_DEVICE_STOCK_UA' => request.env['HTTP_DEVICE_STOCK_UA'],
          'HTTP_X_UCBROWSER_DEVICE_UA' => request.env['HTTP_X_UCBROWSER_DEVICE_UA'],
      }
    end

    def prepare_url
      "http://#{@cloud_host}/v1/detect/properties?licencekey=#{ENV['DEVICE_ATLAS_LICENCE_KEY']}&useragent=#{URI.escape(@user_agent)}"
    end
  end
end

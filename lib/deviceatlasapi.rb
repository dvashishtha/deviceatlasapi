require "deviceatlasapi/version"
require "uri"

module DeviceAtlasApi
  autoload :ControllerHelpers, 'deviceatlasapi/controller'

  def self.setup
    yield self
  end


  class Client

    def initialize user_agent
      @user_agent = user_agent
      @cloud_host = 'api.deviceatlascloud.com'
      @cloud_port = '80'
      #@cloud_path = '/v1/detect/properties?licencekey=%s&useragent=%s'
    end
    #$user_agent = $test_mode? self::TEST_USERAGENT: $_SERVER['HTTP_USER_AGENT'];

    #@use_client_cookie = true
    #const CLOUD_HOST            = 'api.deviceatlascloud.com';
    #const CLOUD_PORT            = '80';
    #const CLOUD_PATH            = '/v1/detect/properties?licencekey=%s&useragent=%s';
    #const TEST_USERAGENT        = 'Mozilla/5.0 (Linux; U; Android 2.3.3; en-gb; GT-I9100 Build/GINGERBREAD) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.1';

    def get_device_data
      {
          :agent => @user_agent,
          :header => prepare_request_header,
          :model => "This is a test device",
          :year_of_release => "2011"
      }
    end

    private

    def prepare_request_header

      path = "/v1/detect/properties?licencekey=#{ENV['DEVICE_ATLAS_LICENCE_KEY']}"
      headers_str
    end

    #private static function prepareRequestHeader($user_agent, $cookie) {
    #  $path = sprintf(self::CLOUD_PATH, self::LICENCE_KEY, urlencode($user_agent));
    #
    #  // prepare headers
    #  $headers_str  = 'GET '.$path." HTTP/1.0\r\n";
    #  $headers_str .= 'Host: '.self::CLOUD_HOST."\r\n";
    #  $headers_str .= "Accept: application/json\r\n";
    #  $headers_str .= "User-Agent: php\r\n"; // fsockopen sometimes needs a UA
    #  $headers_str .= self::DA_HEADER_PREFIX.'Version: '.self::API_VERSION."\r\n";
    #
    #  // add cookie created in JS, device data to the header
    #  if ($cookie) {
    #      $headers_str .= self::DA_HEADER_PREFIX.self::CLIENT_COOKIE_HEADER.
    #  ': "'.str_replace(array("\n", "\r"), '', trim($cookie, '"'))."\"\r\n";
    #  }
    #
    #  // add any client headers to be forward to DA
    #  if (!empty($_SERVER)) {
    #      // add "essential" headers
    #  foreach (array_merge(self::$ESSENTIAL_HEADERS,
    #                             self::$ESSENTIAL_USER_AGENT_HEADERS) as $header) {
    #
    #      if (isset($_SERVER[$header])) {
    #          $headers_str .= self::convertHeader($header).': '.
    #                                                       $_SERVER[$header]."\r\n";
    #      }
    #      }
    #      // add any Opera or any other special headers as these may contain
    #      // extra device information
    #      foreach ($_SERVER as $header => $val) {
    #          if (stristr($header, 'opera')) {
    #              $headers_str .= self::convertHeader($header).': '.$val."\r\n";
    #          }
    #          }
    #          // add extra "optional" headers
    #          if(self::SEND_EXTRA_HEADERS) {
    #              foreach (self::$EXTRA_HEADERS as $header) {
    #              if (isset($_SERVER[$header])) {
    #                  $headers_str .= self::convertHeader($header).': '.
    #                                                               $_SERVER[$header]."\r\n";
    #              }
    #              }
    #              }
    #              }
    #
    #              $headers_str .= "Connection: Close\r\n\r\n";
    #              return $headers_str;
    #              }
  end
end

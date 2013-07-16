module DeviceAtlasApi
  module ControllerHelpers

    def get_device_data
      client = DeviceAtlasApi::Client.new(request)
      client.get_device_data
    end

  end
end
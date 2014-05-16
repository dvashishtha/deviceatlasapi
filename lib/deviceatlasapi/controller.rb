module DeviceAtlasApi
  module ControllerHelpers

    def get_device_data
      begin
      	client = DeviceAtlasApi::Client.new(request)
      	client.get_device_data
      rescue => error
      	puts "Error => #{error}"
      	return nil
      end
    end

  end
end
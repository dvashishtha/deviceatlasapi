# Deviceatlasapi

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'deviceatlasapi'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install deviceatlasapi

## Usage

TODO: Write usage instructions here

    You need a valid Device Atlas API Key available here

    http://deviceatlas.com

    Set the property 'DEVICE_ATLAS_LICENCE_KEY' in your environment variable

###Controller Based

We have only enabled a controller based flow at the moment - as this is the simplest use case required

Add the following line in the file "app/controllers/application.rb"

    ApplicationController < ActionController::Base
        include DeviceAtlasApi::ControllerHelpers

        def index
            @device_info = get_device_info
        end
    end


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

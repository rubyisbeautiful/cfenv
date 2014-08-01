module Cfenv
  module Services

    def vcap_services
      str = ENV['VCAP_SERVICES']
      str ||= '{}'
      obj = MultiJson.load str
      Hashie::Mash.new(obj)
    end


    def services(service_name)
      vcap_services[service_name] || []
    end


    def service(service_name)
      s = services(service_name).first
    end

  end

end

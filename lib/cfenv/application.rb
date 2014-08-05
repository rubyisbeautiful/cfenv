module Cfenv

  module Application

    WHITELISTED_SYMBOLS = %i(
      application_users users
      instance_id instance_index
      application_version application_name
      application uris
      started_at start started_at_timestamp
      host port limits
    )


    def vcap_application
      str = ENV['VCAP_APPLICATION']
      str ||= '{}'
      obj = MultiJson.load str
      Hashie::Mash.new(obj)
    end


    # all taken from http://docs.run.pivotal.io/devguide/deploy-apps/environment-variable.html#VCAP-APPLICATION
    def method_missing_with_whitelisted_symbol_check(method, *args)
      if WHITELISTED_SYMBOLS.include?(method)
        vcap_application.send(method)
      else
        method_missing_without_whitelisted_symbol_check(method, args)
      end
    end
    alias_method :method_missing_without_whitelisted_symbol_check, :method_missing
    alias_method :method_missing, :method_missing_with_whitelisted_symbol_check


    def vcap_name
      vcap_application.name || vcap_application.application_name
    end

    def vcap_version
      vcap_application.version || vcap_application.application_version
    end

  end

end

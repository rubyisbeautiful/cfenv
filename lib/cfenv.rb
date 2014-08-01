require 'multi_json'
require 'hashie/mash'

require 'cfenv/version'
require 'cfenv/services'
require 'cfenv/application'

module Cfenv
  extend Cfenv::Services
  extend Cfenv::Application
end

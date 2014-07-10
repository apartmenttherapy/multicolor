require 'active_support/core_ext'
require 'faraday'

require 'multicolor/configuration'
require 'multicolor/util'
require 'multicolor/version'

require 'multicolor/errors/bad_response'
require 'multicolor/errors/company_not_set'

require 'multicolor/rest/transport'
require 'multicolor/rest/client'
require 'multicolor/rest/search_builder'
require 'multicolor/rest/endpoints/filepath'
require 'multicolor/rest/endpoints/indexing'
require 'multicolor/rest/endpoints/metadata'


module Multicolor
end

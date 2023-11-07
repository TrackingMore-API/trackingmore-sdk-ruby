$:.unshift File.dirname(__FILE__)

require 'trackingmore/const'
require 'trackingmore/exception'
require 'trackingmore/courier'
require 'trackingmore/tracking'
require 'trackingmore/air_waybill'

module TrackingMore
  class << self
    attr_accessor :api_key
  end

  VERSION = '0.1.2'
end


require File.dirname(__FILE__) + '/request'

module TrackingMore
  class Courier
    @@api_module = 'couriers'
    def self.get_all_couriers
      TrackingMore::Request.make_request('get',"#@@api_module/all")
    end
    def self.detect(params = {})
      if params["tracking_number"].to_s.empty?
        raise TrackingMore::TrackingMoreException.new(TrackingMore::Consts::ErrMissingTrackingNumber)
      end
      TrackingMore::Request.make_request('post',"#@@api_module/detect",params)
    end
  end
end
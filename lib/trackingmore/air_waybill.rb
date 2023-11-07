require File.dirname(__FILE__) + '/request'

module TrackingMore
  class AirWaybill
    def self.create_an_air_waybill(params = {})
      if params["awb_number"].to_s.empty?
        raise TrackingMore::TrackingMoreException.new(TrackingMore::Consts::ErrMissingAwbNumber)
      end
      if !params['awb_number'].match(/^\d{3}[ -]?(\d{8})$/)
        raise TrackingMore::TrackingMoreException.new(TrackingMore::Consts::ErrInvalidAirWaybillFormat)
      end
      TrackingMore::Request.make_request('post',"awb",params)
    end
  end
end
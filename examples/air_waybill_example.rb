$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require  'trackingmore'

TrackingMore.api_key = 'your api key'

begin
  params  = {"awb_number" => "235-69030430"}
  response = TrackingMore::AirWaybill.create_an_air_waybill(params)
  puts response
rescue TrackingMore::TrackingMoreException => e
  puts "Caught Custom Exception: #{e.message}"
rescue StandardError => e
  puts "Caught Standard Error: #{e.message}"
end
$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require  'trackingmore'

TrackingMore.api_key = 'your api key'

begin
  response = TrackingMore::Courier.get_all_couriers
  puts response
rescue TrackingMore::TrackingMoreException => e
  puts "Caught Custom Exception: #{e.message}"
rescue StandardError => e
  puts "Caught Standard Error: #{e.message}"
end


begin
  params  = {"tracking_number" => "92612903029511573030094547"}
  response = TrackingMore::Courier.detect(params)
  puts response
rescue TrackingMore::TrackingMoreException => e
  puts "Caught Custom Exception: #{e.message}"
rescue StandardError => e
  puts "Caught Standard Error: #{e.message}"
end

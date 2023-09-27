$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require 'rspec'
require 'trackingmore'

describe TrackingMore::Request do
  before do
    TrackingMore.api_key = 'you api key'
  end

  describe '.make_request' do
    context 'make_request' do
      it 'with valid apikey' do
        params = { "awb_number" => "235-69030430" }
        TrackingMore::Request.make_request('post',"awb",params)
      end
      it 'raises an exception for missing apikey' do
        TrackingMore.api_key = ''
        params = { "awb_number" => "235-69030430" }
        expect { TrackingMore::Request.make_request('post',"awb",params) }.to raise_error(TrackingMore::TrackingMoreException, TrackingMore::Consts::ErrEmptyAPIKey)
      end
    end
  end

end
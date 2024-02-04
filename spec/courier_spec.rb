$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require 'rspec'
require 'trackingmore'

describe TrackingMore::Courier do
  before do
    TrackingMore.api_key = 'your api key'
  end

  describe '.get_all_couriers' do
    context 'get_all_couriers' do
      it 'returns a list of couriers' do
        response = TrackingMore::Courier.get_all_couriers
        expect(response).to be_a(Hash)
        expect(response['meta']['code']).to eq(200)
      end
    end
  end

  describe '.detect' do
    context 'detect' do
      it 'detects a tracking number' do
        params = { "tracking_number" => "YOUR_TRACKING_NUMBER" }
        response = TrackingMore::Courier.detect(params)
        expect(response).to be_a(Hash)
        expect(response['meta']['code']).to eq(200)
      end

      it 'raises an exception for missing tracking number' do
        params = { "tracking_number" => "" }
        expect { TrackingMore::Courier.detect(params) }.to raise_error(TrackingMore::TrackingMoreException, TrackingMore::Consts::ErrMissingTrackingNumber)
      end
    end
  end
end
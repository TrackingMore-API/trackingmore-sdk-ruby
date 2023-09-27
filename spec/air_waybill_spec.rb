$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require 'rspec'
require 'trackingmore'

describe TrackingMore::AirWaybill do
  before do
    TrackingMore.api_key = 'you api key'
  end

  describe '.create_an_air_waybill' do
    context 'with valid parameters' do
      it 'creates an air waybill' do
        params = { "awb_number" => "235-69030430" }
        response = TrackingMore::AirWaybill.create_an_air_waybill(params)
        expect(response).to be_a(Hash)
        expect(response['meta']['code']).to eq(200)
      end
    end

    context 'with missing awb_number' do
      it 'raises an exception' do
        params = { "awb_number" => "" }
        expect { TrackingMore::AirWaybill.create_an_air_waybill(params) }.to raise_error(TrackingMore::TrackingMoreException, TrackingMore::Consts::ErrMissingAwbNumber)
      end
    end

    context 'with invalid awb_number format' do
      it 'raises an exception' do
        params = { "awb_number" => "123" }
        expect { TrackingMore::AirWaybill.create_an_air_waybill(params) }.to raise_error(TrackingMore::TrackingMoreException, TrackingMore::Consts::ErrInvalidAirWaybillFormat)
      end
    end
  end
end
$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require 'rspec'
require 'trackingmore'

describe TrackingMore::Tracking do
  before do
    TrackingMore.api_key = 'you api key'
  end

  describe '.create_tracking' do
    context 'with valid parameters' do
      it 'creates a tracking' do
        params = { "tracking_number" => "92611903029511573030094547", "courier_code" => "usps" } # Uncreated Order Numbers
        response = TrackingMore::Tracking.create_tracking(params)
        expect(response).to be_a(Hash)
        expect(response['meta']['code']).to eq(200)
      end
    end

    context 'with missing tracking_number' do
      it 'raises an exception' do
        params = { "tracking_number" => "", "courier_code" => "usps" }
        expect { TrackingMore::Tracking.create_tracking(params) }.to raise_error(TrackingMore::TrackingMoreException, TrackingMore::Consts::ErrMissingTrackingNumber)
      end
    end

    context 'with missing courier_code' do
      it 'raises an exception' do
        params = { "tracking_number" => "92612903029511573030094547", "courier_code" => "" }
        expect { TrackingMore::Tracking.create_tracking(params) }.to raise_error(TrackingMore::TrackingMoreException, TrackingMore::Consts::ErrMissingCourierCode)
      end
    end
  end

  describe '.get_tracking_results' do
    context 'get_tracking_results' do
      it 'returns tracking results' do
        params  = {"tracking_numbers" => "92612903029511573130094547,92612903029511573030094548","courier_code"=>"usps"}
        response = TrackingMore::Tracking.get_tracking_results(params)
        expect(response).to be_a(Hash)
        expect(response['meta']['code']).to eq(200)
      end
    end
  end

  describe '.batch_create_trackings' do
    context 'with valid params' do
      it 'creates trackings successfully' do
        params = [
          { "tracking_number" => "92612903029611573130094547", "courier_code" => "usps" },
          { "tracking_number" => "92612903029611573130094548", "courier_code" => "usps" }
        ]
        response = TrackingMore::Tracking.batch_create_trackings(params)
        expect(response).to be_a(Hash)
        expect(response['meta']['code']).to eq(200)
      end
    end

    context 'with too many tracking numbers' do
      it 'raises an exception' do
        params = []
        41.times { |i| params << { "tracking_number" => "T#{i}", "courier_code" => "Courier#{i}" } }
        expect { TrackingMore::Tracking.batch_create_trackings(params) }.to raise_error(TrackingMore::TrackingMoreException, TrackingMore::Consts::ErrMaxTrackingNumbersExceeded)
      end
    end

    context 'with missing tracking number' do
      it 'raises an exception' do
        params = [{ "tracking_number" => "", "courier_code" => "UPS" }]
        expect { TrackingMore::Tracking.batch_create_trackings(params) }.to raise_error(TrackingMore::TrackingMoreException, TrackingMore::Consts::ErrMissingTrackingNumber)
      end
    end

    context 'with missing courier code' do
      it 'raises an exception' do
        params = [{ "tracking_number" => "12345", "courier_code" => "" }]
        expect { TrackingMore::Tracking.batch_create_trackings(params) }.to raise_error(TrackingMore::TrackingMoreException, TrackingMore::Consts::ErrMissingCourierCode)
      end
    end
  end

  describe '.update_tracking_by_id' do
    context 'with a valid id' do
      it 'updates tracking information successfully' do
        id_string = '99f4ed7fc73aa83fe68fd69ab6458b28'
        params = {"customer_name" => "New name","note"=>"New tests order note"}
        response = TrackingMore::Tracking.update_tracking_by_id(id_string, params)
        expect(response).to be_a(Hash)
        expect(response['meta']['code']).to eq(200)
      end
    end

    context 'with an empty id' do
      it 'raises an exception' do
        id_string = ''
        params = {"customer_name" => "New name","note"=>"New tests order note"}
        expect { TrackingMore::Tracking.update_tracking_by_id(id_string, params) }.to raise_error(TrackingMore::TrackingMoreException, TrackingMore::Consts::ErrEmptyId)
      end
    end
  end

  describe '.delete_tracking_by_id' do
    context 'with a valid id' do
      it 'deletes tracking information successfully' do
        id_string = '9a3b187d8fb6b600809859e778b632c3'
        response = TrackingMore::Tracking.delete_tracking_by_id(id_string)
        expect(response).to be_a(Hash)
        expect(response['meta']['code']).to eq(200)
      end
    end

    context 'with an empty id' do
      it 'raises an exception' do
        id_string = ''
        expect { TrackingMore::Tracking.delete_tracking_by_id(id_string) }.to raise_error(TrackingMore::TrackingMoreException, TrackingMore::Consts::ErrEmptyId)
      end
    end
  end

  describe '.retrack_tracking_by_id' do
    context 'with a valid id' do
      it 'retracks tracking information successfully' do
        id_string = '9a3b187d8fb6b600809859e778b632c3' # Replace with expired tracking order number
        response = TrackingMore::Tracking.retrack_tracking_by_id(id_string)
        expect(response).to be_a(Hash)
        expect(response['meta']['code']).to eq(200)
      end
    end

    context 'with an empty id' do
      it 'raises an exception' do
        id_string = ''
        expect { TrackingMore::Tracking.retrack_tracking_by_id(id_string) }.to raise_error(TrackingMore::TrackingMoreException, TrackingMore::Consts::ErrEmptyId)
      end
    end
  end
end

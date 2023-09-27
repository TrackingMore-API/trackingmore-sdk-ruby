
module TrackingMore
  class TrackingMoreException < StandardError
    def initialize(message = '')
      super(message)
    end
  end
end
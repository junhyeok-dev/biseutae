class SimilarityChannel < ApplicationCable::Channel
  def subscribed
    stream_from "similarity_channel_#{}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
  end
end

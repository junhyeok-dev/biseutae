# frozen_string_literal: true

module Clients
  class OpenAIClient
    class << self
      def create_thread
        thread = client.threads.create

        thread["id"]
      end

      def create_message(thread_id, message_content)
        message = client.messages.create(
          thread_id: thread_id,
          parameters: {
            role: "user",
            message: message_content
          }
        )

        message["id"]
      end

      def run_thread(thread_id)
        client.runs.create(
          thread_id: thread_id,
          parameters: {
            assistant_id: ENV.fetch("ASSISTANT_ID"),
            max_prompt_tokens: 256,
            max_completion_tokens: 16
          }
        )
      end

      private

      def client
        OpenAI.configure do |config|
          config.access_token = ENV.fetch("OPENAI_ACCESS_TOKEN")
          config.log_errors = true
        end
        OpenAI::Client.new
      end
    end
  end
end

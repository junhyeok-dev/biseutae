class AnswerController < ApplicationController
  def create
    @answer = Answer.new(answer_params)

    turbo_stream_message = <<-HTML
      <turbo-stream action="append" target="answer-history">
        <template>
          <div class="message">#{@answer.content}</div>
        </template>
      </turbo-stream>
    HTML

    ActionCable.server.broadcast("similarity_channel_#{}", turbo_stream_message)

    if @answer.save
      respond_to do |format|
        format.turbo_stream
        format.json { render json: { message: "Answer created successfully" }, status: :created }
      end
    else
      render json: { message: "Answer not created" }, status: :unprocessable_entity
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end
end

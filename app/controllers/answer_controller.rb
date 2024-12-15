class AnswerController < ApplicationController
  def create
    @answer = Answer.new(answer_params)

    if @answer.save
      is_correct = CorrectAnswer.current_answer.answer == @answer.content

      turbo_stream_message = render_to_string(
        partial: "answer/answer",
        formats: [:turbo_stream],
        locals: {answer: @answer, is_correct: is_correct}
      )
      ActionCable.server.broadcast("similarity_channel_", turbo_stream_message)

      respond_to do |format|
        format.turbo_stream
        format.json { render json: {message: "Answer created successfully"}, status: :created }
      end
    else
      render json: {message: "Unprocessable answer"}, status: :unprocessable_entity
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end
end

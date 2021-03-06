class MessageController < ApplicationController
  def roll
    body = message_params[:text].downcase
    message = Message.new(body: body, user_name: message_params[:user_name])
    message.roll_dice
    render json: {
      response_type: "in_channel",
      text: message.body
    }
  end

  def help
    render json: {
      response_type: "in_channel",
      text: help_message
    }
  end

  private

  def message_params
   params.permit(:text, :user_name)
  end
end

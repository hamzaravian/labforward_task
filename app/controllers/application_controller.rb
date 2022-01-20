# frozen_string_literal: true

class ApplicationController < ActionController::API
  def success(message)
    render(json: { message: message, code: 200 }, status:  200)
  end

  def failure(message)
    render(json: { message: message, code: 400 }, status:  400)
  end

  def errors(errors, message)
    render(json: { code: 400, message: message, errors: errors }, status: 400)
  end
end

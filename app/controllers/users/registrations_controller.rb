# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    include RackSessionFix
    respond_to :json

    private

    def respond_with(resource, _opts = {})
      if request.method == 'POST' && resource.persisted?
        render json: {
          status: { message: 'Signed up sucessfully.' },
          user: resource
        }, status: :ok
      elsif request.method == 'DELETE'
        render json: {
          status: { message: 'Account deleted successfully.' }
        }, status: :ok
      else
        render json: {
          status: { message: "User couldn't be created successfully.",
                    errors: resource.errors
          }
        }, status: :unprocessable_entity
      end
    end
  end
end

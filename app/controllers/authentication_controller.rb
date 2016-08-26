class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request
  include Swagger::Blocks
  
  swagger_path '/authenticate' do
    operation :post do
      key :description, 'Returns auth token for the user has access to'
      key :operationId, 'findUser'
      key :produces, [
        'application/json'
      ]
      key :tags, [
        'login'
      ]
      parameter do
        key :name, :email
        key :type, :string
        key :in, :formData
        key :required, true
      end
      parameter do
        key :name, :password
        key :type, :string
        key :in, :formData
        key :required, true
      end
      response 200
      response :default do
        key :description, 'unexpected error'
        schema do
          key :'$ref', :ErrorModel
        end
      end
    end
  end

  def authenticate
    command = AuthenticateUser.call(params[:email], params[:password])

    if command.success?
      render json: { auth_token: command.result }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end
end
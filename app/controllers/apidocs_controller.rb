class ApidocsController < ApplicationController
  include Swagger::Blocks
  skip_before_action :authenticate_request

  swagger_root do
    key :swagger, '2.0'
    info do
      key :version, '1.0.0'
      key :title, 'Rails API App Documentation'
      key :description, 'A sample API app developed using rails 5 with JWT authentication ' \
                        'also demonstrate features in the swagger-2.0 specification'
      key :termsOfService, 'https://rails-api-app.herokuapp.com//terms/'
      contact do
        key :name, 'Sandip Ransing'
        key :email, 'sandip.ransing@synerzip.com'
      end
      license do
        key :name, 'MIT'
      end
    end

    security_definition :bearer do
      key :type, :apiKey
      key :name, :Authorization
      key :in, :header
    end

    tag do
      key :name, 'post'
      key :description, 'Posts operations'
      externalDocs do
        key :description, 'Find more info here'
        key :url, 'https://swagger.io'
      end
    end
    #key :host, 'rails-api-app.herokuapp.com/'
    key :basePath, '/'
    key :consumes, ['application/json']
    key :produces, ['application/json']
  end

  # A list of all classes that have swagger_* declarations.
  SWAGGERED_CLASSES = [
    PostsController,
    AuthenticationController,
    self,
  ].freeze

  def index
    render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
  end
end
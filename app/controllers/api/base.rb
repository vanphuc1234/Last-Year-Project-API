require 'grape-swagger'

module API
  class Base < Grape::API
    version 'v1', using: :path

    format :json
    prefix :api

    mount API::V1::Base

    add_swagger_documentation(
      mount_path: '/swagger_doc'
    )
  end
end

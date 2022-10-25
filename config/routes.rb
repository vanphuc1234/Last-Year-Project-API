Rails.application.routes.draw do
  default_url_options :host => "localhost:3000"

  mount API::Base, at: "/"
  mount GrapeSwaggerRails::Engine => '/docs'
end

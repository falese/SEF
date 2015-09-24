OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '303706550541-n32ugg7sjpb59nj2ujoiqclp7696rfke.apps.googleusercontent.com', 'FXUjwt9pynPOaOMA_ui9N_PN', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end

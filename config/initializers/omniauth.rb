Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '303706550541-ajovku13fk6m0elucgqorvd21uprj2k8.apps.googleusercontent.com', 'VctQsdaMFZa16jz4WVN5S_zb', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '839830756038749', '838ebe25c3cd54225e96190707a4cada', {:provider_ignores_state => true}

end

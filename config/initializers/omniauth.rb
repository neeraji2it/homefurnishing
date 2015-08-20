Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '885691864836924', '12e5ec4e562cfd2f159f6bec4b6c915a', {:provider_ignores_state => true}

end

Rails.application.config.middleware.use OmniAuth::Builder do
   if Rails.env == 'development'
 provider :facebook, '839830756038749', '838ebe25c3cd54225e96190707a4cada', {:scope => 'email,publish_actions,offline_access'}

     elsif Rails.env == 'production'
    provider :facebook, '885691864836924', '12e5ec4e562cfd2f159f6bec4b6c915a',{:scope => 'email,publish_actions,offline_access'}
  end
end



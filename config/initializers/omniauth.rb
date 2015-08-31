Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '1552426018308605', '659243b0224c8e7d04a20102d254057a' if Rails.env == 'development'
    provider :facebook, '1563891410493590', '50395c730c6835192153efb460479dc6' if Rails.env == 'production'
end

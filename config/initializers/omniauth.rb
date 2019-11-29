Rails.application.config.middleware.use OmniAuth::Builder do
  # added provider_ignores_state to avoid csrf_detected error based on https://github.com/omniauth/omniauth/issues/965
  provider :mastodon, provider_ignores_state: true, scope: 'read', credentials: lambda { |domain, callback_url|
    Rails.logger.info "Requested credentials for #{domain} with callback URL #{callback_url}"

    existing = MastodonClient.find_by(domain: domain)
    return [existing.client_id, existing.client_secret] unless existing.nil?

    client = Mastodon::REST::Client.new(base_url: "https://#{domain}")
    app = client.create_app('OmniAuth Test Harness', callback_url)

    MastodonClient.create!(domain: domain, client_id: app.client_id, client_secret: app.client_secret)

    [app.client_id, app.client_secret]
  }
end

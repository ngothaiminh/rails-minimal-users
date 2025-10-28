
require "active_support/core_ext/integer/time"

Rails.application.configure do
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local = false
  config.public_file_server.enabled = ENV["RAILS_SERVE_STATIC_FILES"].present?
  config.log_level = :info
  config.log_tags = [:request_id]
  config.cache_store = :memory_store
  config.active_storage.service = :local
  config.force_ssl = false
  config.assets.compile = true
  config.require_master_key = false
  config.secret_key_base = ENV["SECRET_KEY_BASE"]
end

source 'http://rubygems.org'

RAILS_VERSION = '~> 3.0.3'
DM_VERSION    = '~> 1.0.2'

gem 'activesupport',      RAILS_VERSION, :require => 'active_support'
gem 'actionpack',         RAILS_VERSION, :require => 'action_pack'
gem 'actionmailer',       RAILS_VERSION, :require => 'action_mailer'
gem 'railties',           RAILS_VERSION, :require => 'rails'

gem 'dm-rails',          '~> 1.0.4'
gem 'dm-mysql-adapter',     DM_VERSION

gem 'dm-migrations',        DM_VERSION
gem 'dm-types',             DM_VERSION
gem 'dm-validations',       DM_VERSION
gem 'dm-constraints',       DM_VERSION
gem 'dm-transactions',      DM_VERSION
gem 'dm-aggregates',        DM_VERSION
gem 'dm-timestamps',        DM_VERSION
gem 'dm-observer',          DM_VERSION
gem 'dm-serializer',        DM_VERSION


gem "devise", " >= 1.2.0"
gem 'dm-devise', :git => 'https://github.com/jm81/dm-devise.git'

group(:development, :test) do
  gem "wirble"
  gem "hirb"
  
  # Uncomment this if you want to use rspec for testing your application

  # gem 'rspec-rails', '~> 2.0.1'

  # To get a detailed overview about what queries get issued and how long they take
  # have a look at rails_metrics. Once you bundled it, you can run
  #
  #   rails g rails_metrics Metric
  #   rake db:automigrate
  #
  # to generate a model that stores the metrics. You can access them by visiting
  #
  #   /rails_metrics
  #
  # in your rails application.

  # gem 'rails_metrics', '~> 0.1', :git => 'git://github.com/engineyard/rails_metrics'

end


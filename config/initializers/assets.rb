# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

# welcome-css
Rails.application.config.assets.precompile += %w( welcome.css )
Rails.application.config.assets.precompile += %w( myground.css )
# article-css
Rails.application.config.assets.precompile += %w( article.css )
# rating-css
Rails.application.config.assets.precompile += %w( rating.css )
# chatrooms-css
Rails.application.config.assets.precompile += %w( chatrooms.css )
# freechat-css
Rails.application.config.assets.precompile += %w( freechats.css )
# users-css
Rails.application.config.assets.precompile += %w( users.css )
# show-css
Rails.application.config.assets.precompile += %w( show.css )

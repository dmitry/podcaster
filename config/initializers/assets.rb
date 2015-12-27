# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

Rails.application.config.assets.precompile += %w(soundmanager2_flash9.swf)
Rails.application.config.assets.paths << Rails.root.join(*%w(vendor assets images soundmanager2 bar-ui))
Rails.application.config.assets.precompile += %w(*.jpg *.png *.gif *.jpeg *.svg)
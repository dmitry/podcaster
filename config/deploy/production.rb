set :deploy_to, '/home/dmitry/www/tenerifepodcast.com'

server 'tenerifer.com', user: 'deploy', roles: %w{app}
role :app, %w{dmitry@tenerifer.com}

set :bundle_jobs, 4
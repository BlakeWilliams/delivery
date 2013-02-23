require 'bundler/capistrano'

server "192.81.214.90", :web, :app, :db, primary: true

set :application, "delivery"
set :user, "blake"
set :deploy_to, "/home/#{user}/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, :git
set :repository, "git@github.com:BlakeWilliams/delivery.git"
set :branch, "master"

ssh_options[:forward_agent] = true
default_run_options[:pty] = true

after "deploy:restart", "deploy:cleanup"

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  task :symlink_config, roles: :app do
    run "rm #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"

    run "rm #{release_path}/config/config.yml"
    run "ln -nfs #{shared_path}/config/config.yml #{release_path}/config/config.yml"
  end

  after "deploy:finalize_update", "deploy:symlink_config"
end

namespace :mailman do
  desc "Mailman::Start"
  task :start, :roles => [:app] do
    run "cd #{current_path};RAILS_ENV=#{rails_env} bundle exec script/mailman_daemon start"
  end

  desc "Mailman::Stop"
  task :stop, :roles => [:app] do
    run "cd #{current_path};RAILS_ENV=#{rails_env} bundle exec script/mailman_daemon stop"
  end

  desc "Mailman::Restart"
  task :restart, :roles => [:app] do
    mailman.stop
    mailman.start
  end

  before "deploy:cleanup", "mailman:restart"
end

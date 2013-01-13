set :symlinks, {
  "production.sqlite3" => "db/production.sqlite3"
}

set :asset_pipeline, false
set :application, "inference"
set :repository, "git@github.com:fguillen/Inference.git"
set :user, "fguillen"
set :deploy_to, "/home/www/inference.fernandoguillen.info"
set :scm, :git

server "inference.fernandoguillen.info", :app, :web, :db, :primary => true
set :branch, "master"
set :rails_env, "production"


task :restart do
  run "touch #{current_path}/tmp/restart.txt"
end
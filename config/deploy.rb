# config valid only for current version of Capistrano
lock '3.6.0'

set :application, 'taskapp'
set :repo_url, 'https://github.com/toshi1048/taskapp'

# Default branch is :master
set :branch, ENV['BRANCH'] || 'master'

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/var/www/taskapp'

## シンボリックリンクをはるフォルダ・ファイル
set :linked_files, %w{etc/environment}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets public/uploads}

# 保持するバージョンの個数(※後述)
set :keep_releases, 5

# Rubyのバージョン
set :rbenv_ruby, '2.5.1'
set :rbenv_type, :system
set :rbenv_custom_path, '/home/admin/.rbenv/'
#出力するログのレベル。エラーログを詳細に見たい場合は :debug に設定する。
#本番環境用のものであれば、 :info程度が普通。ただし挙動をしっかり確認したいのであれば :debug に設定する。
set :log_level, :info

namespace :deploy do
  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end

  desc 'Create database'
  task :db_create do
    on roles(:db) do |host|
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:create'
        end
      end
    end
  end

  desc 'Run seed'
  task :seed do
    on roles(:app) do
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:seed'
        end
      end
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
    end
  end
end
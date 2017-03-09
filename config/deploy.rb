# Название приложения
set :application, 'staff.alterland.ru'
# Путь к git репозиторию
set :repo_url, 'https://github.com/Aviator737/staffalterland.git'
# Ветка по-умолчанию
set :branch, 'master'
# Директория для деплоя
set :deploy_to, '/var/www/staff.alterland.ru'

set :log_level, :info
# Копирующиеся файлы и директории (между деплоями)
set :linked_files, %w{config/database.yml config/secrets.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/uploads}

# Ruby свистелки


# Ruby свистелки
set :rbenv_type, :user
set :rbenv_ruby, '2.4.0'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_roles, :all

# А это рекомендуют добавить для приложений, использующих ActiveRecord
set :puma_init_active_record, true
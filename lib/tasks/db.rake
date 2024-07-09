namespace :db do

desc "Dumps the database to db/APP_NAME.dump"
task :dump => :environment do

  cmd = nil
  with_config do |app, host, db, user|
    cmd = "pg_dump --host #{host} --username #{user} --verbose --clean --no-owner --no-acl --format=c #{db} > #{Rails.root}/db/#{app}.dump"
  end
  puts cmd
  exec cmd
end

desc "Restores the database dump at db/APP_NAME.dump."
task :restore => :environment do
  cmd = nil
  with_config do |app, host, db, user|
    cmd = "pg_restore --verbose --host #{host} --username #{user} --clean --no-owner --no-acl --dbname #{db} #{Rails.root}/db/#{app}.dump"
  end
  Rake::Task["db:drop"].invoke
  Rake::Task["db:create"].invoke
  Rake::Task["db:migrate"].invoke
  puts cmd
  exec cmd
end

private

def with_config
  config = ActiveRecord::Base.connection_db_config.configuration_hash
  yield Rails.application.class.module_parent_name.underscore,
        config[:host],
        config[:database],
        config[:username]
end

end

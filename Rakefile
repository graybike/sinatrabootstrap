#!/usr/bin/env rake

task :app do
  require './app'
end

namespace :db do
  desc "Run migrations"
  task :migrate, [:version] => :app do |t, args|
    require 'sequel/extensions/migration'

    if args[:version]
      puts "Migrating to version #{args[:version]}"
      Sequel::Migrator.apply(SinatraBootstrap::App.database, "db/migrations", target: args[:version].to_i)
    else
      puts "Migrating to latest"
      Sequel::Migrator.apply(SinatraBootstrap::App.database, "db/migrations")
    end
  end

  desc 'Rollback migration'
  task :rollback => :app do
    require 'sequel/extensions/migration'
    database = SinatraBootstrap::App.database
    
    version  = (row = database[:schema_info].first) ? row[:version] : nil
    Sequel::Migrator.apply(database, 'db/migrations', version - 1)
  end

  desc 'Reset Database'
  task :reset => :app do
    require 'sequel/extensions/migration'
    database = SinatraBootstrap::App.database
    Sequel::Migrator.apply(database, 'db/migrations', 0)
  end

  desc 'Dump the database schema'
  task :dump => :app do
    database = SinatraBootstrap::App.database
    `sequel -d #{database.url} > db/schema.rb`
    `pg_dump --schema-only #{database.url} > db/schema.sql`
  end
end
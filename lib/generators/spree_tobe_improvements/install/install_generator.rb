module SpreeTobeImprovements
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../../templates', __FILE__)

      class_option :auto_run_migrations, :type => :boolean, :default => false

      def add_javascripts
        append_file 'vendor/assets/javascripts/spree/frontend/all.js', "//= require spree/frontend/spree_tobe_improvements\n"
        append_file 'vendor/assets/javascripts/spree/backend/all.js', "//= require spree/backend/spree_tobe_improvements\n"
      end

      def add_stylesheets
        inject_into_file 'vendor/assets/stylesheets/spree/frontend/all.css', " *= require spree/frontend/spree_tobe_improvements\n", :before => /\*\//, :verbose => true
        inject_into_file 'vendor/assets/stylesheets/spree/backend/all.css', " *= require spree/backend/spree_tobe_improvements\n", :before => /\*\//, :verbose => true
      end

      def copy_ckeditor_files
        copy_file "config/initializers/ckeditor.rb", "config/initializers/ckeditor.rb"
        copy_file "app/models/ckeditor/asset.rb", "app/models/ckeditor/asset.rb"
        copy_file "app/models/ckeditor/attachment_file.rb", "app/models/ckeditor/attachment_file.rb"
        copy_file "app/models/ckeditor/picture.rb", "app/models/ckeditor/picture.rb"
      end

      def copy_product_duplicator_files
        copy_file "lib/product_duplicator.rb", "lib/product_duplicator.rb"
      end

      def add_require
        inject_into_file 'app/helpers/application_helper.rb', "require 'product_duplicator'\n", :before => "module ApplicationHelper\n"
      end

      def add_migrations
        run 'bundle exec rake railties:install:migrations FROM=spree_tobe_improvements'
      end

      def run_migrations
        run_migrations = options[:auto_run_migrations] || ['', 'y', 'Y'].include?(ask 'Would you like to run the migrations now? [Y/n]')
        if run_migrations
          run 'bundle exec rake db:migrate'
        else
          puts 'Skipping rake db:migrate, don\'t forget to run it!'
        end
      end
    end
  end
end

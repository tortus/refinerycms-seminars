module Refinery
  module Seminars
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Seminars

      engine_name :refinery_seminars

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "seminars"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.seminars_admin_seminars_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/seminars/seminar',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Seminars)
      end
    end
  end
end

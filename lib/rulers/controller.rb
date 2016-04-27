require 'erubis'

module Rulers
  class Controller
    def initialize(env)
      @env = env
    end

    def env
      @env
    end

    def render(view_name, locals = {})
      variables = instance_variables.reduce({}) do |h, e|
        h[e] = instance_variable_get(e)
        h
      end
      filename = File.join "app", "views", 
        controller_name, "#{view_name}.html.erb"
      template = File.read filename
      eruby = Erubis::Eruby.new(template)
      eruby.result locals.merge(:env => env).merge(variables)
    end

    def controller_name
      klass_name = self.class.to_s.gsub /Controller$/, ""
      Rulers.to_underscore klass_name
    end
  end
end

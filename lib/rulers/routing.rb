module Rulers
  class Application
    def get_controller_and_action(env)
      if env['PATH_INFO'] == '/'
        return [Object.const_get('HomeController'), 'index']
      end
      _, cont, action, _ = env['PATH_INFO'].split('/', 4)
      cont = cont.capitalize
      cont += "Controller"

      [Object.const_get(cont), action]
    end
  end
end

require "rulers/version"
require "rulers/array"

module Rulers
  # Your code goes here...
  class Application
    def call(env)
      [200, {'Content-Type' => 'text/html'}, ['Hello from P.K.']]
    end
  end
end

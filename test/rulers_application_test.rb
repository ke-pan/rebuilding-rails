require 'test_helper'
require 'minitest/autorun'
require 'rack/mock'

class TestController < Rulers::Controller
  def index
    "Hello from P.K."
  end
end

describe Rulers::Application do
  before do
    @request = Rack::MockRequest.new(Rulers::Application.new)
  end

  def request(path, headers = {})
    yield @request.get(path, headers)
  end

  it 'should return hello' do
    request '/test/index' do |response|
      response.status.must_equal 200
      response.body.must_equal 'Hello from P.K.'
    end
  end
end

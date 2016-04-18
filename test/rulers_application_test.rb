require 'test_helper'
require 'minitest/autorun'
require 'rack/mock'

describe Rulers::Application do
  before do
    @request = Rack::MockRequest.new(Rulers::Application.new)
  end

  def request(headers = {})
    yield @request.get('/', headers)
  end

  it 'should return hello' do
    request do |response|
      response.status.must_equal 200
      response.body.must_equal 'Hello from P.K.'
    end
  end
end

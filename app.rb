require_relative 'get_time'

class App
  def call(env)
    request = Rack::Request.new(env)

    response(GetTime.new(request).call)     
  end

  private

  def response(hh)
    Rack::Response.new(hh[:body], hh[:status]).finish
  end
  
end

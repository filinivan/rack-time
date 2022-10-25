require_relative 'get_time'

class App
  def call(env)
    request = Rack::Request.new(env)
    path = request.path

    if path == "/time"
        ftime = GetTime.new(request)
        ftime.call
        ftime.success? ? response(200, ftime.get_time) : response(401, ftime.get_incorrect)      
    else
      response(400, 'Wrong pathh')
    end
  end

  private

  def response(status, body)
    Rack::Response.new(body, status, {'Content-Type' => 'text/plain'}).finish
  end
  
end

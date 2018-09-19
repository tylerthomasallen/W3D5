require 'rack'


myapp = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new
  res['Content-Type'] = 'text/html'
  res.write(req.path)
  res.finish
end

Rack::Server.start(
  app: myapp,
  Port: 2000
)

require 'json'

class Session
  # find the cookie for this app
  # deserialize the cookie into a hash
  def initialize(req)# req.path
    # {'_rails_lite_app' => { 'xyz' => 'abc' }
    if req.cookies['_rails_lite_app']
      @cookie = req.cookies['_rails_lite_app']
    else
      @cookie = req.cookies['_rails_lite_app'] = {}
    end
  end

# =>  rails_lite_app[]

  def [](key)
    JSON.parse(@cookie)[key]
  end

  def []=(key, val)
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res)
    res.set_cookie
  end
end

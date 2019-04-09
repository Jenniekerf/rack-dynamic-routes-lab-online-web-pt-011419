require "pry"

class Application
  
  @@items = [Item.new("Figs",3.42), Item.new("Pears",0.99)]
  
  def call(env)
   resp = Rack::Response.new
   req = Rack::Request.new(env)
   
    
    if req.path.match(/items/)  #and the requested item exists
    
    x = req.path.split("/items/").last
    
      @@items.find do |item| 
       if x == item.name
        resp.write "#{item.price}"
      else
        resp.status = 400
        resp.write "Item not found"
      end
      end
    else 
      resp.status = 404
      resp.write "Route not found"
    end
  
  resp.finish 
  end
end
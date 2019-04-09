require "pry"

class Application
  
  @@items = [Item.new("Figs",3.42), Item.new("Pears",0.99)]
  
  def call(env)
   resp = Rack::Response.new
   req = Rack::Request.new(env)
   
    
    if req.path.match(/items/)  #and the requested item exists
    
    x = req.path.split(/items/).last
    binding.pry
      @@items.each do |item|
        resp.write "#{item.price}"
      end
    else 
    resp.write "Route not found"
    resp.status = 404
    
#     if requested item matches (/items/) but I don't have it:
#     resp.write "Item not found"
#     resp.status = 400
    
 
  end
  #binding.pry
  
  # item_names = @@items.collect {|i| i.name }
  
  
  
   resp.finish 
  end
end
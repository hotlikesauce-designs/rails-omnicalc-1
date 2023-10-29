Rails.application.routes.draw do
  get("/", {:controller=>"homepage", :action=> "landing"}) #controller automatically adds "_controller" when searching controllers in app folder

  get("/square/new", {:controller=>"calculations", :action=>"square_new"})
  get("/square/results", {:controller=>"calculations", :action=>"square_results"})

  get("/square_root/new", {:controller=>"calculations", :action=>"square_root_new"})
  get("/square_root/results", {:controller=>"calculations", :action=>"square_root_results"})

  get("/payment/new", {:controller=>"calculations", :action=>"payment_new"})
  get("/payment/results", {:controller=>"calculations", :action=>"payment_results"})

end

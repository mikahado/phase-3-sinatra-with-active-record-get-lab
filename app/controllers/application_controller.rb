class ApplicationController < Sinatra::Base

  # DOES NOT MATCH WITH EXAMPLE FROM FLATIRON LESSON. 
  # LESSON EXAMPLES ARE MISSING '< Sinatra::Base'

  set :default_content_type, 'application/json'
  
  get '/bakeries' do
    # get all the bakeries from the database
    bakeries = Bakery.all
    # send them back as a JSON array
    bakeries.to_json
  end

  get '/bakeries/:id' do 
    bakeries = Bakery.find(params[:id])
    bakeries.to_json(include: :baked_goods)
    #do not understand the 'custom option' of the above line
  end

  get '/baked_goods/by_price' do
    # see the BakedGood class for the  method definition of `.by_price`
    baked_goods = BakedGood.by_price
    baked_goods.to_json
  end

  get '/baked_goods/most_expensive' do
    # see the BakedGood class for the  method definition of `.by_price`
    baked_good = BakedGood.most_expensive
    baked_good.to_json
  end




end

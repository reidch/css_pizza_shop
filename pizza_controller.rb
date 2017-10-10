require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative './models/pizza'

get '/pizzas' do
	@pizzas = Pizza.all()
	erb( :index )
end

# be careful of the order - this has to come before :id
get '/pizzas/new' do
	erb( :new )
end

get '/pizzas/:id' do
	@pizza = Pizza.find(params['id'])
	erb( :show )
end

# this is us passing in all the data for the new object (the params)
post '/pizzas' do
	@pizza = Pizza.new(params)
	@pizza.save()
	erb( :create )
end

get '/pizzas/:id/edit' do
	@pizza = Pizza.find(params['id'])
	erb( :edit )
end

post '/pizzas/:id' do
# not an instance variable => not @
	pizza = Pizza.new(params)
	pizza.update()
	erb( :update )
end

post '/pizzas/:id/delete' do
	pizza = Pizza.find(params['id'])
	pizza.delete()
	erb( :delete )
end

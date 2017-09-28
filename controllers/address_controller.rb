class AddressController < Sinatra::Base
	configure :development do 
        register Sinatra::Reloader
	end

	set :root, File.join(File.dirname(__FILE__), "..")
	set :views, Proc.new { File.join(root, 'views') }

	$contacts = [{
	  name: "Harry Potter",
	  address: "The Cupboard Under the Stairs, 4 Privet Drive, Little Whinging, Surrey, England, Great Britain"
	},
	{
	  name: "Sherlock Holmes",
	  address: "221B Baker Street, London, England, Great Britain"
	},
	{
	  name: "Paddington Bear",
	  address: "32 Windsor Gardens, London, England, Great Britain"
	},
	{
	  name: "Luna Lovegood",
	  address: "Lovegood House, Ottery St Catchpole, Devon, England, Great Britain"
	},
	{
	  name: "Spongebob Squarepants",
	  address: "124 Conch Street, Bikini Bottom, Pacific Ocean"
	}]

	get '/addresses' do
		@page_header = "All Contacts"
		@contacts = $contacts
		erb :"addresses/index"
	end	

	get '/addresses/new' do
		erb :"addresses/new"
	end

	get '/addresses/:id' do
		id = params[:id].to_i
		@contacts = $contacts[id]
		erb :"addresses/show"
	end

	post "/addresses" do
		new_contact = {
			name: params[:name],
			address: params[:address]
		}
		$contacts << new_contact
		redirect "/addresses"
	end

	get '/addresses/:id/edit' do
		@id = params[:id].to_i
		@contact = $contacts[@id]
		erb :"addresses/edit"
	end

	put "/addresses/:id" do
		id = params[:id].to_i
		$contacts[id][:name] = params[:name]
		$contacts[id][:address] = params[:address]
		redirect "/addresses/#{id}"
	end


end

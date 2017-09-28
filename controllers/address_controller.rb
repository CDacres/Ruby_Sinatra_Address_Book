class AddressController < Sinatra::Base
	configure :development do 
        register Sinatra::Reloader
	end

	set :root, File.join(File.dirname(__FILE__), "..")
	set :views, Proc.new { File.join(root, 'views') }

	$addresses = [{
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
		@addresses = $addresses
		erb :"addresses/index"
	end	

end

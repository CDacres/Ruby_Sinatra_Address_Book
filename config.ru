require "sinatra"
require "sinatra/reloader" if development?
require_relative "./controllers/address_controller.rb"
use Rack::MethodOverride
run AddressController

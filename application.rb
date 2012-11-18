require 'rubygems'
require 'bundler/setup'
require 'sinatra'

require 'metar'
require 'metar/report'

require File.join(File.dirname(__FILE__), 'environment')

configure do
  set :views, "#{File.dirname(__FILE__)}/views"
end

error do
  e = request.env['sinatra.error']
  Kernel.puts e.backtrace.join("\n")
  'Application error'
end

helpers do
  # add your helpers here
end

# root page
get '/' do
  haml :index
end

post '/' do

  @code = params["code"].upcase!

  station = Metar::Station.find_by_cccc( @code )

  parser = station.parser

  @result = parser.raw








  haml :index

end


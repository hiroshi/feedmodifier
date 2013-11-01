require 'sinatra'
require 'open-uri'
require './feedmodifier'

get '/' do
  content_type "application/rss+xml; charset=utf-8"
  feed(open(params["url"]))
end

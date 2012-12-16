require "sinatra"
require "sinatra_more/markup_plugin"
require "slim"

module Cssdoc
  class App < ::Sinatra::Base
    register SinatraMore::MarkupPlugin
    set :root, File.expand_path("../../../", __FILE__)
    set :finder, DocumentFinder.new

    get "/" do
      @documents = settings.finder.documents
      slim :index
    end

    get "/demo/:index/*" do
      index = params[:index].to_i
      path  = params[:splat][0]
      @html = settings.finder.find(path).sections[index].code
      @css  = File.read(path)
      slim :demo, :layout => false
    end

    get "/stylesheets/*.css" do
      content_type 'text/css', :charset => 'utf-8'
      filename = params[:splat].first
      scss filename.to_sym, :views => "#{settings.root}/assets/stylesheets"
    end

    get "/favicon.ico" do
      halt 404
    end

    get "/*" do
      @document = settings.finder.find(params[:splat][0]) or halt 404
      slim :show
    end
  end
end

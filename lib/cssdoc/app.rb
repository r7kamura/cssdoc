require "sinatra"
require "sinatra_more/markup_plugin"

module Cssdoc
  class App < ::Sinatra::Base
    register SinatraMore::MarkupPlugin
    set :root, File.expand_path("../../../", __FILE__)
    set :manager, DocumentManager.new

    get "/" do
      @documents = settings.manager.documents
      erb :index
    end

    get "/demo/:index/*" do
      index = params[:index].to_i
      path  = params[:splat][0]
      @html = settings.manager.find(path).sections[index].code
      @css  = File.read(path)
      erb :demo, :layout => false
    end

    get "/favicon.ico" do
      halt 404
    end

    get "/*" do
      @document = settings.manager.find(params[:splat][0]) or halt 404
      erb :show
    end

    helpers do
      def demo(path, index)
        content_tag(:iframe, :src => "/demo/#{index}/#{path}")
      end
    end
  end
end

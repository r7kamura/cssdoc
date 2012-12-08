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

    get "/*" do
      @document = settings.manager.find(params[:splat][0])
      erb :show
    end
  end
end

ENV['RACK_ENV'] ||= "development"
require 'sinatra/base'
require_relative 'data_mapper_setup'

class Bookmark_Manager < Sinatra::Base

  run! if app_file == $0

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb(:links)
  end

  get '/links/new' do
    erb(:add_new_link)
  end

  get '/tags/:tag' do
    tag = Tag.first(tag: params[:tag])
    @links = tag ? tag.links : []
    erb :'links'
  end

  # get '/tags/:tag' do
  #   # tag = Tag.first(tag: params[:tag])
  #   # @links = tag ? tag.links : []
  #   @links = Link.all(Link.tags.tag => params[:tag])
  #   erb(:links)
  # end

  post '/links' do
    link = Link.new(url: params[:new_link_url],
                title: params[:new_link_title])
    tag  = Tag.first_or_create(tag: params[:new_link_tag])
    link.tags << tag
    link.save
    redirect to('/links')
  end

end

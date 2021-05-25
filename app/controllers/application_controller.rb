require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
        erb :super_hero
    end

    post '/teams' do
        @team = params[:team][:name]
        @team_motto = params[:team][:motto]

        @names = []
        @powers = []
        @bios = []

        @heroes = params[:team][:members].each do |member|
            @names << member[:name]
            @powers << member[:power]
            @bios << member[:bio]
        end

        erb :team
    end

end

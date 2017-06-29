require 'sinatra'
require 'pg'
conn = PG::Connection.open(:dbname => 'contacts')

get '/' do
  # collect all contacts in the database
  res  = conn.exec('SELECT * FROM people')
  # format them to be read by other computers
  p res
  # {status: "ok"}.to_json
  # {number_of_results: res.ntuples}.to_json
  content_type :json
  res.each_with_index.map{|x ,i| res[i].to_json}
end

get '/contacts' do
  "all contacts"
  res = conn.exec_params(
    "SELECT * FROM people WHERE id = $1 LIMIT 1",
    [params[:id]]
  )
  content_type :json
  res.each_with_index.map{|x ,i| res[i].to_json}
end

put '/contacts/:id' do
  'view an existing contact'
end

post '/contacts' do
  'create new contact'
end

get '/contacts/:id' do
  'view an existing contact'
end

put '/contacts/:id' do
  'update an existing contact'
end ##Still not working

delete '/contacts/:id' do
  'delete an existing contact'
end

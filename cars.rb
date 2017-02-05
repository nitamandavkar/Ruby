 
require 'faraday'
require 'json'
require 'rspec/expectations'


conn = Faraday::Connection.new 
res = conn.get do |req|
 	req.url  'https://api.edmunds.com/api/vehicle/v2/Honda/Civic/year=2000&fmt=json&api_key=9xnev2b54pjfs9qc9ksaafnx'
end
puts res.body

if res.status == 'OK'
	puts res.body
	
	year = JSON.parse(res.body)['year']
	expect(year).to be == 2000

	car_name = JSON.parse(res.body)['name']
	expect(car_name).to be == "Honda"

	car_model = JSON.parse(res.body)['modelName']
	expect(car_model).to include(a_string_matching("Civic"))
end


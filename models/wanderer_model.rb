require 'data_mapper'

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/wanderer.db")

class Wanderer
	include DataMapper::Resource
	property :id, Serial
	property :name, String, required: true
	property :hp, Integer
	property :gold, Integer
	property :monstertaly, Integer
	property :locations, Object
	property :inventory, Object
end

DataMapper.finalize
Wanderer.auto_upgrade!
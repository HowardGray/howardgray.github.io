require 'json'
require 'airtable'
require 'active_support/all'
# require 'active_support/all'

# Pass in api key to client
@client = Airtable::Client.new("keykM2rQu12gpVKps")

# Pass in the app key and table name

@table = @client.table("appA0hzRA8nSRa1Zj", "Topics")
@records = @table.records(:filterByFormula => "published", :sort => ["date", :desc], :limit => 100)

# Change the filename here below but make sure it's in the _data folder.
File.open("_data/airtable_data.json", "w") do |f|
    data = @records.map { |record| record.attributes }
    f.write(data.to_json)
end
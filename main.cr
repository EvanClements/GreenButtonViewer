require "xml"
require "json"
require "csv"
require "db"
require "sqlite3"

# Created new DB channel/file
# Create tempfile for uploaded file to be saved
# determine if file is CSV or XML or Other
# If CSV, do parseCsv
# If XML do parseXml
# The only difference is the way the file is navigated
# Do parseGreenButton with "file" as needed param and 

xml = <<-XML
<Account AcountNumber="30011890917">
     <ServicePoint ServicePointID="2300378177" MeterID="G044598305">
          <Channel ChannelNumber="10">
               <ReadingData>
                    <DateTime>11/1/2021 12:00:00 AM</DateTime>
                    <Value>0.186</Value>
               </ReadingData>
               <ReadingData>
                    <DateTime>11/1/2021 1:00:00 AM</DateTime>
                    <Value>0.209</Value>
               </ReadingData>
               <ReadingData>
                    <DateTime>11/1/2021 2:00:00 AM</DateTime>
                    <Value>0.458</Value>
               </ReadingData>
          </Channel>
     </ServicePoint>
</Account>
XML

document = XML.parse(xml)

puts "Account Number: " + document.children[0]["AcountNumber"] + "\n"
child = document.children
puts child[0]

# When you access the root, parse the preset XML object and spit out JSON
get "/" do |env|
  env.response.content_type = "application/json"
  
  # Parse XML object to JSON
  grnbtn = JSON.build do |json|
    json.object do
      json.field "name", "foo"
      json.field "values" do
        json.array do
          json.number 1
          json.number 2
          json.number 3
        end
      end
    end
  end

  grnbtn.to_json

end

Kemal.run
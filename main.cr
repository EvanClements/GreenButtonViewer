require "xml"
require "json"
require "kemal"

xml = <<-XML
	<Account AcountNumber="30011890917">
		<ServicePoint ServicePointID="2300378177" MeterID="G044598305">
			<Channel ChannelNumber="10">
				<ReadingData>
					<DateTime>3/20/2020 12:00:00 AM</DateTime>
					<Value>0.193</Value>
				</ReadingData>
                <ReadingData>
                  <DateTime>3/20/2020 1:00:00 AM</DateTime>
                  <Value>0.476</Value>
                </ReadingData>
                <ReadingData>
                  <DateTime>3/20/2020 2:00:00 AM</DateTime>
                  <Value>0.206</Value>
                </ReadingData>
                <ReadingData>
                  <DateTime>3/20/2020 3:00:00 AM</DateTime>
                  <Value>0.126</Value>
                </ReadingData>
			</Channel>
		</ServicePoint>
	</Account>
XML

document = XML.parse(xml).first_element_child

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
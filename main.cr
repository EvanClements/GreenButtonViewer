require "xml"
require "json"
require "kemal"

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
require "./spec_helper"

describe "Your::Kemal::App" do

  # You can use get,post,put,patch,delete to call the corresponding route.
  it "renders /" do
    post "/"
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
    response.body.should eq "Hello World!"
  end

end
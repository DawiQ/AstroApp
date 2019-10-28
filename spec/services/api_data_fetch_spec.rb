require 'rails_helper'

RSpec.describe ApiDataFetch do

  it "single album with one track and one alternative track - params check" do
    body = file_fixture("api_body.json").read
    url = "http://dawiq.lh.pl/apis/"
    stub_request(:any, url).
      with(
      headers: {
        'Content-Type' => 'application/json',
      }).
    to_return(status: 200, body: body, headers: {})

    ApiDataFetch.call()

    expect( Event.count ).to eq(19)
    expect( Preference.count ).to eq(2)
  end
end

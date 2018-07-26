require './zillowsearch'
require 'faraday'

conn = Faraday.new(:url => 'https://www.zillow.com')
conn.headers['Content-Type'] = 'application/json'
conn.params['zws-id'] = 'X1-ZWz18gb04tdatn_5taq0'
conn.params['state'] = 'CA'
conn.params['city'] = 'Santa Ana'
conn.params['childtype'] = 'zipcode'

RSpec.describe ZillowSearch do
  describe "searchproperty" do
    response = conn.get '/webservice/GetRegionChildren.htm'
    search = ZillowSearch.new
    rr = search.getregionalrequest(response.body)
    it "returns property information" do
      expect(response.status).to eq(200)
      expect(rr['state']).to eq(conn.params['state'])
      expect(rr['city']).to eq(conn.params['city'])
      expect(rr['childtype']).to eq(conn.params['childtype'])
    end
  end
end

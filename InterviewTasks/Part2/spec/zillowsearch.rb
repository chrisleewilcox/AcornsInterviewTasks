require 'json'
require 'active_support/core_ext/hash'

class ZillowSearch
  def getregionalrequest(data)
    h = Hash.from_xml(data).to_json
    s = JSON.parse(h)
    s['regionchildren']['request']
  end
end

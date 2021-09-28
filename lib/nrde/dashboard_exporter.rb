module Nrde
	class DashboardExporter
		def self.exporter(guid, personal_api_key = nil, width = '2000', height = '2000', new_relic_region = 'US')
			begin
				raise "A New Relic API key is required." if personal_api_key.nil?
				headers = {}
				headers["Content-Type"] = "application/json"
				headers["API-Key"] = personal_api_key
				endpointUrl = new_relic_region == 'EU' ? 'https://api.eu.newrelic.com/graphql' : 'https://api.newrelic.com/graphql'
				raise "Dashboard GUID required." if guid.nil?
				nr_query_json = {"query" => "mutation { dashboardCreateSnapshotUrl(guid: \"#{guid}\")}"}
				
				#Get Dashborad Snapshot URL
				uri = URI.parse(endpointUrl)
				https = Net::HTTP.new(uri.host,uri.port)
				https.use_ssl = true
				req = Net::HTTP::Post.new(uri.path, headers)
				req.body = nr_query_json.to_json
				res = https.request(req)
				nr_snapshopt_url = JSON.parse(res.body)['data']['dashboardCreateSnapshotUrl']
				#Download File as PDF
				nr_download_uri = URI("#{nr_snapshopt_url}&width=#{width}&height=#{height}")
				response = Net::HTTP.get_response(nr_download_uri)
				return response
			rescue => e
				p "PDF Download failed #{nr_download_uri} #{response.code}"
			end
		end
	end
end
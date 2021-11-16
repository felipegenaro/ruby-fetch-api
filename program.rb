require 'open-uri'
require 'json'

ENDPOINT = 'https://api.tfl.gov.uk/line/mode/tube,overground,dlr,tflrail/status'

json_data = open(ENDPOINT).read

JSON.parse(json_data).each do |line|
        status = line['lineStatuses'].first['statusSeverityDescription']

        line_name = line['name']

        puts "- #{status} on #{line_name}"

        if line['lineStatuses'].first['reason']
                reason = line['lineStatuses'].first['reason']

                puts "More details: #{reason}"
        end
end
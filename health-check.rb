#!/usr/bin/env ruby
require 'time'
SRC = "https://x.optgeo.org/hrlulc/index.html"

def pomocode
  Time.now.to_i / 1800
end

msg = `curl -o /dev/null -s -w '%{http_code}\n' #{SRC}`
msg = "[#{pomocode}] nginx status #{msg}"

# submit to Slack
system <<-EOS
  curl -X POST -H 'Content-type: application/json' --data '{"text":"#{msg}"}' #{ENV['WEBHOOK_URL']}
EOS

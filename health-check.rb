#!/usr/bin/env ruby
require 'time'
DST = "https://hooks.slack.com/services/----/----/-----------" # incoming webhook
SRC = "https://x.optgeo.org/hrlulc/index.html"

msg = `curl -o /dev/null -s -w %{http_code} #{SRC}`
msg = "#{Time.now.iso8601} #{msg}"
system <<-EOS
  curl -X POST -H 'Content-type: application/json' --data '{"text":"#{msg}"}' #{DST}
EOS

# Parse information from a .log file

## Getting started

1. Clone repo

2. Install dependencies: `bundle install`

## Using the app

1. Open `irb`

2. Load up the file: `load 'lib/parser.rb'`

3. Declare a new instance of `Parser`, passing in the log file: `p = Parser.new('src/webserver.log')`

4. Call the `parse` method: `p.parse`

You should now be able to see a list of urls and ip addresses separately by calling `p.urls` or `p.ips`

You can also see how these strings are pairing by calling `p.url_ip_pairs`

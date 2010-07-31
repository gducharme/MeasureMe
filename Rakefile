require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('measureme', '0.1') do |g|
  g.description       = "Measure the amount of code created in a day"
  g.url               = "http://github.com/gducharme/measureme"
  g.author            = "Geoffrey Ducharme"
  g.email             = "geoffrey.ducharme@gmail.com"
  g.ignore_pattern    = ["tmp/*", "script/*"]
  g.development_dependencies = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each {|ext| load ext}

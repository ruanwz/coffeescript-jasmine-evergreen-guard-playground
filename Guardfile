# A sample Guardfile
# More info at https://github.com/guard/guard#readme

# This is an example with all options that you can specify for guard-process

guard 'coffeescript', :input => 'public/coffeescripts', :output => 'public/javascripts'

guard 'process', :name => 'evergreen', :command => 'evergreen run', :env => {"ENV2" => "value 2"}, :stop_signal => "KILL"  do
  watch(%r{(spec)|(public)/coffeescripts/.*.coffee})
end



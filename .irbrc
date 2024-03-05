begin
  require "awesome_print"
rescue LoadError
  nil
end

begin
  require "amazing_print"
rescue LoadError
  nil
end

IRB.conf[:USE_AUTOCOMPLETE] = false

AwesomePrint.irb! if defined?(AwesomePrint)
AmazingPrint.irb! if defined?(AmazingPrint)

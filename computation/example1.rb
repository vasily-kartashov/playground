load 'simple.rb'

x = Variable.new(:x)
environment = { :x => Number.new(2) }

Machine.new(
  Assign.new(:x, Add.new(x, Number.new(1))),
  environment
).run


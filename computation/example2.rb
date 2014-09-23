load 'bigstep.rb'

environment = { :x => Number.new(2) }
Assign.new(:x, Add.new(Variable.new(:x), Number.new(1))).evaluate(environment)

environment = { :y => Boolean.new(true) }
puts If.new(
  Variable.new(:y),
  Assign.new(Variable.new(:x), Number.new(1)),
  Assign.new(Variable.new(:y), Number.new(2))
).evaluate(environment)

environment = { :x => Boolean.new(false), :y => Number.new(0) }
puts If.new(
  Variable.new(:x),
  Assign.new(Variable.new(:y), Number.new(1)),
  DoNothing.new
).evaluate(environment)

environment = {}
puts Sequence.new(
  Assign.new(:x, Add.new(Number.new(1), Number.new(1))),
  Assign.new(:y, Add.new(Variable.new(:x), Number.new(3)))
).evaluate(environment)

puts environment = { :x => Number.new(1) }
While.new(
  LessThan.new(Variable.new(:x), Number.new(15)),
  Assign.new(:x, Multiply.new(Variable.new(:x), Number.new(3)))
).evaluate(environment)

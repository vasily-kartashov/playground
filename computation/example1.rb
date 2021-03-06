load 'simple.rb'

x = Variable.new(:x)
y = Variable.new(:y)

environment = { :x => Number.new(2) }
Machine.new(
  Assign.new(:x, Add.new(x, Number.new(1))),
  environment
).run


environment = { :y => Boolean.new(true) }
Machine.new(
  If.new(
    Variable.new(:y),
    Assign.new(:y, Number.new(1)),
    Assign.new(:y, Number.new(2))
  ),
  environment
).run


environment = { :x => Boolean.new(false), :y => Number.new(0) }
Machine.new(
  If.new(
    Variable.new(:x),
    Assign.new(:y, Number.new(1)),
    DoNothing.new
  ), environment
).run

environment = {}
Machine.new(
  Sequence.new(
    Assign.new(:x, Add.new(Number.new(1), Number.new(1))),
    Assign.new(:y, Add.new(Variable.new(:x), Number.new(3)))
  ), environment
).run

environment = { :x => Number.new(1) }
Machine.new(
  While.new(
    LessThan.new(Variable.new(:x), Number.new(15)),
    Assign.new(:x, Multiply.new(Variable.new(:x), Number.new(3)))
  ), environment
).run

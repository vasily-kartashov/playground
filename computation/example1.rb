load 'simple.rb'

Machine.new(
  Add.new(Variable.new("x"), Variable.new("y")), { "x" => Number.new(2), "y" => Number.new(5) }
).run


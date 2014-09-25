load 'denotation.rb'

statement = (
  While.new(
    LessThan.new(Variable.new(:x), Number.new(5)),
    Assign.new(:x, Multiply.new(Variable.new(:x), Number.new(3)))
  )
)

puts statement.to_ruby

procedure = eval(statement.to_ruby)
puts procedure.call({ x: 1 })


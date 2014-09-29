load 'regexp.rb'

pattern = Repeat.new(
  Choose.new(
    Concatenate.new(Literal.new('a'), Literal.new('b')),
    Literal.new('a')
  )
)

puts pattern

nfa_design = Empty.new.to_nfa_design
puts nfa_design.accepts?('')
puts nfa_design.accepts?('a')

nfa_design = Literal.new('a').to_nfa_design
puts nfa_design.accepts?('')
puts nfa_design.accepts?('a')
puts nfa_design.accepts?('b')

puts Empty.new.matches?('a')
puts Literal.new('a').matches?('a')

pattern = Concatenate.new(Literal.new('a'), Literal.new('b'))
puts pattern

puts pattern.matches?('a')
puts pattern.matches?('ab')
puts pattern.matches?('abc')

pattern = Concatenate.new(Literal.new('a'), Concatenate.new(Literal.new('b'), Literal.new('c')))
puts pattern

puts pattern.matches?('a')
puts pattern.matches?('ab')
puts pattern.matches?('abc')

pattern = Choose.new(Literal.new('a'), Literal.new('b'))
puts pattern

puts pattern.matches?('a')
puts pattern.matches?('b')
puts pattern.matches?('c')

pattern = Repeat.new(Literal.new('a'))
puts pattern

puts pattern.matches?('')
puts pattern.matches?('a')
puts pattern.matches?('aaaaa')
puts pattern.matches?('b')

pattern = Repeat.new(
  Concatenate.new(
    Literal.new('a'),
    Choose.new(
      Empty.new,
      Literal.new('b')
    )
  )
)
puts pattern

puts pattern.matches?('')
puts pattern.matches?('a')
puts pattern.matches?('ab')
puts pattern.matches?('aba')
puts pattern.matches?('abab')
puts pattern.matches?('abaab')
puts pattern.matches?('abba')


load 'nfa.rb'

rulebook = NFARulebook.new([
  FARule.new(1, 'a', 1), FARule.new(1, 'b', 1), FARule.new(1, 'b', 2),
  FARule.new(2, 'a', 3), FARule.new(2, 'b', 3),
  FARule.new(3, 'a', 4), FARule.new(3, 'b', 4)
])

nfa_design = NFADesign.new(1, [4], rulebook)

puts nfa_design.accepts?('bab')
puts nfa_design.accepts?('bbbbb')
puts nfa_design.accepts?('bbabb')

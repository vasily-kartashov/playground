load 'dpda.rb'

stack = Stack.new(['a', 'b', 'c', 'd', 'e'])
puts stack.top
puts stack.pop.pop.top
puts stack.push('x').push('y').top
puts stack.push('x').push('y').pop.top

rule = PDARule.new(1, '(', 2, '$', ['b', '$'])
configuration = PDAConfiguration.new(1, Stack.new(['$']))
puts rule.applies_to?(configuration, '(')

rulebook = DPDARulebook.new([
  PDARule.new(1, '(', 2, '$', ['b', '$']),
  PDARule.new(2, '(', 2, 'b', ['b', 'b']),
  PDARule.new(2, ')', 2, 'b', []),
  PDARule.new(2, nil, 1, '$', ['$'])
])

dpda_design = DPDADesign.new(1, '$', [1], rulebook)

puts dpda_design.accepts?('(((((((((())))))))))')
puts dpda_design.accepts?('()(())((()))(()(()))')
puts dpda_design.accepts?('(()(()(()()(()()))()')

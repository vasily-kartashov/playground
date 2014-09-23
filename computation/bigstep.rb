module Inspect
  def inspect
    "#{self}"
  end
end

class Number < Struct.new(:value)
  include Inspect
  def to_s
   "#{value}"
  end
  def evaluate(environment)
    self
  end
end

class Boolean < Struct.new(:value)
  include Inspect
  def to_s
    "#{value}"
  end
  def evaluate(environment)
    self
  end
end

class Variable < Struct.new(:name)
  def to_s
    "#{name}"
  end
  def evaluate(environment)
    environment[name]
  end
end

class Add < Struct.new(:left, :right)
  def to_s
    "(#{left} + #{right})"
  end
  def evaluate(environment)
    Number.new(left.evaluate(environment).value + right.evaluate(environment).value)
  end
end

class Multiply < Struct.new(:left, :right)
  include Inspect
  def to_s
    "(#{left} * #{right})"
  end
  def evaluate(environment)
    Number.new(left.evaluate(environment).value * right.evaluate(environment).value)
  end
end

class LessThan < Struct.new(:left, :right)
  def to_s
    "#{left} < #{right}"
  end
  def evaluate(environment)
    Boolean.new(left.evaluate(environment).value < right.evaluate(environment).value)
  end
end

class Assign < Struct.new(:name, :expression)
  def to_s
    "#{name} = #{expression}"
  end
  def evaluate(environment)
    environment.merge({name => expression.evaluate(environment)})
  end
end

class DoNothing
  def to_s
    "do-nothing"
  end
  def evaluate(environment)
    environment
  end
end

class If < Struct.new(:condition, :consequence, :alternative)
  def to_s
    "if (#{condition}) then { #{consequence} } else { #{alternative} }"
  end 
  def evaluate(environment)
    case condition.evaluate(environment)
    when Boolean.new(true)
      consequence.evaluate(environment)
    when Boolean.new(false)
      alternative.evaluate(environment)
    end
  end
end

class Sequence < Struct.new(:first, :second)
  def to_s
    "#{first}; #{second}"
  end
  def evaluate(environment)
    second.evaluate(first.evaluate(environment))
  end
end

class While < Struct.new(:condition, :body)
  def to_s
    "while (#{condition}) { #{body} }"
  end
  def evaluate(environment)
    case condition.evaluate(environment)
    when Boolean.new(true)
      evaluate(body.evaluate(environment))
    when Boolean.new(false)
      environment
    end
  end
end


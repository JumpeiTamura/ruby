require 'bundler/setup'
require 'parslet'

class CalcParser < Parslet::Parser
  rule(:sign) { match('[-+]') }

  rule(:integer) do
    (match('[1-9]') >> match('[0-9]').repeat) | match('[0-9]')
  end

  rule(:decimal) do
    str('.') >> match('[0-9]').repeat(1)
  end

  rule(:space) { match('\s').repeat(1) }
  rule(:space?) { space.maybe }

  rule(:number) do
    (sign.maybe >> integer >> decimal.maybe).as(:number) >> space?
  end

  rule(:term_op){ match('[*/]').as(:op) >> space? }

  rule(:term) { (number.as(:left) >> (term_op >> number.as(:right)).repeat).as(:term) }

  rule(:exp_op){ match('[+-]').as(:op) >> space? }

  rule(:exp) { (term.as(:left) >> (exp_op >> term.as(:right)).repeat).as(:exp) }

  root(:exp)
end

NumericNode = Struct.new(:value) do
  def eval
    value.to_f
  end
end

BinOpNode = Struct.new(:left, :op, :right) do
  def eval
    l = left.eval
    r = right.eval
    case op
    when '-'
      l - r
    when '+'
      l + r
    when '*'
      l * r
    when '/'
      l / r
    else
      raise "予期しない演算子です。#{op}"
    end
  end
end

class CalcTransform < Parslet::Transform
  rule(number: simple(:x)) { NumericNode.new(x) }

  rule(left: simple(:x)) { x }

  rule(exp: subtree(:tree)) do
    if tree.is_a?(Array)
      tree.inject do |left, op_right|
        op = op_right[:op]
        right = op_right[:right]
        BinOpNode.new(left, op, right)
      end
    else
      tree
    end
  end

  rule(term: subtree(:tree)) do
    if tree.is_a?(Array)
      tree.inject do |left, op_right|
        op = op_right[:op]
        right = op_right[:right]
        BinOpNode.new(left, op, right)
      end
    else
      tree
    end
  end
end

parsed = CalcParser.new.parse('1 - 2 * 3 + 4')
p parsed

ast = CalcTransform.new.apply(parsed)
p ast

p ast.eval

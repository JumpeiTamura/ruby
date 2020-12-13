require 'bundler/setup'
require 'pry'
require 'parslet'

class SampleParser < Parslet::Parser
  rule(:space) do
    match('\s')
  end

  rule(:lineterm) do
    match('\r').maybe >> match('\n')
  end

  rule(:sep) do
    (space | lineterm).repeat(1)
  end

  rule(:integer) do
    (match('[1-9]') >> match('[0-9]').repeat) | match('[0-9]')
  end

  rule(:primitive_command) do
    str("go") | str("left") | str("right")
  end

  rule(:repeat_command) do
    str("repeat") >> sep >> integer.as(:number) >> sep >> command_list
  end

  rule(:command) do
    repeat_command.as(:repeat) | primitive_command.as(:primitive)
  end

  rule(:command_list) do
    (command >> sep).repeat.as(:command_list) >> str("end")
  end

  rule(:program) do
    str("program") >> sep >> command_list >> sep.maybe
  end

  root(:program)
end

cmd = <<EOS
program
  repeat 2
    repeat 3
      go
      right
    end
    left
  end
end
EOS

parsed = SampleParser.new.parse(cmd)
p parsed

PrimitiveCommand = Struct.new(:command) do
  def execute
    puts command
  end
end

RepeatCommand = Struct.new(:number, :command_list) do
  def execute
    number.times{ command_list.execute }
  end
end

CommandList = Struct.new(:list) do
  def execute
    list.each(&:execute)
  end
end

class CommandTransform < Parslet::Transform
  rule(primitive: simple(:x)) { PrimitiveCommand.new(x) }

  rule(repeat: subtree(:tree)) do
    RepeatCommand.new(
      tree[:number].to_i,
      CommandList.new(tree[:command_list])
    )
  end

  rule(command_list: subtree(:tree)){ CommandList.new(tree) }
end

transformed = CommandTransform.new.apply(parsed)
p transformed
transformed.execute

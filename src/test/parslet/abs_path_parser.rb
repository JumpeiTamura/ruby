require 'bundler/setup'
require 'pry'
require 'parslet'

class AbsPathParser < Parslet::Parser
  rule(:directory) do
    match('[a-zA-Z0-9\-_]').repeat(1) >> str("/")
  end

  rule(:ext) do
    str(".") >> match('[a-zA-Z0-9\-_]').repeat(1)
  end

  rule(:file) do
    match('[a-zA-Z0-9\-_]').repeat >> ext.maybe
  end

  rule(:path) do
    directory.repeat(1) >> file
  end

  rule(:abs_path) do
    str("/") >> path
  end

  root(:abs_path)
end

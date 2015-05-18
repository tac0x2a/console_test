#!/usr/bin/env ruby
# Author::    TAC (tac@tac42.net)

require 'expect'

def verify(io, input, format, *expected)
  io.puts(input)
  result = io.expect(format, 1)
  result.drop(1)
end

IO.popen("./target", "r+") do |pp|
  p verify(pp, "twice 1", /result:(\d)/, "2")
end

#!/usr/bin/env ruby
# Author::    TAC (tac@tac42.net)

require 'expect'

module Console
  @@io = nil

  def self.reset
    @@io.close if @@io and not @@io.closed?
    @@io = IO.popen("./target", "w+")
  end

  def self.verify(input, format)
    @@io.puts input
    @@io.close_write
    res = @@io.expect(format, 1)
    res.drop(1)
  end

  def self.exec(command)
    @@io.puts(command)
  end
end

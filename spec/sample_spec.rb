#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# Author::    TAC (tac@tac42.net)

require 'spec_helper'

describe 'Sample' do

  before do
    Console.reset
  end

  it '2倍する' do
    result = Console.verify( "twice 1", /result:(\d+)/)
    expect(result).to match_array(["2"])
  end

  it '与えられた引数を10倍する 10times' do
    result = Console.verify("10times 100", /result:(\d+)\n/)
    expect(result).to match_array(["1000"])
  end

  it 'ベースアップ' do
    Console.exec( "base")
    Console.exec( "base")
    result = Console.verify("twice 1", /result:(\d+)/)
    expect(result).to match_array(["4"])
  end

end

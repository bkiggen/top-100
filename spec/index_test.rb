# frozen_string_literal: true

require 'spec_helper'
require_relative '../bin/cli'

describe 'Top 100 Phrases CLI' do
  it 'should throw no argument error with no args provided' do
    expect do
      Cli.run([])
    end.to raise_error(ArgumentError)
  end
  it 'should throw bad argument error if file does not exist' do
    expect do
      Cli.run(['not_existent'])
    end.to raise_error(ArgumentError)
  end
end

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

  it 'should throw return a list of phrase counts if the file exists' do
    input = Cli.main(['spec/test_texts/very_small.txt'])
    output = {"i like sandwiches"=>4, "like sandwiches i"=>4, "sandwiches i like"=>2}
    expect(input).to eq(output)
  end
end

# describe 'Methods' do
#   it 'should throw no argument error with no args provided' do
#     expect do
#       Cli.run([])
#     end.to raise_error(ArgumentError)
#   end

#   it 'should throw bad argument error if file does not exist' do
#     expect do
#       Cli.run(['not_existent'])
#     end.to raise_error(ArgumentError)
#   end

#   it 'should throw return a list of phrase counts if the file exists' do
#     input = Cli.main(['spec/test_texts/very_small.txt'])
#     output = {"i like sandwiches"=>4, "like sandwiches i"=>4, "sandwiches i like"=>2}
#     expect(input).to eq(output)
#   end

#   it 'should throw return a list of phrase counts if the file exists' do
#     @my_object = MyObject.new
#     @my_object.send(:do_things_with_message, some_message)
#   end
# end
# frozen_string_literal: true

require 'spec_helper'
require_relative '../bin/cli'

describe 'Top 100 Phrases CLI' do # rubocop:disable Metrics/BlockLength
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
    output = [['i like sandwiches', 2], ['like sandwiches i', 1], ['sandwiches i like', 1]]

    expect(input).to eq(output)
  end

  it 'should ignore case, new lines, and special characters' do
    input = Cli.main(['spec/test_texts/small.txt'])
    expected = [['i like sandwiches', 20], ['like sandwiches i', 20], ['sandwiches i like', 20], ['i like cake', 10],
                ['like cake i', 9], ['cake i like', 9]]

    expect(input).to eq(expected)
  end

  it 'should ignore unicode symbols' do
    input = Cli.main(['spec/test_texts/unicode.txt'])
    expected = [['i like sandwiches', 20], ['like sandwiches i', 20], ['sandwiches i like', 20], ['i like cake', 10],
                ['like cake i', 9], ['cake i like', 9]]

    expect(input).to eq(expected)
  end

  it 'should accept multiple file path arguments' do
    result = Cli.main(['spec/test_texts/small.txt', 'spec/test_texts/very_small.txt'])
    expected = [['i like sandwiches', 22], ['like sandwiches i', 21], ['sandwiches i like', 21], ['i like cake', 10],
                ['like cake i', 10], ['cake i like', 10]]

    expect(result).to eq(expected)
  end

  it 'should accept large txt files' do
    result = Cli.main(['spec/test_texts/moby-dick.txt'])

    expect(result).to eq(MOBY_OUTPUT)
  end
end

MOBY_OUTPUT = [['the sperm whale', 86],
               ['of the whale', 78],
               ['the white whale', 71],
               ['one of the', 64],
               ['of the sea', 57],
               ['out of the', 57],
               ['part of the', 53],
               ['a sort of', 51],
               ['of the sperm', 43],
               ['it was a', 33],
               ['in the sea', 32],
               ['the sperm whales', 31],
               ['it is a', 29],
               ['for a moment', 29],
               ['of the boat', 29],
               ['of the whales', 28],
               ['of the ship', 28],
               ['to the deck', 27],
               ['the sea and', 26],
               ['the right whale', 25],
               ['by no means', 25],
               ['at the same', 25],
               ['for the time', 25],
               ['in order to', 25],
               ['to be the', 24],
               ['so as to', 24],
               ['the same time', 24],
               ['the bottom of', 24],
               ['in the air', 24],
               ['must have been', 23],
               ['that in the', 23],
               ['there is no', 22],
               ['into the sea', 22],
               ['of the pequod', 22],
               ['at the time', 22],
               ['out of sight', 22],
               ['it was that', 22],
               ['there was a', 21],
               ['now and then', 21],
               ['in the fishery', 21],
               ['as it were', 20],
               ['the whale and', 20],
               ['it was not', 20],
               ['and in the', 20],
               ['it was the', 20],
               ['and all the', 19],
               ['into the air', 19],
               ['down into the', 19],
               ['on the sea', 19],
               ['so that the', 19],
               ['as well as', 19],
               ['up to the', 19],
               ['and at the', 19],
               ['as if it', 19],
               ['bottom of the', 18],
               ['one of those', 18],
               ['i do not', 18],
               ['end of the', 18],
               ['the whale is', 18],
               ['project gutenbergtm electronic', 18],
               ['the old man', 17],
               ['the project gutenberg', 17],
               ['the ship and', 17],
               ['in his own', 17],
               ['down to the', 17],
               ['of the white', 17],
               ['the pequod was', 17],
               ['round and round', 17],
               ['over the side', 17],
               ['it is that', 17],
               ['and with a', 17],
               ['down in the', 17],
               ['it is not', 17],
               ['whale and the', 16],
               ['the head of', 16],
               ['to be sure', 16],
               ['to and fro', 16],
               ['but it was', 16],
               ['of the world', 16],
               ['you would have', 16],
               ['the old mans', 16],
               ['it is the', 15],
               ['some of the', 15],
               ['him in the', 15],
               ['of the leviathan', 15],
               ['he seemed to', 15],
               ['it was only', 15],
               ['to be a', 15],
               ['the act of', 15],
               ['he was a', 15],
               ['side of the', 15],
               ['in the same', 15],
               ['all the time', 15],
               ['and as for', 15],
               ['of his head', 15],
               ['on the other', 15],
               ['more and more', 15],
               ['of the great', 15],
               ['owing to the', 14],
               ['in the first', 14]].freeze

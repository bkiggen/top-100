# frozen_string_literal: true

# !/usr/bin/env ruby
require 'hirb'
require 'pry'

# Main Cli class
class Cli
  STORE = {}.freeze

  def self.run(args)
    new(args).run
  end

  def initialize(args)
    @args = args
    throw_arg_error('none') if @args.count.zero?
  end

  def clean_string(str)
    str.downcase.gsub(/[^a-z0-9'\s]/i, '')
  end

  def initialize_text
    @input_docs = []
    @args.each do |doc|
      throw_arg_error('bad') if !File.file?(doc)
      new_file = File.readlines(doc, chomp: true)
      @input_docs.concat(new_file)
    end
  end

  def format_and_display_output
    output = STORE.sort { |a1, a2| a2[1].to_i <=> a1[1].to_i }.first(100)

    puts Hirb::Helpers::AutoTable.render(output, { headers: %w[phrase count] })
  end

  def interpret_file(split_line)
    split_line.each_with_index do |current_word, i|
      one_ahead = split_line[i + 1]
      two_ahead = split_line[i + 2]

      if one_ahead && two_ahead
        data_key = clean_string("#{current_word} #{one_ahead} #{two_ahead}")
        STORE.key?(data_key) ? STORE[data_key] += 1 : STORE[data_key] = 1
      else
        @leftover_words.push(clean_string(current_word)) # fix this
      end
    end
  end

  def run
    initialize_text
    @leftover_words = []

    @input_docs.each do |line|
      split_line = line.split(' ')
      interpret_file(split_line)
    end

    format_and_display_output
  end

  def throw_arg_error(type)
    error_msgs = {
      none: 'Please include at least one text file as an argument.',
      bad: 'Please include a valid file extension as an argument.',
    }
    raise ArgumentError, error_msgs[type]
  end
end

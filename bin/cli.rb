# frozen_string_literal: true

# !/usr/bin/env ruby
require 'hirb'
require 'pry'

# Main Cli class
class Cli
  STORE = {}

  def self.run(args)
    new(args).run
  end

  def self.main(args)
    new(args).main
  end

  def initialize(args)
    @args = args
    throw_arg_error(:none) if @args.count.zero?

    @input_docs = []
    @args.each do |doc|
      throw_arg_error(:bad) if !File.file?(doc)
      new_file = File.readlines(doc, chomp: true)
      @input_docs.concat(new_file)
    end
    @input_docs = @input_docs.map(&:chomp).join(" ")
  end

  def main
    @leftover_words = []

    @input_docs.each do |line|
      split_line = line.split(' ')
      process_text(split_line)
    end
    STORE
  end

  def run
    main
    format_and_display_output
  end

  private

   def clean_string(str)
    return nil unless str.is_a? String

    str.downcase.gsub(/[^a-z0-9'\s]/i, '')
  end

  def format_and_display_output
    output = STORE.sort { |a1, a2| a2[1].to_i <=> a1[1].to_i }.first(100)

    puts Hirb::Helpers::AutoTable.render(output, { headers: %w[phrase count] })
  end

  def update_store(first_word, second_word, third_word)
    data_key = "#{first_word} #{second_word} #{third_word}"
    STORE.key?(data_key) ? STORE[data_key] += 1 : STORE[data_key] = 1
  end

  def process_text(split_line)
    split_line.each_with_index do |word, i|
      current_word = clean_string(word)
      one_ahead = clean_string(split_line[i + 1])
      two_ahead = clean_string(split_line[i + 2])
      one_behind = clean_string(split_line[i -1])

      if i === 0 && @leftover_words.any?
        update_store(@leftover_words[0], @leftover_words[1], current_word)
        print "first"
        print @leftover_words
        print [@leftover_words[0], @leftover_words[1], current_word]
        @leftover_words.delete_at(0)
      elsif i === 1 && @leftover_words.any?
        update_store(@leftover_words[0], current_word, one_ahead)
        print "second"
        print @leftover_words
        print [@leftover_words[0], one_behind, current_word]
      elsif one_ahead && two_ahead
        update_store(current_word, one_ahead, two_ahead)
      else
        @leftover_words.push(current_word) 
      end
    end
  end

  def throw_arg_error(type)
    error_msgs = {
      none: 'Please include at least one text file as an argument.',
      bad: 'Please include a valid file extension as an argument.',
    }
    raise ArgumentError, error_msgs[type]
  end
end

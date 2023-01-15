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

    @input_text = []
    @args.each do |doc|
      throw_arg_error(:bad) if !File.file?(doc)

      new_file = File.readlines(doc)
      out = santize_text(new_file)

      @input_text.concat(out)
    end
  end

  def main
    @input_text.each_with_index do |word, i|
      current_word = word
      one_ahead = @input_text[i + 1]
      two_ahead = @input_text[i + 2]

      if one_ahead && two_ahead
        update_store(current_word, one_ahead, two_ahead)
      end
    end

    STORE
  end

  def run
    main
    format_and_display_output
  end

  private

  def santize_text(new_file)
    out = new_file.map { |text_file| clean_string(text_file).chomp } 
    out.join(" ").split(" ")
  end

  def clean_string(str)
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

  def throw_arg_error(type)
    error_msgs = {
      none: 'Please include at least one text file as an argument.',
      bad: 'Please include a valid file extension as an argument.',
    }
    raise ArgumentError, error_msgs[type]
  end
end

# frozen_string_literal: true

# !/usr/bin/env ruby
require 'hirb' # for clean output display
require 'pry' # for debugging

# Cli
class Cli
  def self.run(args)
    new(args).run
  end

  def self.main(args)
    new(args).main
  end

  def initialize(args)
    @store = {}
    throw_arg_error(:none) if no_arg_given(args)
    @formatted_args = args.is_a?(Array) ? read_files(args) : args.read

    throw_arg_error(:none) if empty_arg_given

    @input_text = sanitize_input(@formatted_args)
  end

  def main
    @input_text.each_with_index do |current_word, i|
      one_ahead = @input_text[i + 1]
      two_ahead = @input_text[i + 2]
      update_store(current_word, one_ahead, two_ahead) if one_ahead && two_ahead
    end

    @store.sort { |a1, a2| a2[1].to_i <=> a1[1].to_i }.first(100)
  end

  def run
    main
    format_and_display_output
    0 # exit code
  end

  private

  def sanitize_input(str)
    out = str.downcase
    out = out.gsub(/\\u[\da-f]{4}/i) { |m| [m[-4..].to_i(16)].pack('U') }
    out = out.gsub(/[^a-z0-9'\s]/i, '').gsub(/\s+/, ' ')
    out.split(' ')
  end

  def format_and_display_output
    sorted_output = @store.sort { |a1, a2| a2[1].to_i <=> a1[1].to_i }.first(100)

    puts Hirb::Helpers::AutoTable.render(sorted_output, { headers: %w[phrase count] })
  end

  def no_arg_given(_args)
    ARGV.empty? && $stdin.tty?
  end

  def empty_arg_given
    @formatted_args.nil? || @formatted_args.empty?
  end

  def update_store(first_word, second_word, third_word)
    data_key = "#{first_word} #{second_word} #{third_word}"
    @store.key?(data_key) ? @store[data_key] += 1 : @store[data_key] = 1
  end

  def throw_arg_error(type)
    error_msgs = {
      none: 'Please include at least one text file as an argument.',
      bad: 'Please include a valid file extension as an argument.'
    }
    raise ArgumentError, error_msgs[type]
  end

  def read_files(files)
    out = ''
    files.each do |f|
      throw_arg_error(:bad) unless File.file?(f)
      formatted_file = File.read(f)
      out += " #{formatted_file}"
    end
    out
  end
end

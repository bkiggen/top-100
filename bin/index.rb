# frozen_string_literal: true
#!/usr/bin/env ruby -n

require_relative 'cli'

exit(Cli.run(ARGF))

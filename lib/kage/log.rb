require 'http/parser'

module Kage
  LEVEL_INFO  = 0
  LEVEL_ERROR = 1

  class Log
    def initialize(out=STDERR, level=LEVEL_INFO, time_format='%Y-%m-%d %H:%M:%S %z: ')
      @out = out
      @level = level
      @time_format = time_format
    end

    def info(msg)
      return if @level > LEVEL_INFO
      puts(msg)
    end

    def error(msg)
      puts(msg)
    end

    def puts(msg)
      @out.puts("#{Time.now.strftime(@time_format)} #{msg}")
      @out.flush
      msg
    rescue
      nil
    end
  end
end

module Yarpler
  class Log
    include Singleton

    attr_reader :haserror

    def initialize
      @logger = Logging.logger(STDOUT)
      switch_level(:info)
      @haserror = false
    end

    def switch_level(level)
      @logger.level = level
    end

    def info(info)
      @logger.info info
    end

    def warn(warn)
      @logger.info warn
    end

    def error(error)
      @logger.error error
      @haserror = true
    end

    def debug(debug)
      @logger.info debug
    end
  end
end

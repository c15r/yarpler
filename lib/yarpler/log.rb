module Yarpler
  class Log

    include Singleton

    def initialize
      @logger = Logging.logger(STDOUT)
      switch_level(:info)
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
    end

    def debug(debug)
      @logger.info debug
    end

  end
end

module Yarpler
  # Log facility which abstracts the Logging gem
  # Implemented as Singleton
  class Log
    include Singleton

    attr_reader :haserror

    # Initializes the logger
    def initialize
      @logger = Logging.logger(STDOUT)
      switch_level(:info)
      @haserror = false
    end

    # Switches the log level to info, warning, error or debugging
    def switch_level(level)
      @logger.level = level
    end

    # Sets log level to info
    def info(info)
      @logger.info info
    end

    # Sets log level to warning
    def warn(warn)
      @logger.info warn
    end

    # Sets log level to error
    def error(error)
      @logger.error error
      @haserror = true
    end

    # Sets log level to debug
    def debug(debug)
      @logger.info debug
    end
  end
end

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
    #
    # @param level [String] log level
    def switch_level(level)
      @logger.level = level
    end

    # Sets log level to info
    #
    # @param info [String] information to log
    # @return [void] returns true if the severity is high enough and string was logged
    def info(info)
      @logger.info info
    end

    # Sets log level to warning
    #
    # @param warn [String] warning to log
    # @return [void] returns true if the severity is high enough and string was logged
    def warn(warn)
      @logger.info warn
    end

    # Sets log level to error
    #
    # @param error [String] error message to log
    # @return [void] returns true if the severity is high enough and string was logged
    def error(error)
      @logger.error error
      @haserror = true
    end

    # Sets log level to debug
    #
    # @param debug [String] debug message to log
    # @return [void] returns true if the severity is high enough and string was logged
    def debug(debug)
      @logger.info debug
    end
  end
end

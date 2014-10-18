#!/usr/bin/env ruby
#
# YarplerOutput.g
# --
# Generated using ANTLR version: 3.5
# Ruby runtime library version: 1.10.0
# Input grammar file: YarplerOutput.g
# Generated at: 2014-10-18 16:15:31
#

# ~~~> start load path setup
this_directory = File.expand_path( File.dirname( __FILE__ ) )
$LOAD_PATH.unshift( this_directory ) unless $LOAD_PATH.include?( this_directory )

antlr_load_failed = proc do
  load_path = $LOAD_PATH.map { |dir| '  - ' << dir }.join( $/ )
  raise LoadError, <<-END.strip!

Failed to load the ANTLR3 runtime library (version 1.10.0):

Ensure the library has been installed on your system and is available
on the load path. If rubygems is available on your system, this can
be done with the command:

  gem install antlr3

Current load path:
#{ load_path }

  END
end

defined?( ANTLR3 ) or begin

  # 1: try to load the ruby antlr3 runtime library from the system path
  require 'antlr3'

rescue LoadError

  # 2: try to load rubygems if it isn't already loaded
  defined?( Gem ) or begin
    require 'rubygems'
  rescue LoadError
    antlr_load_failed.call
  end

  # 3: try to activate the antlr3 gem
  begin
    defined?( gem ) and gem( 'antlr3', '~> 1.10.0' )
  rescue Gem::LoadError
    antlr_load_failed.call
  end

  require 'antlr3'

end
# <~~~ end load path setup

module YarplerOutput
  # TokenData defines all of the token type integer values
  # as constants, which will be included in all
  # ANTLR-generated recognizers.
  const_defined?( :TokenData ) or TokenData = ANTLR3::TokenScheme.new

  module TokenData

    # define the token constants
    define_tokens( :EOF => -1, :T__19 => 19, :T__20 => 20, :T__21 => 21, 
                   :T__22 => 22, :T__23 => 23, :T__24 => 24, :T__25 => 25, 
                   :T__26 => 26, :ALPHABET => 4, :ALPHANUMERIC => 5, :DIGIT => 6, 
                   :DIGITS => 7, :DIGIT_LIST => 8, :IDENTIFIER => 9, :LETTER => 10, 
                   :LETTERORDIGIT => 11, :LOWERCASE => 12, :OUTPUT => 13, 
                   :OUTPUT_LIST => 14, :START => 15, :UNSAT => 16, :UPPERCASE => 17, 
                   :WS => 18 )

  end


  class Lexer < ANTLR3::Lexer
    @grammar_home = YarplerOutput
    include TokenData

    begin
      generated_using( "YarplerOutput.g", "3.5", "1.10.0" )
    rescue NoMethodError => error
      # ignore
    end

    RULE_NAMES   = [ "T__19", "T__20", "T__21", "T__22", "T__23", "T__24", 
                     "T__25", "T__26", "WS", "IDENTIFIER", "LETTER", "LETTERORDIGIT", 
                     "LOWERCASE", "UPPERCASE", "ALPHABET", "ALPHANUMERIC", 
                     "DIGIT", "DIGITS" ].freeze
    RULE_METHODS = [ :t__19!, :t__20!, :t__21!, :t__22!, :t__23!, :t__24!, 
                     :t__25!, :t__26!, :ws!, :identifier!, :letter!, :letterordigit!, 
                     :lowercase!, :uppercase!, :alphabet!, :alphanumeric!, 
                     :digit!, :digits! ].freeze

    def initialize( input=nil, options = {} )
      super( input, options )
    end


    # - - - - - - - - - - - lexer rules - - - - - - - - - - - -
    # lexer rule t__19! (T__19)
    # (in YarplerOutput.g)
    def t__19!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 1 )



      type = T__19
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 7:9: ' '
      match( 0x20 )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 1 )


    end

    # lexer rule t__20! (T__20)
    # (in YarplerOutput.g)
    def t__20!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 2 )



      type = T__20
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 8:9: ', '
      match( ", " )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 2 )


    end

    # lexer rule t__21! (T__21)
    # (in YarplerOutput.g)
    def t__21!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 3 )



      type = T__21
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 9:9: '----------'
      match( "----------" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 3 )


    end

    # lexer rule t__22! (T__22)
    # (in YarplerOutput.g)
    def t__22!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 4 )



      type = T__22
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 10:9: '='
      match( 0x3d )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 4 )


    end

    # lexer rule t__23! (T__23)
    # (in YarplerOutput.g)
    def t__23!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 5 )



      type = T__23
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 11:9: '=========='
      match( "==========" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 5 )


    end

    # lexer rule t__24! (T__24)
    # (in YarplerOutput.g)
    def t__24!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 6 )



      type = T__24
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 12:9: '=====UNSATISFIABLE====='
      match( "=====UNSATISFIABLE=====" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 6 )


    end

    # lexer rule t__25! (T__25)
    # (in YarplerOutput.g)
    def t__25!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 7 )



      type = T__25
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 13:9: '{'
      match( 0x7b )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 7 )


    end

    # lexer rule t__26! (T__26)
    # (in YarplerOutput.g)
    def t__26!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 8 )



      type = T__26
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 14:9: '}'
      match( 0x7d )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 8 )


    end

    # lexer rule ws! (WS)
    # (in YarplerOutput.g)
    def ws!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 9 )



      type = WS
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 36:6: ( '\\r' | '\\n' )
      if @input.peek(1) == 0xa || @input.peek(1) == 0xd
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse

      end



      # --> action
      skip();
      # <-- action



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 9 )


    end

    # lexer rule identifier! (IDENTIFIER)
    # (in YarplerOutput.g)
    def identifier!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )



      type = IDENTIFIER
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 39:14: LETTER ( LETTERORDIGIT )*
      letter!

      # at line 39:21: ( LETTERORDIGIT )*
      while true # decision 1
        alt_1 = 2
        look_1_0 = @input.peek( 1 )

        if ( look_1_0.between?( 0x30, 0x39 ) || look_1_0.between?( 0x41, 0x5a ) || look_1_0 == 0x5f || look_1_0.between?( 0x61, 0x7a ) )
          alt_1 = 1

        end
        case alt_1
        when 1
          # at line 
          if @input.peek( 1 ).between?( 0x30, 0x39 ) || @input.peek( 1 ).between?( 0x41, 0x5a ) || @input.peek(1) == 0x5f || @input.peek( 1 ).between?( 0x61, 0x7a )
            @input.consume
          else
            mse = MismatchedSet( nil )
            recover mse
            raise mse

          end



        else
          break # out of loop for decision 1
        end
      end # loop for decision 1



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 10 )


    end

    # lexer rule letter! (LETTER)
    # (in YarplerOutput.g)
    def letter!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )


    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 
      if @input.peek( 1 ).between?( 0x41, 0x5a ) || @input.peek(1) == 0x5f || @input.peek( 1 ).between?( 0x61, 0x7a )
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse

      end



    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 11 )


    end

    # lexer rule letterordigit! (LETTERORDIGIT)
    # (in YarplerOutput.g)
    def letterordigit!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )


    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 
      if @input.peek( 1 ).between?( 0x30, 0x39 ) || @input.peek( 1 ).between?( 0x41, 0x5a ) || @input.peek(1) == 0x5f || @input.peek( 1 ).between?( 0x61, 0x7a )
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse

      end



    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 12 )


    end

    # lexer rule lowercase! (LOWERCASE)
    # (in YarplerOutput.g)
    def lowercase!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )


    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 
      if @input.peek( 1 ).between?( 0x61, 0x7a )
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse

      end



    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 13 )


    end

    # lexer rule uppercase! (UPPERCASE)
    # (in YarplerOutput.g)
    def uppercase!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )


    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 
      if @input.peek( 1 ).between?( 0x41, 0x5a )
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse

      end



    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 14 )


    end

    # lexer rule alphabet! (ALPHABET)
    # (in YarplerOutput.g)
    def alphabet!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )


    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 
      if @input.peek( 1 ).between?( 0x41, 0x5a ) || @input.peek( 1 ).between?( 0x61, 0x7a )
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse

      end



    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 15 )


    end

    # lexer rule alphanumeric! (ALPHANUMERIC)
    # (in YarplerOutput.g)
    def alphanumeric!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )


    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 
      if @input.peek( 1 ).between?( 0x30, 0x39 ) || @input.peek( 1 ).between?( 0x41, 0x5a ) || @input.peek( 1 ).between?( 0x61, 0x7a )
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse

      end



    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 16 )


    end

    # lexer rule digit! (DIGIT)
    # (in YarplerOutput.g)
    def digit!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )


    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 
      if @input.peek( 1 ).between?( 0x30, 0x39 )
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse

      end



    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 17 )


    end

    # lexer rule digits! (DIGITS)
    # (in YarplerOutput.g)
    def digits!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )



      type = DIGITS
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 75:10: ( '+' | '-' )? DIGIT ( DIGIT )*
      # at line 75:10: ( '+' | '-' )?
      alt_2 = 2
      look_2_0 = @input.peek( 1 )

      if ( look_2_0 == 0x2b || look_2_0 == 0x2d )
        alt_2 = 1
      end
      case alt_2
      when 1
        # at line 
        if @input.peek(1) == 0x2b || @input.peek(1) == 0x2d
          @input.consume
        else
          mse = MismatchedSet( nil )
          recover mse
          raise mse

        end



      end

      digit!

      # at line 75:27: ( DIGIT )*
      while true # decision 3
        alt_3 = 2
        look_3_0 = @input.peek( 1 )

        if ( look_3_0.between?( 0x30, 0x39 ) )
          alt_3 = 1

        end
        case alt_3
        when 1
          # at line 
          if @input.peek( 1 ).between?( 0x30, 0x39 )
            @input.consume
          else
            mse = MismatchedSet( nil )
            recover mse
            raise mse

          end



        else
          break # out of loop for decision 3
        end
      end # loop for decision 3



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 18 )


    end

    # main rule used to study the input at the current position,
    # and choose the proper lexer rule to call in order to
    # fetch the next token
    #
    # usually, you don't make direct calls to this method,
    # but instead use the next_token method, which will
    # build and emit the actual next token
    def token!
      # at line 1:8: ( T__19 | T__20 | T__21 | T__22 | T__23 | T__24 | T__25 | T__26 | WS | IDENTIFIER | DIGITS )
      alt_4 = 11
      case look_4 = @input.peek( 1 )
      when 0x20 then alt_4 = 1
      when 0x2c then alt_4 = 2
      when 0x2d then look_4_3 = @input.peek( 2 )

      if ( look_4_3 == 0x2d )
        alt_4 = 3
      elsif ( look_4_3.between?( 0x30, 0x39 ) )
        alt_4 = 11
      else
        raise NoViableAlternative( "", 4, 3 )

      end
      when 0x3d then look_4_4 = @input.peek( 2 )

      if ( look_4_4 == 0x3d )
        look_4_11 = @input.peek( 3 )

        if ( look_4_11 == 0x3d )
          look_4_13 = @input.peek( 4 )

          if ( look_4_13 == 0x3d )
            look_4_14 = @input.peek( 5 )

            if ( look_4_14 == 0x3d )
              look_4_15 = @input.peek( 6 )

              if ( look_4_15 == 0x3d )
                alt_4 = 5
              elsif ( look_4_15 == 0x55 )
                alt_4 = 6
              else
                raise NoViableAlternative( "", 4, 15 )

              end
            else
              raise NoViableAlternative( "", 4, 14 )

            end
          else
            raise NoViableAlternative( "", 4, 13 )

          end
        else
          raise NoViableAlternative( "", 4, 11 )

        end
      else
        alt_4 = 4

      end
      when 0x7b then alt_4 = 7
      when 0x7d then alt_4 = 8
      when 0xa, 0xd then alt_4 = 9
      when 0x41, 0x42, 0x43, 0x44, 0x45, 0x46, 0x47, 0x48, 0x49, 0x4a, 0x4b, 0x4c, 0x4d, 0x4e, 0x4f, 0x50, 0x51, 0x52, 0x53, 0x54, 0x55, 0x56, 0x57, 0x58, 0x59, 0x5a, 0x5f, 0x61, 0x62, 0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x6a, 0x6b, 0x6c, 0x6d, 0x6e, 0x6f, 0x70, 0x71, 0x72, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78, 0x79, 0x7a then alt_4 = 10
      when 0x2b, 0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39 then alt_4 = 11
      else
        raise NoViableAlternative( "", 4, 0 )

      end
      case alt_4
      when 1
        # at line 1:10: T__19
        t__19!


      when 2
        # at line 1:16: T__20
        t__20!


      when 3
        # at line 1:22: T__21
        t__21!


      when 4
        # at line 1:28: T__22
        t__22!


      when 5
        # at line 1:34: T__23
        t__23!


      when 6
        # at line 1:40: T__24
        t__24!


      when 7
        # at line 1:46: T__25
        t__25!


      when 8
        # at line 1:52: T__26
        t__26!


      when 9
        # at line 1:58: WS
        ws!


      when 10
        # at line 1:61: IDENTIFIER
        identifier!


      when 11
        # at line 1:72: DIGITS
        digits!


      end
    end

  end # class Lexer < ANTLR3::Lexer

  at_exit { Lexer.main( ARGV ) } if __FILE__ == $0

end

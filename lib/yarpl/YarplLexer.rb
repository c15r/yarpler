#!/usr/bin/env ruby
#
# lib/yarpl/Yarpl.g
# --
# Generated using ANTLR version: 3.5
# Ruby runtime library version: 1.10.0
# Input grammar file: lib/yarpl/Yarpl.g
# Generated at: 2014-09-29 15:19:11
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

module Yarpl
  # TokenData defines all of the token type integer values
  # as constants, which will be included in all
  # ANTLR-generated recognizers.
  const_defined?( :TokenData ) or TokenData = ANTLR3::TokenScheme.new

  module TokenData

    # define the token constants
    define_tokens( :EOF => -1, :T__70 => 70, :T__71 => 71, :T__72 => 72, 
                   :T__73 => 73, :T__74 => 74, :T__75 => 75, :T__76 => 76, 
                   :T__77 => 77, :T__78 => 78, :T__79 => 79, :T__80 => 80, 
                   :T__81 => 81, :ALPHABET => 4, :ALPHANUMERIC => 5, :AND => 6, 
                   :ASSIGN => 7, :ATTRIBUTE => 8, :BANG => 9, :CLASS_DECLARATION => 10, 
                   :COLON => 11, :COMMA => 12, :COMMENT => 13, :CONSTANT => 14, 
                   :CONSTRAINT_DECLARATION => 15, :CONSTRAINT_EXPRESSION => 16, 
                   :DEC => 17, :DIGIT => 18, :DIGITORUNDERSCORE => 19, :DIGITS => 20, 
                   :DIV => 21, :DOMAIN_BODY => 22, :DOMAIN_BODY_DECLARATION => 23, 
                   :DOMAIN_DECLARATION => 24, :DOT => 25, :EQUALS => 26, 
                   :FIELD_ACCESSOR => 27, :FIELD_DECLARATION => 28, :GT => 29, 
                   :GTE => 30, :IDENTIFIER => 31, :INC => 32, :INITIAL_DECLARATION => 33, 
                   :INTEGER => 34, :INTEGERLITERAL => 35, :LBRACE => 36, 
                   :LBRACK => 37, :LINE_COMMENT => 38, :LIST => 39, :LOWERCASE => 40, 
                   :LPAREN => 41, :LT => 42, :LTE => 43, :MEMBER_DECLARATION => 44, 
                   :MINUS => 45, :MOD => 46, :NONZERODIGIT => 47, :NOT_EQUALS => 48, 
                   :OR => 49, :PLUS => 50, :QUESTION => 51, :RANGEINTEGERLITERAL => 52, 
                   :RBRACE => 53, :RBRACK => 54, :REFERENCE => 55, :RPAREN => 56, 
                   :SEMI => 57, :SET => 58, :SIGN => 59, :START => 60, :TIMES => 61, 
                   :TYPE_DECLARATION => 62, :UPPERCASE => 63, :VARIABLE => 64, 
                   :VARIABLE_DECLARATION => 65, :VARIABLE_DECLARATOR => 66, 
                   :WS => 67, :YARPL_LETTER => 68, :YARPL_LETTERORDIGIT => 69 )

  end


  class Lexer < ANTLR3::Lexer
    @grammar_home = Yarpl
    include TokenData

    begin
      generated_using( "lib/yarpl/Yarpl.g", "3.5", "1.10.0" )
    rescue NoMethodError => error
      # ignore
    end

    RULE_NAMES   = [ "T__70", "T__71", "T__72", "T__73", "T__74", "T__75", 
                     "T__76", "T__77", "T__78", "T__79", "T__80", "T__81", 
                     "WS", "COMMENT", "LINE_COMMENT", "IDENTIFIER", "YARPL_LETTER", 
                     "YARPL_LETTERORDIGIT", "DIGIT", "DIGITS", "NONZERODIGIT", 
                     "DIGITORUNDERSCORE", "LOWERCASE", "UPPERCASE", "ALPHABET", 
                     "ALPHANUMERIC", "RANGEINTEGERLITERAL", "INTEGERLITERAL", 
                     "SIGN", "LPAREN", "RPAREN", "LBRACE", "RBRACE", "LBRACK", 
                     "RBRACK", "SEMI", "COMMA", "DOT", "ASSIGN", "GT", "LT", 
                     "BANG", "QUESTION", "COLON", "EQUALS", "LTE", "GTE", 
                     "NOT_EQUALS", "AND", "OR", "INC", "DEC", "PLUS", "MINUS", 
                     "TIMES", "DIV", "MOD" ].freeze
    RULE_METHODS = [ :t__70!, :t__71!, :t__72!, :t__73!, :t__74!, :t__75!, 
                     :t__76!, :t__77!, :t__78!, :t__79!, :t__80!, :t__81!, 
                     :ws!, :comment!, :line_comment!, :identifier!, :yarpl_letter!, 
                     :yarpl_letterordigit!, :digit!, :digits!, :nonzerodigit!, 
                     :digitorunderscore!, :lowercase!, :uppercase!, :alphabet!, 
                     :alphanumeric!, :rangeintegerliteral!, :integerliteral!, 
                     :sign!, :lparen!, :rparen!, :lbrace!, :rbrace!, :lbrack!, 
                     :rbrack!, :semi!, :comma!, :dot!, :assign!, :gt!, :lt!, 
                     :bang!, :question!, :colon!, :equals!, :lte!, :gte!, 
                     :not_equals!, :and!, :or!, :inc!, :dec!, :plus!, :minus!, 
                     :times!, :div!, :mod! ].freeze

    def initialize( input=nil, options = {} )
      super( input, options )
    end


    # - - - - - - - - - - - lexer rules - - - - - - - - - - - -
    # lexer rule t__70! (T__70)
    # (in lib/yarpl/Yarpl.g)
    def t__70!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 1 )



      type = T__70
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 7:9: 'and'
      match( "and" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 1 )


    end

    # lexer rule t__71! (T__71)
    # (in lib/yarpl/Yarpl.g)
    def t__71!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 2 )



      type = T__71
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 8:9: 'class'
      match( "class" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 2 )


    end

    # lexer rule t__72! (T__72)
    # (in lib/yarpl/Yarpl.g)
    def t__72!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 3 )



      type = T__72
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 9:9: 'const'
      match( "const" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 3 )


    end

    # lexer rule t__73! (T__73)
    # (in lib/yarpl/Yarpl.g)
    def t__73!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 4 )



      type = T__73
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 10:9: 'constraint'
      match( "constraint" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 4 )


    end

    # lexer rule t__74! (T__74)
    # (in lib/yarpl/Yarpl.g)
    def t__74!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 5 )



      type = T__74
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 11:9: 'domain'
      match( "domain" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 5 )


    end

    # lexer rule t__75! (T__75)
    # (in lib/yarpl/Yarpl.g)
    def t__75!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 6 )



      type = T__75
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 12:9: 'initial'
      match( "initial" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 6 )


    end

    # lexer rule t__76! (T__76)
    # (in lib/yarpl/Yarpl.g)
    def t__76!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 7 )



      type = T__76
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 13:9: 'integer'
      match( "integer" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 7 )


    end

    # lexer rule t__77! (T__77)
    # (in lib/yarpl/Yarpl.g)
    def t__77!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 8 )



      type = T__77
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 14:9: 'mod'
      match( "mod" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 8 )


    end

    # lexer rule t__78! (T__78)
    # (in lib/yarpl/Yarpl.g)
    def t__78!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 9 )



      type = T__78
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 15:9: 'new'
      match( "new" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 9 )


    end

    # lexer rule t__79! (T__79)
    # (in lib/yarpl/Yarpl.g)
    def t__79!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )



      type = T__79
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 16:9: 'or'
      match( "or" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 10 )


    end

    # lexer rule t__80! (T__80)
    # (in lib/yarpl/Yarpl.g)
    def t__80!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )



      type = T__80
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 17:9: 'reference'
      match( "reference" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 11 )


    end

    # lexer rule t__81! (T__81)
    # (in lib/yarpl/Yarpl.g)
    def t__81!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )



      type = T__81
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 18:9: 'var'
      match( "var" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 12 )


    end

    # lexer rule ws! (WS)
    # (in lib/yarpl/Yarpl.g)
    def ws!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )



      type = WS
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 241:6: ( ' ' | '\\t' | '\\r' | '\\n' )
      if @input.peek( 1 ).between?( 0x9, 0xa ) || @input.peek(1) == 0xd || @input.peek(1) == 0x20
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
      # trace_out( __method__, 13 )


    end

    # lexer rule comment! (COMMENT)
    # (in lib/yarpl/Yarpl.g)
    def comment!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )



      type = COMMENT
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 244:11: ( '/*' | ' .*? ' | '*/' )
      # at line 244:11: ( '/*' | ' .*? ' | '*/' )
      alt_1 = 3
      case look_1 = @input.peek( 1 )
      when 0x2f then alt_1 = 1
      when 0x20 then alt_1 = 2
      when 0x2a then alt_1 = 3
      else
        raise NoViableAlternative( "", 1, 0 )

      end
      case alt_1
      when 1
        # at line 244:12: '/*'
        match( "/*" )


      when 2
        # at line 244:19: ' .*? '
        match( " .*? " )


      when 3
        # at line 244:29: '*/'
        match( "*/" )


      end

      # --> action
      skip();
      # <-- action



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 14 )


    end

    # lexer rule line_comment! (LINE_COMMENT)
    # (in lib/yarpl/Yarpl.g)
    def line_comment!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )



      type = LINE_COMMENT
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 247:16: '//'
      match( "//" )


      # --> action
       channel=HIDDEN; 
      # <-- action



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 15 )


    end

    # lexer rule identifier! (IDENTIFIER)
    # (in lib/yarpl/Yarpl.g)
    def identifier!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )



      type = IDENTIFIER
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 252:14: YARPL_LETTER ( YARPL_LETTERORDIGIT )*
      yarpl_letter!

      # at line 252:27: ( YARPL_LETTERORDIGIT )*
      while true # decision 2
        alt_2 = 2
        look_2_0 = @input.peek( 1 )

        if ( look_2_0 == 0x24 || look_2_0.between?( 0x30, 0x39 ) || look_2_0.between?( 0x41, 0x5a ) || look_2_0 == 0x5f || look_2_0.between?( 0x61, 0x7a ) )
          alt_2 = 1

        end
        case alt_2
        when 1
          # at line 
          if @input.peek(1) == 0x24 || @input.peek( 1 ).between?( 0x30, 0x39 ) || @input.peek( 1 ).between?( 0x41, 0x5a ) || @input.peek(1) == 0x5f || @input.peek( 1 ).between?( 0x61, 0x7a )
            @input.consume
          else
            mse = MismatchedSet( nil )
            recover mse
            raise mse

          end



        else
          break # out of loop for decision 2
        end
      end # loop for decision 2



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 16 )


    end

    # lexer rule yarpl_letter! (YARPL_LETTER)
    # (in lib/yarpl/Yarpl.g)
    def yarpl_letter!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )


    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 
      if @input.peek(1) == 0x24 || @input.peek( 1 ).between?( 0x41, 0x5a ) || @input.peek(1) == 0x5f || @input.peek( 1 ).between?( 0x61, 0x7a )
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

    # lexer rule yarpl_letterordigit! (YARPL_LETTERORDIGIT)
    # (in lib/yarpl/Yarpl.g)
    def yarpl_letterordigit!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )


    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 
      if @input.peek(1) == 0x24 || @input.peek( 1 ).between?( 0x30, 0x39 ) || @input.peek( 1 ).between?( 0x41, 0x5a ) || @input.peek(1) == 0x5f || @input.peek( 1 ).between?( 0x61, 0x7a )
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse

      end



    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 18 )


    end

    # lexer rule digit! (DIGIT)
    # (in lib/yarpl/Yarpl.g)
    def digit!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )


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
      # trace_out( __method__, 19 )


    end

    # lexer rule digits! (DIGITS)
    # (in lib/yarpl/Yarpl.g)
    def digits!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )


    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 273:10: DIGIT ( ( DIGITORUNDERSCORE )* DIGIT )?
      digit!

      # at line 273:16: ( ( DIGITORUNDERSCORE )* DIGIT )?
      alt_4 = 2
      look_4_0 = @input.peek( 1 )

      if ( look_4_0.between?( 0x30, 0x39 ) || look_4_0 == 0x5f )
        alt_4 = 1
      end
      case alt_4
      when 1
        # at line 273:17: ( DIGITORUNDERSCORE )* DIGIT
        # at line 273:17: ( DIGITORUNDERSCORE )*
        while true # decision 3
          alt_3 = 2
          look_3_0 = @input.peek( 1 )

          if ( look_3_0.between?( 0x30, 0x39 ) )
            look_3_1 = @input.peek( 2 )

            if ( look_3_1.between?( 0x30, 0x39 ) || look_3_1 == 0x5f )
              alt_3 = 1

            end
          elsif ( look_3_0 == 0x5f )
            alt_3 = 1

          end
          case alt_3
          when 1
            # at line 
            if @input.peek( 1 ).between?( 0x30, 0x39 ) || @input.peek(1) == 0x5f
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


        digit!


      end

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 20 )


    end

    # lexer rule nonzerodigit! (NONZERODIGIT)
    # (in lib/yarpl/Yarpl.g)
    def nonzerodigit!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )


    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 
      if @input.peek( 1 ).between?( 0x31, 0x39 )
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse

      end



    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 21 )


    end

    # lexer rule digitorunderscore! (DIGITORUNDERSCORE)
    # (in lib/yarpl/Yarpl.g)
    def digitorunderscore!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )


    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 
      if @input.peek( 1 ).between?( 0x30, 0x39 ) || @input.peek(1) == 0x5f
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse

      end



    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 22 )


    end

    # lexer rule lowercase! (LOWERCASE)
    # (in lib/yarpl/Yarpl.g)
    def lowercase!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )


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
      # trace_out( __method__, 23 )


    end

    # lexer rule uppercase! (UPPERCASE)
    # (in lib/yarpl/Yarpl.g)
    def uppercase!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )


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
      # trace_out( __method__, 24 )


    end

    # lexer rule alphabet! (ALPHABET)
    # (in lib/yarpl/Yarpl.g)
    def alphabet!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )


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
      # trace_out( __method__, 25 )


    end

    # lexer rule alphanumeric! (ALPHANUMERIC)
    # (in lib/yarpl/Yarpl.g)
    def alphanumeric!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )


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
      # trace_out( __method__, 26 )


    end

    # lexer rule rangeintegerliteral! (RANGEINTEGERLITERAL)
    # (in lib/yarpl/Yarpl.g)
    def rangeintegerliteral!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )



      type = RANGEINTEGERLITERAL
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 303:23: DIGITS '..' DIGITS
      digits!


      match( ".." )


      digits!



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 27 )


    end

    # lexer rule integerliteral! (INTEGERLITERAL)
    # (in lib/yarpl/Yarpl.g)
    def integerliteral!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )



      type = INTEGERLITERAL
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 306:22: DIGITS
      digits!



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 28 )


    end

    # lexer rule sign! (SIGN)
    # (in lib/yarpl/Yarpl.g)
    def sign!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )


    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 
      if @input.peek(1) == 0x2b || @input.peek(1) == 0x2d
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse

      end



    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 29 )


    end

    # lexer rule lparen! (LPAREN)
    # (in lib/yarpl/Yarpl.g)
    def lparen!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )



      type = LPAREN
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 316:19: '('
      match( 0x28 )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 30 )


    end

    # lexer rule rparen! (RPAREN)
    # (in lib/yarpl/Yarpl.g)
    def rparen!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )



      type = RPAREN
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 317:19: ')'
      match( 0x29 )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 31 )


    end

    # lexer rule lbrace! (LBRACE)
    # (in lib/yarpl/Yarpl.g)
    def lbrace!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )



      type = LBRACE
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 318:19: '{'
      match( 0x7b )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 32 )


    end

    # lexer rule rbrace! (RBRACE)
    # (in lib/yarpl/Yarpl.g)
    def rbrace!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )



      type = RBRACE
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 319:19: '}'
      match( 0x7d )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 33 )


    end

    # lexer rule lbrack! (LBRACK)
    # (in lib/yarpl/Yarpl.g)
    def lbrack!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )



      type = LBRACK
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 320:19: '['
      match( 0x5b )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 34 )


    end

    # lexer rule rbrack! (RBRACK)
    # (in lib/yarpl/Yarpl.g)
    def rbrack!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )



      type = RBRACK
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 321:19: ']'
      match( 0x5d )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 35 )


    end

    # lexer rule semi! (SEMI)
    # (in lib/yarpl/Yarpl.g)
    def semi!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )



      type = SEMI
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 322:19: ';'
      match( 0x3b )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 36 )


    end

    # lexer rule comma! (COMMA)
    # (in lib/yarpl/Yarpl.g)
    def comma!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )



      type = COMMA
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 323:19: ','
      match( 0x2c )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 37 )


    end

    # lexer rule dot! (DOT)
    # (in lib/yarpl/Yarpl.g)
    def dot!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 38 )



      type = DOT
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 324:19: '.'
      match( 0x2e )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 38 )


    end

    # lexer rule assign! (ASSIGN)
    # (in lib/yarpl/Yarpl.g)
    def assign!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 39 )



      type = ASSIGN
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 328:19: '='
      match( 0x3d )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 39 )


    end

    # lexer rule gt! (GT)
    # (in lib/yarpl/Yarpl.g)
    def gt!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 40 )



      type = GT
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 329:19: '>'
      match( 0x3e )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 40 )


    end

    # lexer rule lt! (LT)
    # (in lib/yarpl/Yarpl.g)
    def lt!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 41 )



      type = LT
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 330:19: '<'
      match( 0x3c )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 41 )


    end

    # lexer rule bang! (BANG)
    # (in lib/yarpl/Yarpl.g)
    def bang!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 42 )



      type = BANG
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 331:19: '!'
      match( 0x21 )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 42 )


    end

    # lexer rule question! (QUESTION)
    # (in lib/yarpl/Yarpl.g)
    def question!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 43 )



      type = QUESTION
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 332:19: '?'
      match( 0x3f )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 43 )


    end

    # lexer rule colon! (COLON)
    # (in lib/yarpl/Yarpl.g)
    def colon!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 44 )



      type = COLON
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 333:19: ':'
      match( 0x3a )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 44 )


    end

    # lexer rule equals! (EQUALS)
    # (in lib/yarpl/Yarpl.g)
    def equals!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 45 )



      type = EQUALS
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 334:20: '=='
      match( "==" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 45 )


    end

    # lexer rule lte! (LTE)
    # (in lib/yarpl/Yarpl.g)
    def lte!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 46 )



      type = LTE
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 335:20: '<='
      match( "<=" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 46 )


    end

    # lexer rule gte! (GTE)
    # (in lib/yarpl/Yarpl.g)
    def gte!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 47 )



      type = GTE
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 336:20: '>='
      match( ">=" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 47 )


    end

    # lexer rule not_equals! (NOT_EQUALS)
    # (in lib/yarpl/Yarpl.g)
    def not_equals!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 48 )



      type = NOT_EQUALS
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 337:21: '!='
      match( "!=" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 48 )


    end

    # lexer rule and! (AND)
    # (in lib/yarpl/Yarpl.g)
    def and!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 49 )



      type = AND
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 338:19: '&&'
      match( "&&" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 49 )


    end

    # lexer rule or! (OR)
    # (in lib/yarpl/Yarpl.g)
    def or!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 50 )



      type = OR
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 339:19: '||'
      match( "||" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 50 )


    end

    # lexer rule inc! (INC)
    # (in lib/yarpl/Yarpl.g)
    def inc!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 51 )



      type = INC
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 340:19: '++'
      match( "++" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 51 )


    end

    # lexer rule dec! (DEC)
    # (in lib/yarpl/Yarpl.g)
    def dec!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 52 )



      type = DEC
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 341:19: '--'
      match( "--" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 52 )


    end

    # lexer rule plus! (PLUS)
    # (in lib/yarpl/Yarpl.g)
    def plus!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 53 )



      type = PLUS
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 342:20: '+'
      match( 0x2b )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 53 )


    end

    # lexer rule minus! (MINUS)
    # (in lib/yarpl/Yarpl.g)
    def minus!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 54 )



      type = MINUS
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 343:21: '-'
      match( 0x2d )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 54 )


    end

    # lexer rule times! (TIMES)
    # (in lib/yarpl/Yarpl.g)
    def times!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 55 )



      type = TIMES
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 344:21: '*'
      match( 0x2a )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 55 )


    end

    # lexer rule div! (DIV)
    # (in lib/yarpl/Yarpl.g)
    def div!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 56 )



      type = DIV
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 345:19: '/'
      match( 0x2f )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 56 )


    end

    # lexer rule mod! (MOD)
    # (in lib/yarpl/Yarpl.g)
    def mod!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 57 )



      type = MOD
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 346:19: '%'
      match( 0x25 )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 57 )


    end

    # main rule used to study the input at the current position,
    # and choose the proper lexer rule to call in order to
    # fetch the next token
    #
    # usually, you don't make direct calls to this method,
    # but instead use the next_token method, which will
    # build and emit the actual next token
    def token!
      # at line 1:8: ( T__70 | T__71 | T__72 | T__73 | T__74 | T__75 | T__76 | T__77 | T__78 | T__79 | T__80 | T__81 | WS | COMMENT | LINE_COMMENT | IDENTIFIER | RANGEINTEGERLITERAL | INTEGERLITERAL | LPAREN | RPAREN | LBRACE | RBRACE | LBRACK | RBRACK | SEMI | COMMA | DOT | ASSIGN | GT | LT | BANG | QUESTION | COLON | EQUALS | LTE | GTE | NOT_EQUALS | AND | OR | INC | DEC | PLUS | MINUS | TIMES | DIV | MOD )
      alt_5 = 46
      alt_5 = @dfa5.predict( @input )
      case alt_5
      when 1
        # at line 1:10: T__70
        t__70!


      when 2
        # at line 1:16: T__71
        t__71!


      when 3
        # at line 1:22: T__72
        t__72!


      when 4
        # at line 1:28: T__73
        t__73!


      when 5
        # at line 1:34: T__74
        t__74!


      when 6
        # at line 1:40: T__75
        t__75!


      when 7
        # at line 1:46: T__76
        t__76!


      when 8
        # at line 1:52: T__77
        t__77!


      when 9
        # at line 1:58: T__78
        t__78!


      when 10
        # at line 1:64: T__79
        t__79!


      when 11
        # at line 1:70: T__80
        t__80!


      when 12
        # at line 1:76: T__81
        t__81!


      when 13
        # at line 1:82: WS
        ws!


      when 14
        # at line 1:85: COMMENT
        comment!


      when 15
        # at line 1:93: LINE_COMMENT
        line_comment!


      when 16
        # at line 1:106: IDENTIFIER
        identifier!


      when 17
        # at line 1:117: RANGEINTEGERLITERAL
        rangeintegerliteral!


      when 18
        # at line 1:137: INTEGERLITERAL
        integerliteral!


      when 19
        # at line 1:152: LPAREN
        lparen!


      when 20
        # at line 1:159: RPAREN
        rparen!


      when 21
        # at line 1:166: LBRACE
        lbrace!


      when 22
        # at line 1:173: RBRACE
        rbrace!


      when 23
        # at line 1:180: LBRACK
        lbrack!


      when 24
        # at line 1:187: RBRACK
        rbrack!


      when 25
        # at line 1:194: SEMI
        semi!


      when 26
        # at line 1:199: COMMA
        comma!


      when 27
        # at line 1:205: DOT
        dot!


      when 28
        # at line 1:209: ASSIGN
        assign!


      when 29
        # at line 1:216: GT
        gt!


      when 30
        # at line 1:219: LT
        lt!


      when 31
        # at line 1:222: BANG
        bang!


      when 32
        # at line 1:227: QUESTION
        question!


      when 33
        # at line 1:236: COLON
        colon!


      when 34
        # at line 1:242: EQUALS
        equals!


      when 35
        # at line 1:249: LTE
        lte!


      when 36
        # at line 1:253: GTE
        gte!


      when 37
        # at line 1:257: NOT_EQUALS
        not_equals!


      when 38
        # at line 1:268: AND
        and!


      when 39
        # at line 1:272: OR
        or!


      when 40
        # at line 1:275: INC
        inc!


      when 41
        # at line 1:279: DEC
        dec!


      when 42
        # at line 1:283: PLUS
        plus!


      when 43
        # at line 1:288: MINUS
        minus!


      when 44
        # at line 1:294: TIMES
        times!


      when 45
        # at line 1:300: DIV
        div!


      when 46
        # at line 1:304: MOD
        mod!


      end
    end


    # - - - - - - - - - - DFA definitions - - - - - - - - - - -
    class DFA5 < ANTLR3::DFA
      EOT = unpack( 1, -1, 9, 14, 1, 12, 1, 48, 1, -1, 1, 49, 1, -1, 1, 
                    50, 9, -1, 1, 55, 1, 57, 1, 59, 1, 61, 4, -1, 1, 63, 
                    1, 65, 1, -1, 7, 14, 1, 74, 2, 14, 5, -1, 1, 50, 14, 
                    -1, 1, 77, 5, 14, 1, 83, 1, 84, 1, -1, 1, 14, 1, 86, 
                    1, -1, 5, 14, 2, -1, 1, 14, 1, -1, 1, 93, 1, 95, 4, 
                    14, 1, -1, 1, 14, 1, -1, 1, 101, 4, 14, 1, -1, 1, 106, 
                    1, 107, 2, 14, 2, -1, 2, 14, 1, 112, 1, 113, 2, -1 )
      EOF = unpack( 114, -1 )
      MIN = unpack( 1, 9, 1, 110, 1, 108, 1, 111, 1, 110, 1, 111, 1, 101, 
                    1, 114, 1, 101, 1, 97, 1, 46, 1, 42, 1, -1, 1, 47, 1, 
                    -1, 1, 46, 9, -1, 4, 61, 4, -1, 1, 43, 1, 45, 1, -1, 
                    1, 100, 1, 97, 1, 110, 1, 109, 1, 105, 1, 100, 1, 119, 
                    1, 36, 1, 102, 1, 114, 5, -1, 1, 46, 1, 48, 13, -1, 
                    1, 36, 2, 115, 1, 97, 1, 116, 1, 101, 2, 36, 1, -1, 
                    1, 101, 1, 36, 1, -1, 1, 115, 1, 116, 2, 105, 1, 103, 
                    2, -1, 1, 114, 1, -1, 2, 36, 1, 110, 1, 97, 2, 101, 
                    1, -1, 1, 97, 1, -1, 1, 36, 1, 108, 1, 114, 1, 110, 
                    1, 105, 1, -1, 2, 36, 1, 99, 1, 110, 2, -1, 1, 101, 
                    1, 116, 2, 36, 2, -1 )
      MAX = unpack( 1, 125, 1, 110, 2, 111, 1, 110, 1, 111, 1, 101, 1, 114, 
                    1, 101, 1, 97, 1, 46, 1, 47, 1, -1, 1, 47, 1, -1, 1, 
                    95, 9, -1, 4, 61, 4, -1, 1, 43, 1, 45, 1, -1, 1, 100, 
                    1, 97, 1, 110, 1, 109, 1, 116, 1, 100, 1, 119, 1, 122, 
                    1, 102, 1, 114, 5, -1, 2, 95, 13, -1, 1, 122, 2, 115, 
                    1, 97, 1, 116, 1, 101, 2, 122, 1, -1, 1, 101, 1, 122, 
                    1, -1, 1, 115, 1, 116, 2, 105, 1, 103, 2, -1, 1, 114, 
                    1, -1, 2, 122, 1, 110, 1, 97, 2, 101, 1, -1, 1, 97, 
                    1, -1, 1, 122, 1, 108, 1, 114, 1, 110, 1, 105, 1, -1, 
                    2, 122, 1, 99, 1, 110, 2, -1, 1, 101, 1, 116, 2, 122, 
                    2, -1 )
      ACCEPT = unpack( 12, -1, 1, 13, 1, -1, 1, 16, 1, -1, 1, 19, 1, 20, 
                       1, 21, 1, 22, 1, 23, 1, 24, 1, 25, 1, 26, 1, 27, 
                       4, -1, 1, 32, 1, 33, 1, 38, 1, 39, 2, -1, 1, 46, 
                       10, -1, 1, 14, 1, 15, 1, 45, 1, 44, 1, 18, 2, -1, 
                       1, 17, 1, 34, 1, 28, 1, 36, 1, 29, 1, 35, 1, 30, 
                       1, 37, 1, 31, 1, 40, 1, 42, 1, 41, 1, 43, 8, -1, 
                       1, 10, 2, -1, 1, 1, 5, -1, 1, 8, 1, 9, 1, -1, 1, 
                       12, 6, -1, 1, 2, 1, -1, 1, 3, 5, -1, 1, 5, 4, -1, 
                       1, 6, 1, 7, 4, -1, 1, 11, 1, 4 )
      SPECIAL = unpack( 114, -1 )
      TRANSITION = [
        unpack( 2, 12, 2, -1, 1, 12, 18, -1, 1, 10, 1, 28, 2, -1, 1, 14, 
                1, 35, 1, 31, 1, -1, 1, 16, 1, 17, 1, 13, 1, 33, 1, 23, 
                1, 34, 1, 24, 1, 11, 10, 15, 1, 30, 1, 22, 1, 27, 1, 25, 
                1, 26, 1, 29, 1, -1, 26, 14, 1, 20, 1, -1, 1, 21, 1, -1, 
                1, 14, 1, -1, 1, 1, 1, 14, 1, 2, 1, 3, 4, 14, 1, 4, 3, 14, 
                1, 5, 1, 6, 1, 7, 2, 14, 1, 8, 3, 14, 1, 9, 4, 14, 1, 18, 
                1, 32, 1, 19 ),
        unpack( 1, 36 ),
        unpack( 1, 37, 2, -1, 1, 38 ),
        unpack( 1, 39 ),
        unpack( 1, 40 ),
        unpack( 1, 41 ),
        unpack( 1, 42 ),
        unpack( 1, 43 ),
        unpack( 1, 44 ),
        unpack( 1, 45 ),
        unpack( 1, 46 ),
        unpack( 1, 46, 4, -1, 1, 47 ),
        unpack(  ),
        unpack( 1, 46 ),
        unpack(  ),
        unpack( 1, 53, 1, -1, 10, 51, 37, -1, 1, 52 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 54 ),
        unpack( 1, 56 ),
        unpack( 1, 58 ),
        unpack( 1, 60 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 62 ),
        unpack( 1, 64 ),
        unpack(  ),
        unpack( 1, 66 ),
        unpack( 1, 67 ),
        unpack( 1, 68 ),
        unpack( 1, 69 ),
        unpack( 1, 70, 10, -1, 1, 71 ),
        unpack( 1, 72 ),
        unpack( 1, 73 ),
        unpack( 1, 14, 11, -1, 10, 14, 7, -1, 26, 14, 4, -1, 1, 14, 1, 
                 -1, 26, 14 ),
        unpack( 1, 75 ),
        unpack( 1, 76 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 53, 1, -1, 10, 51, 37, -1, 1, 52 ),
        unpack( 10, 51, 37, -1, 1, 52 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 14, 11, -1, 10, 14, 7, -1, 26, 14, 4, -1, 1, 14, 1, 
                 -1, 26, 14 ),
        unpack( 1, 78 ),
        unpack( 1, 79 ),
        unpack( 1, 80 ),
        unpack( 1, 81 ),
        unpack( 1, 82 ),
        unpack( 1, 14, 11, -1, 10, 14, 7, -1, 26, 14, 4, -1, 1, 14, 1, 
                 -1, 26, 14 ),
        unpack( 1, 14, 11, -1, 10, 14, 7, -1, 26, 14, 4, -1, 1, 14, 1, 
                 -1, 26, 14 ),
        unpack(  ),
        unpack( 1, 85 ),
        unpack( 1, 14, 11, -1, 10, 14, 7, -1, 26, 14, 4, -1, 1, 14, 1, 
                 -1, 26, 14 ),
        unpack(  ),
        unpack( 1, 87 ),
        unpack( 1, 88 ),
        unpack( 1, 89 ),
        unpack( 1, 90 ),
        unpack( 1, 91 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 92 ),
        unpack(  ),
        unpack( 1, 14, 11, -1, 10, 14, 7, -1, 26, 14, 4, -1, 1, 14, 1, 
                 -1, 26, 14 ),
        unpack( 1, 14, 11, -1, 10, 14, 7, -1, 26, 14, 4, -1, 1, 14, 1, 
                 -1, 17, 14, 1, 94, 8, 14 ),
        unpack( 1, 96 ),
        unpack( 1, 97 ),
        unpack( 1, 98 ),
        unpack( 1, 99 ),
        unpack(  ),
        unpack( 1, 100 ),
        unpack(  ),
        unpack( 1, 14, 11, -1, 10, 14, 7, -1, 26, 14, 4, -1, 1, 14, 1, 
                 -1, 26, 14 ),
        unpack( 1, 102 ),
        unpack( 1, 103 ),
        unpack( 1, 104 ),
        unpack( 1, 105 ),
        unpack(  ),
        unpack( 1, 14, 11, -1, 10, 14, 7, -1, 26, 14, 4, -1, 1, 14, 1, 
                 -1, 26, 14 ),
        unpack( 1, 14, 11, -1, 10, 14, 7, -1, 26, 14, 4, -1, 1, 14, 1, 
                 -1, 26, 14 ),
        unpack( 1, 108 ),
        unpack( 1, 109 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 110 ),
        unpack( 1, 111 ),
        unpack( 1, 14, 11, -1, 10, 14, 7, -1, 26, 14, 4, -1, 1, 14, 1, 
                 -1, 26, 14 ),
        unpack( 1, 14, 11, -1, 10, 14, 7, -1, 26, 14, 4, -1, 1, 14, 1, 
                 -1, 26, 14 ),
        unpack(  ),
        unpack(  )
      ].freeze

      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end

      @decision = 5


      def description
        <<-'__dfa_description__'.strip!
          1:1: Tokens : ( T__70 | T__71 | T__72 | T__73 | T__74 | T__75 | T__76 | T__77 | T__78 | T__79 | T__80 | T__81 | WS | COMMENT | LINE_COMMENT | IDENTIFIER | RANGEINTEGERLITERAL | INTEGERLITERAL | LPAREN | RPAREN | LBRACE | RBRACE | LBRACK | RBRACK | SEMI | COMMA | DOT | ASSIGN | GT | LT | BANG | QUESTION | COLON | EQUALS | LTE | GTE | NOT_EQUALS | AND | OR | INC | DEC | PLUS | MINUS | TIMES | DIV | MOD );
        __dfa_description__
      end

    end


    private

    def initialize_dfas
      super rescue nil
      @dfa5 = DFA5.new( self, 5 )


    end

  end # class Lexer < ANTLR3::Lexer

  at_exit { Lexer.main( ARGV ) } if __FILE__ == $0

end

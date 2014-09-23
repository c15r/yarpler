#!/usr/bin/env ruby
#
# /home/nino/github/yarpler/lib/yarpl/Yarpl.g
# --
# Generated using ANTLR version: 3.5
# Ruby runtime library version: 1.10.0
# Input grammar file: /home/nino/github/yarpler/lib/yarpl/Yarpl.g
# Generated at: 2014-09-23 13:39:04
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
    define_tokens( :EOF => -1, :T__65 => 65, :T__66 => 66, :T__67 => 67, 
                   :T__68 => 68, :T__69 => 69, :T__70 => 70, :T__71 => 71, 
                   :T__72 => 72, :T__73 => 73, :T__74 => 74, :T__75 => 75, 
                   :T__76 => 76, :T__77 => 77, :T__78 => 78, :T__79 => 79, 
                   :T__80 => 80, :T__81 => 81, :T__82 => 82, :T__83 => 83, 
                   :ALPHABET => 4, :ALPHANUMERIC => 5, :AND => 6, :ASSIGN => 7, 
                   :BANG => 8, :CLASS_BODY => 9, :CLASS_BODY_DECLARATION => 10, 
                   :CLASS_DECLARATION => 11, :COLON => 12, :COMMA => 13, 
                   :COMMENT => 14, :DEC => 15, :DECIMALNUMBER => 16, :DIGIT => 17, 
                   :DIGITORUNDERSCORE => 18, :DIGITS => 19, :DIV => 20, 
                   :DOMAIN_BODY => 21, :DOMAIN_BODY_DECLARATION => 22, :DOMAIN_DECLARATION => 23, 
                   :DOT => 24, :EQUALS => 25, :FIELD_DECLARATION => 26, 
                   :GT => 27, :GTE => 28, :IDENTIFIER => 29, :INC => 30, 
                   :INITIAL_BODY => 31, :INITIAL_DECLARATION => 32, :INTEGER => 33, 
                   :LBRACE => 34, :LBRACK => 35, :LINE_COMMENT => 36, :LOWERCASE => 37, 
                   :LPAREN => 38, :LT => 39, :LTE => 40, :MEMBER_DECLARATION => 41, 
                   :MINUS => 42, :MOD => 43, :NONZERODIGIT => 44, :NOT_EQUALS => 45, 
                   :OR => 46, :PLUS => 47, :PROGRAM => 48, :QUESTION => 49, 
                   :RANGEINTEGERLITERAL => 50, :RBRACE => 51, :RBRACK => 52, 
                   :RPAREN => 53, :SEMI => 54, :SIGN => 55, :START => 56, 
                   :TIMES => 57, :TYPE_DECLARATION => 58, :UPPERCASE => 59, 
                   :VARIABLE_DECLARATOR => 60, :VARIABLE_TYPE => 61, :WS => 62, 
                   :YARPL_LETTER => 63, :YARPL_LETTERORDIGIT => 64 )

  end


  class Lexer < ANTLR3::Lexer
    @grammar_home = Yarpl
    include TokenData

    begin
      generated_using( "/home/nino/github/yarpler/lib/yarpl/Yarpl.g", "3.5", "1.10.0" )
    rescue NoMethodError => error
      # ignore
    end

    RULE_NAMES   = [ "T__65", "T__66", "T__67", "T__68", "T__69", "T__70", 
                     "T__71", "T__72", "T__73", "T__74", "T__75", "T__76", 
                     "T__77", "T__78", "T__79", "T__80", "T__81", "T__82", 
                     "T__83", "WS", "COMMENT", "LINE_COMMENT", "IDENTIFIER", 
                     "YARPL_LETTER", "YARPL_LETTERORDIGIT", "DIGIT", "DIGITS", 
                     "NONZERODIGIT", "DIGITORUNDERSCORE", "LOWERCASE", "UPPERCASE", 
                     "ALPHABET", "ALPHANUMERIC", "DECIMALNUMBER", "RANGEINTEGERLITERAL", 
                     "SIGN", "LPAREN", "RPAREN", "LBRACE", "RBRACE", "LBRACK", 
                     "RBRACK", "SEMI", "COMMA", "DOT", "ASSIGN", "GT", "LT", 
                     "BANG", "QUESTION", "COLON", "EQUALS", "LTE", "GTE", 
                     "NOT_EQUALS", "AND", "OR", "INC", "DEC", "PLUS", "MINUS", 
                     "TIMES", "DIV", "MOD" ].freeze
    RULE_METHODS = [ :t__65!, :t__66!, :t__67!, :t__68!, :t__69!, :t__70!, 
                     :t__71!, :t__72!, :t__73!, :t__74!, :t__75!, :t__76!, 
                     :t__77!, :t__78!, :t__79!, :t__80!, :t__81!, :t__82!, 
                     :t__83!, :ws!, :comment!, :line_comment!, :identifier!, 
                     :yarpl_letter!, :yarpl_letterordigit!, :digit!, :digits!, 
                     :nonzerodigit!, :digitorunderscore!, :lowercase!, :uppercase!, 
                     :alphabet!, :alphanumeric!, :decimalnumber!, :rangeintegerliteral!, 
                     :sign!, :lparen!, :rparen!, :lbrace!, :rbrace!, :lbrack!, 
                     :rbrack!, :semi!, :comma!, :dot!, :assign!, :gt!, :lt!, 
                     :bang!, :question!, :colon!, :equals!, :lte!, :gte!, 
                     :not_equals!, :and!, :or!, :inc!, :dec!, :plus!, :minus!, 
                     :times!, :div!, :mod! ].freeze

    def initialize( input=nil, options = {} )
      super( input, options )
    end


    # - - - - - - - - - - - lexer rules - - - - - - - - - - - -
    # lexer rule t__65! (T__65)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def t__65!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 1 )



      type = T__65
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

    # lexer rule t__66! (T__66)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def t__66!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 2 )



      type = T__66
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 8:9: 'boolean'
      match( "boolean" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 2 )


    end

    # lexer rule t__67! (T__67)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def t__67!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 3 )



      type = T__67
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 9:9: 'class'
      match( "class" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 3 )


    end

    # lexer rule t__68! (T__68)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def t__68!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 4 )



      type = T__68
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 10:9: 'const'
      match( "const" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 4 )


    end

    # lexer rule t__69! (T__69)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def t__69!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 5 )



      type = T__69
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 11:9: 'datetime'
      match( "datetime" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 5 )


    end

    # lexer rule t__70! (T__70)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def t__70!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 6 )



      type = T__70
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 12:9: 'decimal'
      match( "decimal" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 6 )


    end

    # lexer rule t__71! (T__71)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def t__71!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 7 )



      type = T__71
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 13:9: 'domain'
      match( "domain" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 7 )


    end

    # lexer rule t__72! (T__72)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def t__72!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 8 )



      type = T__72
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 14:9: 'float'
      match( "float" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 8 )


    end

    # lexer rule t__73! (T__73)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def t__73!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 9 )



      type = T__73
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 15:9: 'initial'
      match( "initial" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 9 )


    end

    # lexer rule t__74! (T__74)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def t__74!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )



      type = T__74
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 16:9: 'integer'
      match( "integer" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 10 )


    end

    # lexer rule t__75! (T__75)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def t__75!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )



      type = T__75
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 17:9: 'mod'
      match( "mod" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 11 )


    end

    # lexer rule t__76! (T__76)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def t__76!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )



      type = T__76
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 18:9: 'new'
      match( "new" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 12 )


    end

    # lexer rule t__77! (T__77)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def t__77!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )



      type = T__77
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 19:9: 'nullableboolean'
      match( "nullableboolean" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 13 )


    end

    # lexer rule t__78! (T__78)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def t__78!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )



      type = T__78
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 20:9: 'object'
      match( "object" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 14 )


    end

    # lexer rule t__79! (T__79)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def t__79!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )



      type = T__79
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 21:9: 'or'
      match( "or" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 15 )


    end

    # lexer rule t__80! (T__80)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def t__80!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )



      type = T__80
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 22:9: 'set'
      match( "set" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 16 )


    end

    # lexer rule t__81! (T__81)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def t__81!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )



      type = T__81
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 23:9: 'string'
      match( "string" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 17 )


    end

    # lexer rule t__82! (T__82)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def t__82!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )



      type = T__82
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 24:9: 'time'
      match( "time" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 18 )


    end

    # lexer rule t__83! (T__83)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def t__83!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )



      type = T__83
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 25:9: 'var'
      match( "var" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 19 )


    end

    # lexer rule ws! (WS)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def ws!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )



      type = WS
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 204:6: ( ' ' | '\\t' | '\\r' | '\\n' )
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
      # trace_out( __method__, 20 )


    end

    # lexer rule comment! (COMMENT)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def comment!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )



      type = COMMENT
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 207:11: ( '/*' | ' .*? ' | '*/' )
      # at line 207:11: ( '/*' | ' .*? ' | '*/' )
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
        # at line 207:12: '/*'
        match( "/*" )


      when 2
        # at line 207:19: ' .*? '
        match( " .*? " )


      when 3
        # at line 207:29: '*/'
        match( "*/" )


      end

      # --> action
      skip();
      # <-- action



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 21 )


    end

    # lexer rule line_comment! (LINE_COMMENT)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def line_comment!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )



      type = LINE_COMMENT
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 210:16: '//'
      match( "//" )


      # --> action
      skip();
      # <-- action



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 22 )


    end

    # lexer rule identifier! (IDENTIFIER)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def identifier!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )



      type = IDENTIFIER
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 215:14: YARPL_LETTER ( YARPL_LETTERORDIGIT )*
      yarpl_letter!

      # at line 215:27: ( YARPL_LETTERORDIGIT )*
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
      # trace_out( __method__, 23 )


    end

    # lexer rule yarpl_letter! (YARPL_LETTER)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def yarpl_letter!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )


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
      # trace_out( __method__, 24 )


    end

    # lexer rule yarpl_letterordigit! (YARPL_LETTERORDIGIT)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def yarpl_letterordigit!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )


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
      # trace_out( __method__, 25 )


    end

    # lexer rule digit! (DIGIT)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def digit!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )


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
      # trace_out( __method__, 26 )


    end

    # lexer rule digits! (DIGITS)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def digits!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )


    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 236:10: DIGIT ( ( DIGITORUNDERSCORE )* DIGIT )?
      digit!

      # at line 236:16: ( ( DIGITORUNDERSCORE )* DIGIT )?
      alt_4 = 2
      look_4_0 = @input.peek( 1 )

      if ( look_4_0.between?( 0x30, 0x39 ) || look_4_0 == 0x5f )
        alt_4 = 1
      end
      case alt_4
      when 1
        # at line 236:17: ( DIGITORUNDERSCORE )* DIGIT
        # at line 236:17: ( DIGITORUNDERSCORE )*
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
      # trace_out( __method__, 27 )


    end

    # lexer rule nonzerodigit! (NONZERODIGIT)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def nonzerodigit!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )


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
      # trace_out( __method__, 28 )


    end

    # lexer rule digitorunderscore! (DIGITORUNDERSCORE)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def digitorunderscore!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )


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
      # trace_out( __method__, 29 )


    end

    # lexer rule lowercase! (LOWERCASE)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def lowercase!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )


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
      # trace_out( __method__, 30 )


    end

    # lexer rule uppercase! (UPPERCASE)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def uppercase!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )


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
      # trace_out( __method__, 31 )


    end

    # lexer rule alphabet! (ALPHABET)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def alphabet!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )


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
      # trace_out( __method__, 32 )


    end

    # lexer rule alphanumeric! (ALPHANUMERIC)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def alphanumeric!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )


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
      # trace_out( __method__, 33 )


    end

    # lexer rule decimalnumber! (DECIMALNUMBER)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def decimalnumber!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )


    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 267:16: ( '0' | ( SIGN )? NONZERODIGIT ( ( DIGITS )? ) )
      alt_7 = 2
      look_7_0 = @input.peek( 1 )

      if ( look_7_0 == 0x30 )
        alt_7 = 1
      elsif ( look_7_0 == 0x2b || look_7_0 == 0x2d || look_7_0.between?( 0x31, 0x39 ) )
        alt_7 = 2
      else
        raise NoViableAlternative( "", 7, 0 )

      end
      case alt_7
      when 1
        # at line 267:18: '0'
        match( 0x30 )

      when 2
        # at line 268:6: ( SIGN )? NONZERODIGIT ( ( DIGITS )? )
        # at line 268:6: ( SIGN )?
        alt_5 = 2
        look_5_0 = @input.peek( 1 )

        if ( look_5_0 == 0x2b || look_5_0 == 0x2d )
          alt_5 = 1
        end
        case alt_5
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

        nonzerodigit!

        # at line 268:25: ( ( DIGITS )? )
        # at line 268:26: ( DIGITS )?
        # at line 268:26: ( DIGITS )?
        alt_6 = 2
        look_6_0 = @input.peek( 1 )

        if ( look_6_0.between?( 0x30, 0x39 ) )
          alt_6 = 1
        end
        case alt_6
        when 1
          # at line 268:26: DIGITS
          digits!


        end


      end
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 34 )


    end

    # lexer rule rangeintegerliteral! (RANGEINTEGERLITERAL)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def rangeintegerliteral!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )



      type = RANGEINTEGERLITERAL
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 270:23: DIGITS '..' DIGITS
      digits!


      match( ".." )


      digits!



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 35 )


    end

    # lexer rule sign! (SIGN)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def sign!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )


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
      # trace_out( __method__, 36 )


    end

    # lexer rule lparen! (LPAREN)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def lparen!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )



      type = LPAREN
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 280:19: '('
      match( 0x28 )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 37 )


    end

    # lexer rule rparen! (RPAREN)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def rparen!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 38 )



      type = RPAREN
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 281:19: ')'
      match( 0x29 )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 38 )


    end

    # lexer rule lbrace! (LBRACE)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def lbrace!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 39 )



      type = LBRACE
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 282:19: '{'
      match( 0x7b )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 39 )


    end

    # lexer rule rbrace! (RBRACE)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def rbrace!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 40 )



      type = RBRACE
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 283:19: '}'
      match( 0x7d )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 40 )


    end

    # lexer rule lbrack! (LBRACK)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def lbrack!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 41 )



      type = LBRACK
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 284:19: '['
      match( 0x5b )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 41 )


    end

    # lexer rule rbrack! (RBRACK)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def rbrack!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 42 )



      type = RBRACK
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 285:19: ']'
      match( 0x5d )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 42 )


    end

    # lexer rule semi! (SEMI)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def semi!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 43 )



      type = SEMI
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 286:19: ';'
      match( 0x3b )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 43 )


    end

    # lexer rule comma! (COMMA)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def comma!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 44 )



      type = COMMA
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 287:19: ','
      match( 0x2c )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 44 )


    end

    # lexer rule dot! (DOT)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def dot!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 45 )



      type = DOT
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 288:19: '.'
      match( 0x2e )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 45 )


    end

    # lexer rule assign! (ASSIGN)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def assign!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 46 )



      type = ASSIGN
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 292:19: '='
      match( 0x3d )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 46 )


    end

    # lexer rule gt! (GT)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def gt!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 47 )



      type = GT
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 293:19: '>'
      match( 0x3e )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 47 )


    end

    # lexer rule lt! (LT)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def lt!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 48 )



      type = LT
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 294:19: '<'
      match( 0x3c )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 48 )


    end

    # lexer rule bang! (BANG)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def bang!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 49 )



      type = BANG
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 295:19: '!'
      match( 0x21 )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 49 )


    end

    # lexer rule question! (QUESTION)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def question!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 50 )



      type = QUESTION
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 296:19: '?'
      match( 0x3f )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 50 )


    end

    # lexer rule colon! (COLON)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def colon!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 51 )



      type = COLON
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 297:19: ':'
      match( 0x3a )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 51 )


    end

    # lexer rule equals! (EQUALS)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def equals!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 52 )



      type = EQUALS
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 298:20: '=='
      match( "==" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 52 )


    end

    # lexer rule lte! (LTE)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def lte!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 53 )



      type = LTE
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 299:20: '<='
      match( "<=" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 53 )


    end

    # lexer rule gte! (GTE)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def gte!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 54 )



      type = GTE
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 300:20: '>='
      match( ">=" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 54 )


    end

    # lexer rule not_equals! (NOT_EQUALS)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def not_equals!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 55 )



      type = NOT_EQUALS
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 301:21: '!='
      match( "!=" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 55 )


    end

    # lexer rule and! (AND)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def and!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 56 )



      type = AND
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 302:19: '&&'
      match( "&&" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 56 )


    end

    # lexer rule or! (OR)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def or!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 57 )



      type = OR
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 303:19: '||'
      match( "||" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 57 )


    end

    # lexer rule inc! (INC)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def inc!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 58 )



      type = INC
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 304:19: '++'
      match( "++" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 58 )


    end

    # lexer rule dec! (DEC)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def dec!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 59 )



      type = DEC
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 305:19: '--'
      match( "--" )



      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 59 )


    end

    # lexer rule plus! (PLUS)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def plus!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 60 )



      type = PLUS
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 306:20: '+'
      match( 0x2b )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 60 )


    end

    # lexer rule minus! (MINUS)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def minus!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 61 )



      type = MINUS
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 307:21: '-'
      match( 0x2d )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 61 )


    end

    # lexer rule times! (TIMES)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def times!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 62 )



      type = TIMES
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 308:21: '*'
      match( 0x2a )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 62 )


    end

    # lexer rule div! (DIV)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def div!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 63 )



      type = DIV
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 309:19: '/'
      match( 0x2f )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 63 )


    end

    # lexer rule mod! (MOD)
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    def mod!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 64 )



      type = MOD
      channel = ANTLR3::DEFAULT_CHANNEL
    # - - - - label initialization - - - -


      # - - - - main rule block - - - -
      # at line 310:19: '%'
      match( 0x25 )


      @state.type = type
      @state.channel = channel
    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 64 )


    end

    # main rule used to study the input at the current position,
    # and choose the proper lexer rule to call in order to
    # fetch the next token
    #
    # usually, you don't make direct calls to this method,
    # but instead use the next_token method, which will
    # build and emit the actual next token
    def token!
      # at line 1:8: ( T__65 | T__66 | T__67 | T__68 | T__69 | T__70 | T__71 | T__72 | T__73 | T__74 | T__75 | T__76 | T__77 | T__78 | T__79 | T__80 | T__81 | T__82 | T__83 | WS | COMMENT | LINE_COMMENT | IDENTIFIER | RANGEINTEGERLITERAL | LPAREN | RPAREN | LBRACE | RBRACE | LBRACK | RBRACK | SEMI | COMMA | DOT | ASSIGN | GT | LT | BANG | QUESTION | COLON | EQUALS | LTE | GTE | NOT_EQUALS | AND | OR | INC | DEC | PLUS | MINUS | TIMES | DIV | MOD )
      alt_8 = 52
      alt_8 = @dfa8.predict( @input )
      case alt_8
      when 1
        # at line 1:10: T__65
        t__65!


      when 2
        # at line 1:16: T__66
        t__66!


      when 3
        # at line 1:22: T__67
        t__67!


      when 4
        # at line 1:28: T__68
        t__68!


      when 5
        # at line 1:34: T__69
        t__69!


      when 6
        # at line 1:40: T__70
        t__70!


      when 7
        # at line 1:46: T__71
        t__71!


      when 8
        # at line 1:52: T__72
        t__72!


      when 9
        # at line 1:58: T__73
        t__73!


      when 10
        # at line 1:64: T__74
        t__74!


      when 11
        # at line 1:70: T__75
        t__75!


      when 12
        # at line 1:76: T__76
        t__76!


      when 13
        # at line 1:82: T__77
        t__77!


      when 14
        # at line 1:88: T__78
        t__78!


      when 15
        # at line 1:94: T__79
        t__79!


      when 16
        # at line 1:100: T__80
        t__80!


      when 17
        # at line 1:106: T__81
        t__81!


      when 18
        # at line 1:112: T__82
        t__82!


      when 19
        # at line 1:118: T__83
        t__83!


      when 20
        # at line 1:124: WS
        ws!


      when 21
        # at line 1:127: COMMENT
        comment!


      when 22
        # at line 1:135: LINE_COMMENT
        line_comment!


      when 23
        # at line 1:148: IDENTIFIER
        identifier!


      when 24
        # at line 1:159: RANGEINTEGERLITERAL
        rangeintegerliteral!


      when 25
        # at line 1:179: LPAREN
        lparen!


      when 26
        # at line 1:186: RPAREN
        rparen!


      when 27
        # at line 1:193: LBRACE
        lbrace!


      when 28
        # at line 1:200: RBRACE
        rbrace!


      when 29
        # at line 1:207: LBRACK
        lbrack!


      when 30
        # at line 1:214: RBRACK
        rbrack!


      when 31
        # at line 1:221: SEMI
        semi!


      when 32
        # at line 1:226: COMMA
        comma!


      when 33
        # at line 1:232: DOT
        dot!


      when 34
        # at line 1:236: ASSIGN
        assign!


      when 35
        # at line 1:243: GT
        gt!


      when 36
        # at line 1:246: LT
        lt!


      when 37
        # at line 1:249: BANG
        bang!


      when 38
        # at line 1:254: QUESTION
        question!


      when 39
        # at line 1:263: COLON
        colon!


      when 40
        # at line 1:269: EQUALS
        equals!


      when 41
        # at line 1:276: LTE
        lte!


      when 42
        # at line 1:280: GTE
        gte!


      when 43
        # at line 1:284: NOT_EQUALS
        not_equals!


      when 44
        # at line 1:295: AND
        and!


      when 45
        # at line 1:299: OR
        or!


      when 46
        # at line 1:302: INC
        inc!


      when 47
        # at line 1:306: DEC
        dec!


      when 48
        # at line 1:310: PLUS
        plus!


      when 49
        # at line 1:315: MINUS
        minus!


      when 50
        # at line 1:321: TIMES
        times!


      when 51
        # at line 1:327: DIV
        div!


      when 52
        # at line 1:331: MOD
        mod!


      end
    end


    # - - - - - - - - - - DFA definitions - - - - - - - - - - -
    class DFA8 < ANTLR3::DFA
      EOT = unpack( 1, -1, 12, 17, 1, 15, 1, 59, 1, -1, 1, 60, 11, -1, 1, 
                    62, 1, 64, 1, 66, 1, 68, 4, -1, 1, 70, 1, 72, 1, -1, 
                    13, 17, 1, 87, 4, 17, 16, -1, 1, 92, 9, 17, 1, 102, 
                    1, 103, 2, 17, 1, -1, 1, 106, 2, 17, 1, 109, 1, -1, 
                    9, 17, 2, -1, 2, 17, 1, -1, 1, 17, 1, 122, 1, -1, 1, 
                    17, 1, 124, 1, 125, 3, 17, 1, 129, 5, 17, 1, -1, 1, 
                    17, 2, -1, 2, 17, 1, 138, 1, -1, 3, 17, 1, 142, 1, 143, 
                    1, 144, 1, 17, 1, 146, 1, -1, 1, 147, 1, 148, 1, 17, 
                    3, -1, 1, 150, 3, -1, 1, 17, 1, -1, 6, 17, 1, 158, 1, 
                    -1 )
      EOF = unpack( 159, -1 )
      MIN = unpack( 1, 9, 1, 110, 1, 111, 1, 108, 1, 97, 1, 108, 1, 110, 
                    1, 111, 1, 101, 1, 98, 1, 101, 1, 105, 1, 97, 1, 46, 
                    1, 42, 1, -1, 1, 47, 11, -1, 4, 61, 4, -1, 1, 43, 1, 
                    45, 1, -1, 1, 100, 1, 111, 1, 97, 1, 110, 1, 116, 1, 
                    99, 1, 109, 1, 111, 1, 105, 1, 100, 1, 119, 1, 108, 
                    1, 106, 1, 36, 1, 116, 1, 114, 1, 109, 1, 114, 16, -1, 
                    1, 36, 1, 108, 2, 115, 1, 101, 1, 105, 2, 97, 1, 116, 
                    1, 101, 2, 36, 1, 108, 1, 101, 1, -1, 1, 36, 1, 105, 
                    1, 101, 1, 36, 1, -1, 1, 101, 1, 115, 2, 116, 1, 109, 
                    1, 105, 1, 116, 1, 105, 1, 103, 2, -1, 1, 97, 1, 99, 
                    1, -1, 1, 110, 1, 36, 1, -1, 1, 97, 2, 36, 1, 105, 1, 
                    97, 1, 110, 1, 36, 1, 97, 1, 101, 1, 98, 1, 116, 1, 
                    103, 1, -1, 1, 110, 2, -1, 1, 109, 1, 108, 1, 36, 1, 
                    -1, 1, 108, 1, 114, 1, 108, 3, 36, 1, 101, 1, 36, 1, 
                    -1, 2, 36, 1, 101, 3, -1, 1, 36, 3, -1, 1, 98, 1, -1, 
                    2, 111, 1, 108, 1, 101, 1, 97, 1, 110, 1, 36, 1, -1 )
      MAX = unpack( 1, 125, 1, 110, 3, 111, 1, 108, 1, 110, 1, 111, 1, 117, 
                    1, 114, 1, 116, 1, 105, 1, 97, 1, 46, 1, 47, 1, -1, 
                    1, 47, 11, -1, 4, 61, 4, -1, 1, 43, 1, 45, 1, -1, 1, 
                    100, 1, 111, 1, 97, 1, 110, 1, 116, 1, 99, 1, 109, 1, 
                    111, 1, 116, 1, 100, 1, 119, 1, 108, 1, 106, 1, 122, 
                    1, 116, 1, 114, 1, 109, 1, 114, 16, -1, 1, 122, 1, 108, 
                    2, 115, 1, 101, 1, 105, 2, 97, 1, 116, 1, 101, 2, 122, 
                    1, 108, 1, 101, 1, -1, 1, 122, 1, 105, 1, 101, 1, 122, 
                    1, -1, 1, 101, 1, 115, 2, 116, 1, 109, 1, 105, 1, 116, 
                    1, 105, 1, 103, 2, -1, 1, 97, 1, 99, 1, -1, 1, 110, 
                    1, 122, 1, -1, 1, 97, 2, 122, 1, 105, 1, 97, 1, 110, 
                    1, 122, 1, 97, 1, 101, 1, 98, 1, 116, 1, 103, 1, -1, 
                    1, 110, 2, -1, 1, 109, 1, 108, 1, 122, 1, -1, 1, 108, 
                    1, 114, 1, 108, 3, 122, 1, 101, 1, 122, 1, -1, 2, 122, 
                    1, 101, 3, -1, 1, 122, 3, -1, 1, 98, 1, -1, 2, 111, 
                    1, 108, 1, 101, 1, 97, 1, 110, 1, 122, 1, -1 )
      ACCEPT = unpack( 15, -1, 1, 20, 1, -1, 1, 23, 1, 24, 1, 25, 1, 26, 
                       1, 27, 1, 28, 1, 29, 1, 30, 1, 31, 1, 32, 1, 33, 
                       4, -1, 1, 38, 1, 39, 1, 44, 1, 45, 2, -1, 1, 52, 
                       18, -1, 1, 21, 1, 22, 1, 51, 1, 50, 1, 40, 1, 34, 
                       1, 42, 1, 35, 1, 41, 1, 36, 1, 43, 1, 37, 1, 46, 
                       1, 48, 1, 47, 1, 49, 14, -1, 1, 15, 4, -1, 1, 1, 
                       9, -1, 1, 11, 1, 12, 2, -1, 1, 16, 2, -1, 1, 19, 
                       12, -1, 1, 18, 1, -1, 1, 3, 1, 4, 3, -1, 1, 8, 8, 
                       -1, 1, 7, 3, -1, 1, 14, 1, 17, 1, 2, 1, -1, 1, 6, 
                       1, 9, 1, 10, 1, -1, 1, 5, 7, -1, 1, 13 )
      SPECIAL = unpack( 159, -1 )
      TRANSITION = [
        unpack( 2, 15, 2, -1, 1, 15, 18, -1, 1, 13, 1, 31, 2, -1, 1, 17, 
                1, 38, 1, 34, 1, -1, 1, 19, 1, 20, 1, 16, 1, 36, 1, 26, 
                1, 37, 1, 27, 1, 14, 10, 18, 1, 33, 1, 25, 1, 30, 1, 28, 
                1, 29, 1, 32, 1, -1, 26, 17, 1, 23, 1, -1, 1, 24, 1, -1, 
                1, 17, 1, -1, 1, 1, 1, 2, 1, 3, 1, 4, 1, 17, 1, 5, 2, 17, 
                1, 6, 3, 17, 1, 7, 1, 8, 1, 9, 3, 17, 1, 10, 1, 11, 1, 17, 
                1, 12, 4, 17, 1, 21, 1, 35, 1, 22 ),
        unpack( 1, 39 ),
        unpack( 1, 40 ),
        unpack( 1, 41, 2, -1, 1, 42 ),
        unpack( 1, 43, 3, -1, 1, 44, 9, -1, 1, 45 ),
        unpack( 1, 46 ),
        unpack( 1, 47 ),
        unpack( 1, 48 ),
        unpack( 1, 49, 15, -1, 1, 50 ),
        unpack( 1, 51, 15, -1, 1, 52 ),
        unpack( 1, 53, 14, -1, 1, 54 ),
        unpack( 1, 55 ),
        unpack( 1, 56 ),
        unpack( 1, 57 ),
        unpack( 1, 57, 4, -1, 1, 58 ),
        unpack(  ),
        unpack( 1, 57 ),
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
        unpack( 1, 61 ),
        unpack( 1, 63 ),
        unpack( 1, 65 ),
        unpack( 1, 67 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 69 ),
        unpack( 1, 71 ),
        unpack(  ),
        unpack( 1, 73 ),
        unpack( 1, 74 ),
        unpack( 1, 75 ),
        unpack( 1, 76 ),
        unpack( 1, 77 ),
        unpack( 1, 78 ),
        unpack( 1, 79 ),
        unpack( 1, 80 ),
        unpack( 1, 81, 10, -1, 1, 82 ),
        unpack( 1, 83 ),
        unpack( 1, 84 ),
        unpack( 1, 85 ),
        unpack( 1, 86 ),
        unpack( 1, 17, 11, -1, 10, 17, 7, -1, 26, 17, 4, -1, 1, 17, 1, 
                 -1, 26, 17 ),
        unpack( 1, 88 ),
        unpack( 1, 89 ),
        unpack( 1, 90 ),
        unpack( 1, 91 ),
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
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 17, 11, -1, 10, 17, 7, -1, 26, 17, 4, -1, 1, 17, 1, 
                 -1, 26, 17 ),
        unpack( 1, 93 ),
        unpack( 1, 94 ),
        unpack( 1, 95 ),
        unpack( 1, 96 ),
        unpack( 1, 97 ),
        unpack( 1, 98 ),
        unpack( 1, 99 ),
        unpack( 1, 100 ),
        unpack( 1, 101 ),
        unpack( 1, 17, 11, -1, 10, 17, 7, -1, 26, 17, 4, -1, 1, 17, 1, 
                 -1, 26, 17 ),
        unpack( 1, 17, 11, -1, 10, 17, 7, -1, 26, 17, 4, -1, 1, 17, 1, 
                 -1, 26, 17 ),
        unpack( 1, 104 ),
        unpack( 1, 105 ),
        unpack(  ),
        unpack( 1, 17, 11, -1, 10, 17, 7, -1, 26, 17, 4, -1, 1, 17, 1, 
                 -1, 26, 17 ),
        unpack( 1, 107 ),
        unpack( 1, 108 ),
        unpack( 1, 17, 11, -1, 10, 17, 7, -1, 26, 17, 4, -1, 1, 17, 1, 
                 -1, 26, 17 ),
        unpack(  ),
        unpack( 1, 110 ),
        unpack( 1, 111 ),
        unpack( 1, 112 ),
        unpack( 1, 113 ),
        unpack( 1, 114 ),
        unpack( 1, 115 ),
        unpack( 1, 116 ),
        unpack( 1, 117 ),
        unpack( 1, 118 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 119 ),
        unpack( 1, 120 ),
        unpack(  ),
        unpack( 1, 121 ),
        unpack( 1, 17, 11, -1, 10, 17, 7, -1, 26, 17, 4, -1, 1, 17, 1, 
                 -1, 26, 17 ),
        unpack(  ),
        unpack( 1, 123 ),
        unpack( 1, 17, 11, -1, 10, 17, 7, -1, 26, 17, 4, -1, 1, 17, 1, 
                 -1, 26, 17 ),
        unpack( 1, 17, 11, -1, 10, 17, 7, -1, 26, 17, 4, -1, 1, 17, 1, 
                 -1, 26, 17 ),
        unpack( 1, 126 ),
        unpack( 1, 127 ),
        unpack( 1, 128 ),
        unpack( 1, 17, 11, -1, 10, 17, 7, -1, 26, 17, 4, -1, 1, 17, 1, 
                 -1, 26, 17 ),
        unpack( 1, 130 ),
        unpack( 1, 131 ),
        unpack( 1, 132 ),
        unpack( 1, 133 ),
        unpack( 1, 134 ),
        unpack(  ),
        unpack( 1, 135 ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 136 ),
        unpack( 1, 137 ),
        unpack( 1, 17, 11, -1, 10, 17, 7, -1, 26, 17, 4, -1, 1, 17, 1, 
                 -1, 26, 17 ),
        unpack(  ),
        unpack( 1, 139 ),
        unpack( 1, 140 ),
        unpack( 1, 141 ),
        unpack( 1, 17, 11, -1, 10, 17, 7, -1, 26, 17, 4, -1, 1, 17, 1, 
                 -1, 26, 17 ),
        unpack( 1, 17, 11, -1, 10, 17, 7, -1, 26, 17, 4, -1, 1, 17, 1, 
                 -1, 26, 17 ),
        unpack( 1, 17, 11, -1, 10, 17, 7, -1, 26, 17, 4, -1, 1, 17, 1, 
                 -1, 26, 17 ),
        unpack( 1, 145 ),
        unpack( 1, 17, 11, -1, 10, 17, 7, -1, 26, 17, 4, -1, 1, 17, 1, 
                 -1, 26, 17 ),
        unpack(  ),
        unpack( 1, 17, 11, -1, 10, 17, 7, -1, 26, 17, 4, -1, 1, 17, 1, 
                 -1, 26, 17 ),
        unpack( 1, 17, 11, -1, 10, 17, 7, -1, 26, 17, 4, -1, 1, 17, 1, 
                 -1, 26, 17 ),
        unpack( 1, 149 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 17, 11, -1, 10, 17, 7, -1, 26, 17, 4, -1, 1, 17, 1, 
                 -1, 26, 17 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 151 ),
        unpack(  ),
        unpack( 1, 152 ),
        unpack( 1, 153 ),
        unpack( 1, 154 ),
        unpack( 1, 155 ),
        unpack( 1, 156 ),
        unpack( 1, 157 ),
        unpack( 1, 17, 11, -1, 10, 17, 7, -1, 26, 17, 4, -1, 1, 17, 1, 
                 -1, 26, 17 ),
        unpack(  )
      ].freeze

      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end

      @decision = 8


      def description
        <<-'__dfa_description__'.strip!
          1:1: Tokens : ( T__65 | T__66 | T__67 | T__68 | T__69 | T__70 | T__71 | T__72 | T__73 | T__74 | T__75 | T__76 | T__77 | T__78 | T__79 | T__80 | T__81 | T__82 | T__83 | WS | COMMENT | LINE_COMMENT | IDENTIFIER | RANGEINTEGERLITERAL | LPAREN | RPAREN | LBRACE | RBRACE | LBRACK | RBRACK | SEMI | COMMA | DOT | ASSIGN | GT | LT | BANG | QUESTION | COLON | EQUALS | LTE | GTE | NOT_EQUALS | AND | OR | INC | DEC | PLUS | MINUS | TIMES | DIV | MOD );
        __dfa_description__
      end

    end


    private

    def initialize_dfas
      super rescue nil
      @dfa8 = DFA8.new( self, 8 )


    end

  end # class Lexer < ANTLR3::Lexer

  at_exit { Lexer.main( ARGV ) } if __FILE__ == $0

end

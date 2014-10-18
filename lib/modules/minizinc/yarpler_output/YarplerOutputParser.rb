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


    # register the proper human-readable name or literal value
    # for each token type
    #
    # this is necessary because anonymous tokens, which are
    # created from literal values in the grammar, do not
    # have descriptive names
    register_names( "ALPHABET", "ALPHANUMERIC", "DIGIT", "DIGITS", "DIGIT_LIST", 
                    "IDENTIFIER", "LETTER", "LETTERORDIGIT", "LOWERCASE", 
                    "OUTPUT", "OUTPUT_LIST", "START", "UNSAT", "UPPERCASE", 
                    "WS", "' '", "', '", "'----------'", "'='", "'=========='", 
                    "'=====UNSATISFIABLE====='", "'{'", "'}'" )


  end


  class Parser < ANTLR3::Parser
    @grammar_home = YarplerOutput
    include ANTLR3::ASTBuilder

    RULE_METHODS = [ :start, :outputlist, :output, :digitlist ].freeze

    include TokenData

    begin
      generated_using( "YarplerOutput.g", "3.5", "1.10.0" )
    rescue NoMethodError => error
      # ignore
    end

    def initialize( input, options = {} )
      super( input, options )
    end
    # - - - - - - - - - - - - Rules - - - - - - - - - - - - -
    StartReturnValue = define_return_scope

    #
    # parser rule start
    #
    # (in YarplerOutput.g)
    # 16:1: start : ( outputlist '----------' ( '==========' )? -> ^( START outputlist ) | '=====UNSATISFIABLE=====' -> ^( START UNSAT ) );
    #
    def start
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 1 )


      return_value = StartReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal2 = nil
      string_literal3 = nil
      string_literal4 = nil
      outputlist1 = nil


      tree_for_string_literal2 = nil
      tree_for_string_literal3 = nil
      tree_for_string_literal4 = nil
      stream_T__24 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__24" )
      stream_T__23 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__23" )
      stream_T__21 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__21" )
      stream_outputlist = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule outputlist" )
      begin
      # at line 17:5: ( outputlist '----------' ( '==========' )? -> ^( START outputlist ) | '=====UNSATISFIABLE=====' -> ^( START UNSAT ) )
      alt_2 = 2
      look_2_0 = @input.peek( 1 )

      if ( look_2_0 == IDENTIFIER || look_2_0 == T__21 )
        alt_2 = 1
      elsif ( look_2_0 == T__24 )
        alt_2 = 2
      else
        raise NoViableAlternative( "", 2, 0 )

      end
      case alt_2
      when 1
        # at line 17:7: outputlist '----------' ( '==========' )?
        @state.following.push( TOKENS_FOLLOWING_outputlist_IN_start_63 )
        outputlist1 = outputlist
        @state.following.pop
        stream_outputlist.add( outputlist1.tree )

        string_literal2 = match( T__21, TOKENS_FOLLOWING_T__21_IN_start_65 )
        stream_T__21.add( string_literal2 )

        # at line 17:31: ( '==========' )?
        alt_1 = 2
        look_1_0 = @input.peek( 1 )

        if ( look_1_0 == T__23 )
          alt_1 = 1
        end
        case alt_1
        when 1
          # at line 17:31: '=========='
          string_literal3 = match( T__23, TOKENS_FOLLOWING_T__23_IN_start_67 )
          stream_T__23.add( string_literal3 )


        end
        # AST Rewrite
        # elements: outputlist
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 
        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 17:45: -> ^( START outputlist )
        # at line 17:48: ^( START outputlist )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( START, "START" ), root_1 )

        @adaptor.add_child( root_1, stream_outputlist.next_tree )

        @adaptor.add_child( root_0, root_1 )




        return_value.tree = root_0



      when 2
        # at line 18:7: '=====UNSATISFIABLE====='
        string_literal4 = match( T__24, TOKENS_FOLLOWING_T__24_IN_start_84 )
        stream_T__24.add( string_literal4 )

        # AST Rewrite
        # elements: 
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 
        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 18:33: -> ^( START UNSAT )
        # at line 18:36: ^( START UNSAT )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( START, "START" ), root_1 )

        @adaptor.add_child( root_1, @adaptor.create_from_type( UNSAT, "UNSAT" ) )

        @adaptor.add_child( root_0, root_1 )




        return_value.tree = root_0



      end
      # - - - - - - - rule clean up - - - - - - - -
      return_value.stop = @input.look( -1 )


      return_value.tree = @adaptor.rule_post_processing( root_0 )
      @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )


      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )


      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 1 )


      end

      return return_value
    end

    OutputlistReturnValue = define_return_scope

    #
    # parser rule outputlist
    #
    # (in YarplerOutput.g)
    # 21:1: outputlist : ( output ' ' )* -> ^( OUTPUT_LIST ( output )* ) ;
    #
    def outputlist
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 2 )


      return_value = OutputlistReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal6 = nil
      output5 = nil


      tree_for_char_literal6 = nil
      stream_T__19 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__19" )
      stream_output = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule output" )
      begin
      # at line 22:7: ( output ' ' )*
      # at line 22:7: ( output ' ' )*
      while true # decision 3
        alt_3 = 2
        look_3_0 = @input.peek( 1 )

        if ( look_3_0 == IDENTIFIER )
          alt_3 = 1

        end
        case alt_3
        when 1
          # at line 22:8: output ' '
          @state.following.push( TOKENS_FOLLOWING_output_IN_outputlist_110 )
          output5 = output
          @state.following.pop
          stream_output.add( output5.tree )

          char_literal6 = match( T__19, TOKENS_FOLLOWING_T__19_IN_outputlist_112 )
          stream_T__19.add( char_literal6 )


        else
          break # out of loop for decision 3
        end
      end # loop for decision 3

      # AST Rewrite
      # elements: output
      # token labels: 
      # rule labels: return_value
      # token list labels: 
      # rule list labels: 
      # wildcard labels: 
      return_value.tree = root_0
      stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

      root_0 = @adaptor.create_flat_list
      # 22:21: -> ^( OUTPUT_LIST ( output )* )
      # at line 22:24: ^( OUTPUT_LIST ( output )* )
      root_1 = @adaptor.create_flat_list
      root_1 = @adaptor.become_root( @adaptor.create_from_type( OUTPUT_LIST, "OUTPUT_LIST" ), root_1 )

      # at line 22:38: ( output )*
      while stream_output.has_next?
        @adaptor.add_child( root_1, stream_output.next_tree )

      end

      stream_output.reset();

      @adaptor.add_child( root_0, root_1 )




      return_value.tree = root_0



      # - - - - - - - rule clean up - - - - - - - -
      return_value.stop = @input.look( -1 )


      return_value.tree = @adaptor.rule_post_processing( root_0 )
      @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )


      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )


      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 2 )


      end

      return return_value
    end

    OutputReturnValue = define_return_scope

    #
    # parser rule output
    #
    # (in YarplerOutput.g)
    # 25:1: output : ( IDENTIFIER '=' DIGITS -> ^( OUTPUT IDENTIFIER DIGITS ) | IDENTIFIER '=' '{' digitlist '}' -> ^( OUTPUT IDENTIFIER digitlist ) );
    #
    def output
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 3 )


      return_value = OutputReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __IDENTIFIER7__ = nil
      char_literal8 = nil
      __DIGITS9__ = nil
      __IDENTIFIER10__ = nil
      char_literal11 = nil
      char_literal12 = nil
      char_literal14 = nil
      digitlist13 = nil


      tree_for_IDENTIFIER7 = nil
      tree_for_char_literal8 = nil
      tree_for_DIGITS9 = nil
      tree_for_IDENTIFIER10 = nil
      tree_for_char_literal11 = nil
      tree_for_char_literal12 = nil
      tree_for_char_literal14 = nil
      stream_T__26 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__26" )
      stream_T__25 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__25" )
      stream_IDENTIFIER = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token IDENTIFIER" )
      stream_T__22 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__22" )
      stream_DIGITS = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token DIGITS" )
      stream_digitlist = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule digitlist" )
      begin
      # at line 26:5: ( IDENTIFIER '=' DIGITS -> ^( OUTPUT IDENTIFIER DIGITS ) | IDENTIFIER '=' '{' digitlist '}' -> ^( OUTPUT IDENTIFIER digitlist ) )
      alt_4 = 2
      look_4_0 = @input.peek( 1 )

      if ( look_4_0 == IDENTIFIER )
        look_4_1 = @input.peek( 2 )

        if ( look_4_1 == T__22 )
          look_4_2 = @input.peek( 3 )

          if ( look_4_2 == DIGITS )
            alt_4 = 1
          elsif ( look_4_2 == T__25 )
            alt_4 = 2
          else
            raise NoViableAlternative( "", 4, 2 )

          end
        else
          raise NoViableAlternative( "", 4, 1 )

        end
      else
        raise NoViableAlternative( "", 4, 0 )

      end
      case alt_4
      when 1
        # at line 26:7: IDENTIFIER '=' DIGITS
        __IDENTIFIER7__ = match( IDENTIFIER, TOKENS_FOLLOWING_IDENTIFIER_IN_output_140 )
        stream_IDENTIFIER.add( __IDENTIFIER7__ )

        char_literal8 = match( T__22, TOKENS_FOLLOWING_T__22_IN_output_142 )
        stream_T__22.add( char_literal8 )

        __DIGITS9__ = match( DIGITS, TOKENS_FOLLOWING_DIGITS_IN_output_144 )
        stream_DIGITS.add( __DIGITS9__ )

        # AST Rewrite
        # elements: DIGITS, IDENTIFIER
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 
        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 26:29: -> ^( OUTPUT IDENTIFIER DIGITS )
        # at line 26:32: ^( OUTPUT IDENTIFIER DIGITS )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( OUTPUT, "OUTPUT" ), root_1 )

        @adaptor.add_child( root_1, stream_IDENTIFIER.next_node )

        @adaptor.add_child( root_1, stream_DIGITS.next_node )

        @adaptor.add_child( root_0, root_1 )




        return_value.tree = root_0



      when 2
        # at line 27:7: IDENTIFIER '=' '{' digitlist '}'
        __IDENTIFIER10__ = match( IDENTIFIER, TOKENS_FOLLOWING_IDENTIFIER_IN_output_162 )
        stream_IDENTIFIER.add( __IDENTIFIER10__ )

        char_literal11 = match( T__22, TOKENS_FOLLOWING_T__22_IN_output_164 )
        stream_T__22.add( char_literal11 )

        char_literal12 = match( T__25, TOKENS_FOLLOWING_T__25_IN_output_166 )
        stream_T__25.add( char_literal12 )

        @state.following.push( TOKENS_FOLLOWING_digitlist_IN_output_168 )
        digitlist13 = digitlist
        @state.following.pop
        stream_digitlist.add( digitlist13.tree )

        char_literal14 = match( T__26, TOKENS_FOLLOWING_T__26_IN_output_170 )
        stream_T__26.add( char_literal14 )

        # AST Rewrite
        # elements: digitlist, IDENTIFIER
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 
        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 27:40: -> ^( OUTPUT IDENTIFIER digitlist )
        # at line 27:43: ^( OUTPUT IDENTIFIER digitlist )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( OUTPUT, "OUTPUT" ), root_1 )

        @adaptor.add_child( root_1, stream_IDENTIFIER.next_node )

        @adaptor.add_child( root_1, stream_digitlist.next_tree )

        @adaptor.add_child( root_0, root_1 )




        return_value.tree = root_0



      end
      # - - - - - - - rule clean up - - - - - - - -
      return_value.stop = @input.look( -1 )


      return_value.tree = @adaptor.rule_post_processing( root_0 )
      @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )


      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )


      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 3 )


      end

      return return_value
    end

    DigitlistReturnValue = define_return_scope

    #
    # parser rule digitlist
    #
    # (in YarplerOutput.g)
    # 30:1: digitlist : DIGITS ( ', ' DIGITS )* -> ( DIGITS )* ;
    #
    def digitlist
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 4 )


      return_value = DigitlistReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __DIGITS15__ = nil
      string_literal16 = nil
      __DIGITS17__ = nil


      tree_for_DIGITS15 = nil
      tree_for_string_literal16 = nil
      tree_for_DIGITS17 = nil
      stream_DIGITS = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token DIGITS" )
      stream_T__20 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__20" )

      begin
      # at line 31:7: DIGITS ( ', ' DIGITS )*
      __DIGITS15__ = match( DIGITS, TOKENS_FOLLOWING_DIGITS_IN_digitlist_197 )
      stream_DIGITS.add( __DIGITS15__ )

      # at line 31:14: ( ', ' DIGITS )*
      while true # decision 5
        alt_5 = 2
        look_5_0 = @input.peek( 1 )

        if ( look_5_0 == T__20 )
          alt_5 = 1

        end
        case alt_5
        when 1
          # at line 31:15: ', ' DIGITS
          string_literal16 = match( T__20, TOKENS_FOLLOWING_T__20_IN_digitlist_200 )
          stream_T__20.add( string_literal16 )

          __DIGITS17__ = match( DIGITS, TOKENS_FOLLOWING_DIGITS_IN_digitlist_202 )
          stream_DIGITS.add( __DIGITS17__ )


        else
          break # out of loop for decision 5
        end
      end # loop for decision 5

      # AST Rewrite
      # elements: DIGITS
      # token labels: 
      # rule labels: return_value
      # token list labels: 
      # rule list labels: 
      # wildcard labels: 
      return_value.tree = root_0
      stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

      root_0 = @adaptor.create_flat_list
      # 31:29: -> ( DIGITS )*
      # at line 31:32: ( DIGITS )*
      while stream_DIGITS.has_next?
        @adaptor.add_child( root_0, stream_DIGITS.next_node )

      end

      stream_DIGITS.reset();




      return_value.tree = root_0



      # - - - - - - - rule clean up - - - - - - - -
      return_value.stop = @input.look( -1 )


      return_value.tree = @adaptor.rule_post_processing( root_0 )
      @adaptor.set_token_boundaries( return_value.tree, return_value.start, return_value.stop )


      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)
        return_value.tree = @adaptor.create_error_node( @input, return_value.start, @input.look(-1), re )


      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 4 )


      end

      return return_value
    end



    TOKENS_FOLLOWING_outputlist_IN_start_63 = Set[ 21 ]
    TOKENS_FOLLOWING_T__21_IN_start_65 = Set[ 1, 23 ]
    TOKENS_FOLLOWING_T__23_IN_start_67 = Set[ 1 ]
    TOKENS_FOLLOWING_T__24_IN_start_84 = Set[ 1 ]
    TOKENS_FOLLOWING_output_IN_outputlist_110 = Set[ 19 ]
    TOKENS_FOLLOWING_T__19_IN_outputlist_112 = Set[ 1, 9 ]
    TOKENS_FOLLOWING_IDENTIFIER_IN_output_140 = Set[ 22 ]
    TOKENS_FOLLOWING_T__22_IN_output_142 = Set[ 7 ]
    TOKENS_FOLLOWING_DIGITS_IN_output_144 = Set[ 1 ]
    TOKENS_FOLLOWING_IDENTIFIER_IN_output_162 = Set[ 22 ]
    TOKENS_FOLLOWING_T__22_IN_output_164 = Set[ 25 ]
    TOKENS_FOLLOWING_T__25_IN_output_166 = Set[ 7 ]
    TOKENS_FOLLOWING_digitlist_IN_output_168 = Set[ 26 ]
    TOKENS_FOLLOWING_T__26_IN_output_170 = Set[ 1 ]
    TOKENS_FOLLOWING_DIGITS_IN_digitlist_197 = Set[ 1, 20 ]
    TOKENS_FOLLOWING_T__20_IN_digitlist_200 = Set[ 7 ]
    TOKENS_FOLLOWING_DIGITS_IN_digitlist_202 = Set[ 1, 20 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0

end

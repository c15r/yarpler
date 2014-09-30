#!/usr/bin/env ruby
#
# lib/yarpler/yarpler_output/YarplerOutput.g
# --
# Generated using ANTLR version: 3.5
# Ruby runtime library version: 1.10.0
# Input grammar file: lib/yarpler/yarpler_output/YarplerOutput.g
# Generated at: 2014-09-30 16:57:31
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
    define_tokens( :EOF => -1, :T__17 => 17, :T__18 => 18, :T__19 => 19, 
                   :ALPHABET => 4, :ALPHANUMERIC => 5, :DIGIT => 6, :DIGITS => 7, 
                   :IDENTIFIER => 8, :LETTER => 9, :LETTERORDIGIT => 10, 
                   :LOWERCASE => 11, :OUTPUT => 12, :OUTPUT_LIST => 13, 
                   :START => 14, :UPPERCASE => 15, :WS => 16 )


    # register the proper human-readable name or literal value
    # for each token type
    #
    # this is necessary because anonymous tokens, which are
    # created from literal values in the grammar, do not
    # have descriptive names
    register_names( "ALPHABET", "ALPHANUMERIC", "DIGIT", "DIGITS", "IDENTIFIER", 
                    "LETTER", "LETTERORDIGIT", "LOWERCASE", "OUTPUT", "OUTPUT_LIST", 
                    "START", "UPPERCASE", "WS", "' '", "'----------'", "'='" )


  end


  class Parser < ANTLR3::Parser
    @grammar_home = YarplerOutput
    include ANTLR3::ASTBuilder

    RULE_METHODS = [ :start, :outputlist, :output ].freeze

    include TokenData

    begin
      generated_using( "lib/yarpler/yarpler_output/YarplerOutput.g", "3.5", "1.10.0" )
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
    # (in lib/yarpler/yarpler_output/YarplerOutput.g)
    # 14:1: start : outputlist '----------' -> ^( START outputlist ) ;
    #
    def start
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 1 )


      return_value = StartReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal2 = nil
      outputlist1 = nil


      tree_for_string_literal2 = nil
      stream_T__18 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__18" )
      stream_outputlist = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule outputlist" )
      begin
      # at line 15:7: outputlist '----------'
      @state.following.push( TOKENS_FOLLOWING_outputlist_IN_start_53 )
      outputlist1 = outputlist
      @state.following.pop
      stream_outputlist.add( outputlist1.tree )

      string_literal2 = match( T__18, TOKENS_FOLLOWING_T__18_IN_start_55 )
      stream_T__18.add( string_literal2 )

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
      # 15:31: -> ^( START outputlist )
      # at line 15:34: ^( START outputlist )
      root_1 = @adaptor.create_flat_list
      root_1 = @adaptor.become_root( @adaptor.create_from_type( START, "START" ), root_1 )

      @adaptor.add_child( root_1, stream_outputlist.next_tree )

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
        # trace_out( __method__, 1 )


      end

      return return_value
    end

    OutputlistReturnValue = define_return_scope

    #
    # parser rule outputlist
    #
    # (in lib/yarpler/yarpler_output/YarplerOutput.g)
    # 18:1: outputlist : ( output ' ' )* -> ^( OUTPUT_LIST ( output )* ) ;
    #
    def outputlist
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 2 )


      return_value = OutputlistReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal4 = nil
      output3 = nil


      tree_for_char_literal4 = nil
      stream_T__17 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__17" )
      stream_output = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule output" )
      begin
      # at line 19:7: ( output ' ' )*
      # at line 19:7: ( output ' ' )*
      while true # decision 1
        alt_1 = 2
        look_1_0 = @input.peek( 1 )

        if ( look_1_0 == IDENTIFIER )
          alt_1 = 1

        end
        case alt_1
        when 1
          # at line 19:8: output ' '
          @state.following.push( TOKENS_FOLLOWING_output_IN_outputlist_101 )
          output3 = output
          @state.following.pop
          stream_output.add( output3.tree )

          char_literal4 = match( T__17, TOKENS_FOLLOWING_T__17_IN_outputlist_103 )
          stream_T__17.add( char_literal4 )


        else
          break # out of loop for decision 1
        end
      end # loop for decision 1

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
      # 19:21: -> ^( OUTPUT_LIST ( output )* )
      # at line 19:24: ^( OUTPUT_LIST ( output )* )
      root_1 = @adaptor.create_flat_list
      root_1 = @adaptor.become_root( @adaptor.create_from_type( OUTPUT_LIST, "OUTPUT_LIST" ), root_1 )

      # at line 19:38: ( output )*
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
    # (in lib/yarpler/yarpler_output/YarplerOutput.g)
    # 22:1: output : IDENTIFIER '=' DIGITS -> ^( OUTPUT IDENTIFIER DIGITS ) ;
    #
    def output
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 3 )


      return_value = OutputReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __IDENTIFIER5__ = nil
      char_literal6 = nil
      __DIGITS7__ = nil


      tree_for_IDENTIFIER5 = nil
      tree_for_char_literal6 = nil
      tree_for_DIGITS7 = nil
      stream_T__19 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__19" )
      stream_IDENTIFIER = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token IDENTIFIER" )
      stream_DIGITS = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token DIGITS" )

      begin
      # at line 23:7: IDENTIFIER '=' DIGITS
      __IDENTIFIER5__ = match( IDENTIFIER, TOKENS_FOLLOWING_IDENTIFIER_IN_output_131 )
      stream_IDENTIFIER.add( __IDENTIFIER5__ )

      char_literal6 = match( T__19, TOKENS_FOLLOWING_T__19_IN_output_133 )
      stream_T__19.add( char_literal6 )

      __DIGITS7__ = match( DIGITS, TOKENS_FOLLOWING_DIGITS_IN_output_135 )
      stream_DIGITS.add( __DIGITS7__ )

      # AST Rewrite
      # elements: IDENTIFIER, DIGITS
      # token labels: 
      # rule labels: return_value
      # token list labels: 
      # rule list labels: 
      # wildcard labels: 
      return_value.tree = root_0
      stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

      root_0 = @adaptor.create_flat_list
      # 23:29: -> ^( OUTPUT IDENTIFIER DIGITS )
      # at line 23:32: ^( OUTPUT IDENTIFIER DIGITS )
      root_1 = @adaptor.create_flat_list
      root_1 = @adaptor.become_root( @adaptor.create_from_type( OUTPUT, "OUTPUT" ), root_1 )

      @adaptor.add_child( root_1, stream_IDENTIFIER.next_node )

      @adaptor.add_child( root_1, stream_DIGITS.next_node )

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
        # trace_out( __method__, 3 )


      end

      return return_value
    end



    TOKENS_FOLLOWING_outputlist_IN_start_53 = Set[ 18 ]
    TOKENS_FOLLOWING_T__18_IN_start_55 = Set[ 1 ]
    TOKENS_FOLLOWING_output_IN_outputlist_101 = Set[ 17 ]
    TOKENS_FOLLOWING_T__17_IN_outputlist_103 = Set[ 1, 8 ]
    TOKENS_FOLLOWING_IDENTIFIER_IN_output_131 = Set[ 19 ]
    TOKENS_FOLLOWING_T__19_IN_output_133 = Set[ 7 ]
    TOKENS_FOLLOWING_DIGITS_IN_output_135 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0

end

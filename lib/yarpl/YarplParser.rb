#!/usr/bin/env ruby
#
# lib/yarpl/Yarpl.g
# --
# Generated using ANTLR version: 3.5
# Ruby runtime library version: 1.10.0
# Input grammar file: lib/yarpl/Yarpl.g
# Generated at: 2014-09-26 14:51:22
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
    define_tokens( :EOF => -1, :T__64 => 64, :T__65 => 65, :T__66 => 66, 
                   :T__67 => 67, :T__68 => 68, :T__69 => 69, :T__70 => 70, 
                   :T__71 => 71, :T__72 => 72, :T__73 => 73, :T__74 => 74, 
                   :ALPHABET => 4, :ALPHANUMERIC => 5, :AND => 6, :ASSIGN => 7, 
                   :ATTRIBUTE => 8, :BANG => 9, :CLASS_DECLARATION => 10, 
                   :COLON => 11, :COMMA => 12, :COMMENT => 13, :CONSTANT => 14, 
                   :DEC => 15, :DIGIT => 16, :DIGITORUNDERSCORE => 17, :DIGITS => 18, 
                   :DIV => 19, :DOMAIN_DECLARATION => 20, :DOT => 21, :EQUALS => 22, 
                   :FIELD_DECLARATION => 23, :GT => 24, :GTE => 25, :IDENTIFIER => 26, 
                   :INC => 27, :INITIAL_DECLARATION => 28, :INTEGER => 29, 
                   :INTEGERLITERAL => 30, :LBRACE => 31, :LBRACK => 32, 
                   :LINE_COMMENT => 33, :LOWERCASE => 34, :LPAREN => 35, 
                   :LT => 36, :LTE => 37, :MEMBER_DECLARATION => 38, :MINUS => 39, 
                   :MOD => 40, :NONZERODIGIT => 41, :NOT_EQUALS => 42, :OR => 43, 
                   :PLUS => 44, :QUESTION => 45, :RANGEINTEGERLITERAL => 46, 
                   :RBRACE => 47, :RBRACK => 48, :REFERENCE => 49, :RPAREN => 50, 
                   :SEMI => 51, :SET => 52, :SIGN => 53, :START => 54, :TIMES => 55, 
                   :TYPE_DECLARATION => 56, :UPPERCASE => 57, :VARIABLE => 58, 
                   :VARIABLE_DECLARATION => 59, :VARIABLE_DECLARATOR => 60, 
                   :WS => 61, :YARPL_LETTER => 62, :YARPL_LETTERORDIGIT => 63 )


    # register the proper human-readable name or literal value
    # for each token type
    #
    # this is necessary because anonymous tokens, which are
    # created from literal values in the grammar, do not
    # have descriptive names
    register_names( "ALPHABET", "ALPHANUMERIC", "AND", "ASSIGN", "ATTRIBUTE", 
                    "BANG", "CLASS_DECLARATION", "COLON", "COMMA", "COMMENT", 
                    "CONSTANT", "DEC", "DIGIT", "DIGITORUNDERSCORE", "DIGITS", 
                    "DIV", "DOMAIN_DECLARATION", "DOT", "EQUALS", "FIELD_DECLARATION", 
                    "GT", "GTE", "IDENTIFIER", "INC", "INITIAL_DECLARATION", 
                    "INTEGER", "INTEGERLITERAL", "LBRACE", "LBRACK", "LINE_COMMENT", 
                    "LOWERCASE", "LPAREN", "LT", "LTE", "MEMBER_DECLARATION", 
                    "MINUS", "MOD", "NONZERODIGIT", "NOT_EQUALS", "OR", 
                    "PLUS", "QUESTION", "RANGEINTEGERLITERAL", "RBRACE", 
                    "RBRACK", "REFERENCE", "RPAREN", "SEMI", "SET", "SIGN", 
                    "START", "TIMES", "TYPE_DECLARATION", "UPPERCASE", "VARIABLE", 
                    "VARIABLE_DECLARATION", "VARIABLE_DECLARATOR", "WS", 
                    "YARPL_LETTER", "YARPL_LETTERORDIGIT", "'and'", "'class'", 
                    "'const'", "'domain'", "'initial'", "'integer'", "'mod'", 
                    "'new'", "'or'", "'reference'", "'var'" )


  end


  class Parser < ANTLR3::Parser
    @grammar_home = Yarpl
    include ANTLR3::ASTBuilder

    RULE_METHODS = [ :start, :program, :domainDeclaration, :domainBody, 
                     :domainBodyDeclaration, :initialDeclaration, :initialBody, 
                     :initialBodyDeclaration, :typeDeclaration, :classDeclaration, 
                     :classBody, :classBodyDeclaration, :memberDeclaration, 
                     :fieldDeclaration, :variableDeclarators, :variableDeclarator, 
                     :variableDeclaratorId, :variableInitializer, :localVariableDeclaration, 
                     :statement, :expression, :relationalExpression, :addingExpression, 
                     :multiplyingExpression, :signExpression, :primeExpression, 
                     :expressionList, :declaration, :set, :setDeclaration, 
                     :primary, :creator, :createdName, :classCreatorRest, 
                     :arguments, :argumentList, :argument, :literal, :type, 
                     :structType, :primitiveType, :variableType ].freeze

    include TokenData

    begin
      generated_using( "lib/yarpl/Yarpl.g", "3.5", "1.10.0" )
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
    # (in lib/yarpl/Yarpl.g)
    # 26:1: start : ( program )* -> ^( START ( program )* ) ;
    #
    def start
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 1 )


      return_value = StartReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      program1 = nil


      stream_program = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule program" )
      begin
      # at line 27:7: ( program )*
      # at line 27:7: ( program )*
      while true # decision 1
        alt_1 = 2
        look_1_0 = @input.peek( 1 )

        if ( look_1_0.between?( T__67, T__68 ) )
          alt_1 = 1

        end
        case alt_1
        when 1
          # at line 27:7: program
          @state.following.push( TOKENS_FOLLOWING_program_IN_start_113 )
          program1 = program
          @state.following.pop
          stream_program.add( program1.tree )


        else
          break # out of loop for decision 1
        end
      end # loop for decision 1

      # AST Rewrite
      # elements: program
      # token labels: 
      # rule labels: return_value
      # token list labels: 
      # rule list labels: 
      # wildcard labels: 
      return_value.tree = root_0
      stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

      root_0 = @adaptor.create_flat_list
      # 27:16: -> ^( START ( program )* )
      # at line 27:19: ^( START ( program )* )
      root_1 = @adaptor.create_flat_list
      root_1 = @adaptor.become_root( @adaptor.create_from_type( START, "START" ), root_1 )

      # at line 27:27: ( program )*
      while stream_program.has_next?
        @adaptor.add_child( root_1, stream_program.next_tree )

      end

      stream_program.reset();

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

    ProgramReturnValue = define_return_scope

    #
    # parser rule program
    #
    # (in lib/yarpl/Yarpl.g)
    # 30:1: program : ( domainDeclaration -> domainDeclaration | initialDeclaration -> initialDeclaration );
    #
    def program
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 2 )


      return_value = ProgramReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      domainDeclaration2 = nil
      initialDeclaration3 = nil


      stream_domainDeclaration = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule domainDeclaration" )
      stream_initialDeclaration = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule initialDeclaration" )
      begin
      # at line 31:5: ( domainDeclaration -> domainDeclaration | initialDeclaration -> initialDeclaration )
      alt_2 = 2
      look_2_0 = @input.peek( 1 )

      if ( look_2_0 == T__67 )
        alt_2 = 1
      elsif ( look_2_0 == T__68 )
        alt_2 = 2
      else
        raise NoViableAlternative( "", 2, 0 )

      end
      case alt_2
      when 1
        # at line 31:7: domainDeclaration
        @state.following.push( TOKENS_FOLLOWING_domainDeclaration_IN_program_160 )
        domainDeclaration2 = domainDeclaration
        @state.following.pop
        stream_domainDeclaration.add( domainDeclaration2.tree )

        # AST Rewrite
        # elements: domainDeclaration
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 
        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 31:25: -> domainDeclaration
        @adaptor.add_child( root_0, stream_domainDeclaration.next_tree )




        return_value.tree = root_0



      when 2
        # at line 32:7: initialDeclaration
        @state.following.push( TOKENS_FOLLOWING_initialDeclaration_IN_program_172 )
        initialDeclaration3 = initialDeclaration
        @state.following.pop
        stream_initialDeclaration.add( initialDeclaration3.tree )

        # AST Rewrite
        # elements: initialDeclaration
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 
        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 32:26: -> initialDeclaration
        @adaptor.add_child( root_0, stream_initialDeclaration.next_tree )




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
        # trace_out( __method__, 2 )


      end

      return return_value
    end

    DomainDeclarationReturnValue = define_return_scope

    #
    # parser rule domainDeclaration
    #
    # (in lib/yarpl/Yarpl.g)
    # 35:1: domainDeclaration : 'domain' domainBody -> ^( DOMAIN_DECLARATION domainBody ) ;
    #
    def domainDeclaration
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 3 )


      return_value = DomainDeclarationReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal4 = nil
      domainBody5 = nil


      tree_for_string_literal4 = nil
      stream_T__67 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__67" )
      stream_domainBody = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule domainBody" )
      begin
      # at line 36:7: 'domain' domainBody
      string_literal4 = match( T__67, TOKENS_FOLLOWING_T__67_IN_domainDeclaration_190 )
      stream_T__67.add( string_literal4 )

      @state.following.push( TOKENS_FOLLOWING_domainBody_IN_domainDeclaration_192 )
      domainBody5 = domainBody
      @state.following.pop
      stream_domainBody.add( domainBody5.tree )

      # AST Rewrite
      # elements: domainBody
      # token labels: 
      # rule labels: return_value
      # token list labels: 
      # rule list labels: 
      # wildcard labels: 
      return_value.tree = root_0
      stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

      root_0 = @adaptor.create_flat_list
      # 36:27: -> ^( DOMAIN_DECLARATION domainBody )
      # at line 36:30: ^( DOMAIN_DECLARATION domainBody )
      root_1 = @adaptor.create_flat_list
      root_1 = @adaptor.become_root( @adaptor.create_from_type( DOMAIN_DECLARATION, "DOMAIN_DECLARATION" ), root_1 )

      @adaptor.add_child( root_1, stream_domainBody.next_tree )

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

    DomainBodyReturnValue = define_return_scope

    #
    # parser rule domainBody
    #
    # (in lib/yarpl/Yarpl.g)
    # 39:1: domainBody : '{' ( domainBodyDeclaration )* '}' -> ( domainBodyDeclaration )* ;
    #
    def domainBody
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 4 )


      return_value = DomainBodyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal6 = nil
      char_literal8 = nil
      domainBodyDeclaration7 = nil


      tree_for_char_literal6 = nil
      tree_for_char_literal8 = nil
      stream_RBRACE = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token RBRACE" )
      stream_LBRACE = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token LBRACE" )
      stream_domainBodyDeclaration = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule domainBodyDeclaration" )
      begin
      # at line 40:7: '{' ( domainBodyDeclaration )* '}'
      char_literal6 = match( LBRACE, TOKENS_FOLLOWING_LBRACE_IN_domainBody_217 )
      stream_LBRACE.add( char_literal6 )

      # at line 40:11: ( domainBodyDeclaration )*
      while true # decision 3
        alt_3 = 2
        look_3_0 = @input.peek( 1 )

        if ( look_3_0 == T__65 )
          alt_3 = 1

        end
        case alt_3
        when 1
          # at line 40:11: domainBodyDeclaration
          @state.following.push( TOKENS_FOLLOWING_domainBodyDeclaration_IN_domainBody_219 )
          domainBodyDeclaration7 = domainBodyDeclaration
          @state.following.pop
          stream_domainBodyDeclaration.add( domainBodyDeclaration7.tree )


        else
          break # out of loop for decision 3
        end
      end # loop for decision 3

      char_literal8 = match( RBRACE, TOKENS_FOLLOWING_RBRACE_IN_domainBody_222 )
      stream_RBRACE.add( char_literal8 )

      # AST Rewrite
      # elements: domainBodyDeclaration
      # token labels: 
      # rule labels: return_value
      # token list labels: 
      # rule list labels: 
      # wildcard labels: 
      return_value.tree = root_0
      stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

      root_0 = @adaptor.create_flat_list
      # 40:38: -> ( domainBodyDeclaration )*
      # at line 40:41: ( domainBodyDeclaration )*
      while stream_domainBodyDeclaration.has_next?
        @adaptor.add_child( root_0, stream_domainBodyDeclaration.next_tree )

      end

      stream_domainBodyDeclaration.reset();




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

    DomainBodyDeclarationReturnValue = define_return_scope

    #
    # parser rule domainBodyDeclaration
    #
    # (in lib/yarpl/Yarpl.g)
    # 43:1: domainBodyDeclaration : typeDeclaration -> typeDeclaration ;
    #
    def domainBodyDeclaration
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 5 )


      return_value = DomainBodyDeclarationReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      typeDeclaration9 = nil


      stream_typeDeclaration = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule typeDeclaration" )
      begin
      # at line 44:7: typeDeclaration
      @state.following.push( TOKENS_FOLLOWING_typeDeclaration_IN_domainBodyDeclaration_244 )
      typeDeclaration9 = typeDeclaration
      @state.following.pop
      stream_typeDeclaration.add( typeDeclaration9.tree )

      # AST Rewrite
      # elements: typeDeclaration
      # token labels: 
      # rule labels: return_value
      # token list labels: 
      # rule list labels: 
      # wildcard labels: 
      return_value.tree = root_0
      stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

      root_0 = @adaptor.create_flat_list
      # 44:23: -> typeDeclaration
      @adaptor.add_child( root_0, stream_typeDeclaration.next_tree )




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
        # trace_out( __method__, 5 )


      end

      return return_value
    end

    InitialDeclarationReturnValue = define_return_scope

    #
    # parser rule initialDeclaration
    #
    # (in lib/yarpl/Yarpl.g)
    # 47:1: initialDeclaration : 'initial' initialBody -> ^( INITIAL_DECLARATION initialBody ) ;
    #
    def initialDeclaration
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 6 )


      return_value = InitialDeclarationReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal10 = nil
      initialBody11 = nil


      tree_for_string_literal10 = nil
      stream_T__68 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__68" )
      stream_initialBody = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule initialBody" )
      begin
      # at line 48:7: 'initial' initialBody
      string_literal10 = match( T__68, TOKENS_FOLLOWING_T__68_IN_initialDeclaration_262 )
      stream_T__68.add( string_literal10 )

      @state.following.push( TOKENS_FOLLOWING_initialBody_IN_initialDeclaration_264 )
      initialBody11 = initialBody
      @state.following.pop
      stream_initialBody.add( initialBody11.tree )

      # AST Rewrite
      # elements: initialBody
      # token labels: 
      # rule labels: return_value
      # token list labels: 
      # rule list labels: 
      # wildcard labels: 
      return_value.tree = root_0
      stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

      root_0 = @adaptor.create_flat_list
      # 48:30: -> ^( INITIAL_DECLARATION initialBody )
      # at line 48:33: ^( INITIAL_DECLARATION initialBody )
      root_1 = @adaptor.create_flat_list
      root_1 = @adaptor.become_root( @adaptor.create_from_type( INITIAL_DECLARATION, "INITIAL_DECLARATION" ), root_1 )

      @adaptor.add_child( root_1, stream_initialBody.next_tree )

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
        # trace_out( __method__, 6 )


      end

      return return_value
    end

    InitialBodyReturnValue = define_return_scope

    #
    # parser rule initialBody
    #
    # (in lib/yarpl/Yarpl.g)
    # 51:1: initialBody : '{' ( initialBodyDeclaration )* '}' -> ( initialBodyDeclaration )* ;
    #
    def initialBody
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 7 )


      return_value = InitialBodyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal12 = nil
      char_literal14 = nil
      initialBodyDeclaration13 = nil


      tree_for_char_literal12 = nil
      tree_for_char_literal14 = nil
      stream_RBRACE = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token RBRACE" )
      stream_LBRACE = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token LBRACE" )
      stream_initialBodyDeclaration = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule initialBodyDeclaration" )
      begin
      # at line 52:7: '{' ( initialBodyDeclaration )* '}'
      char_literal12 = match( LBRACE, TOKENS_FOLLOWING_LBRACE_IN_initialBody_290 )
      stream_LBRACE.add( char_literal12 )

      # at line 52:11: ( initialBodyDeclaration )*
      while true # decision 4
        alt_4 = 2
        look_4_0 = @input.peek( 1 )

        if ( look_4_0 == IDENTIFIER || look_4_0 == SEMI )
          alt_4 = 1

        end
        case alt_4
        when 1
          # at line 52:11: initialBodyDeclaration
          @state.following.push( TOKENS_FOLLOWING_initialBodyDeclaration_IN_initialBody_292 )
          initialBodyDeclaration13 = initialBodyDeclaration
          @state.following.pop
          stream_initialBodyDeclaration.add( initialBodyDeclaration13.tree )


        else
          break # out of loop for decision 4
        end
      end # loop for decision 4

      char_literal14 = match( RBRACE, TOKENS_FOLLOWING_RBRACE_IN_initialBody_295 )
      stream_RBRACE.add( char_literal14 )

      # AST Rewrite
      # elements: initialBodyDeclaration
      # token labels: 
      # rule labels: return_value
      # token list labels: 
      # rule list labels: 
      # wildcard labels: 
      return_value.tree = root_0
      stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

      root_0 = @adaptor.create_flat_list
      # 52:39: -> ( initialBodyDeclaration )*
      # at line 52:42: ( initialBodyDeclaration )*
      while stream_initialBodyDeclaration.has_next?
        @adaptor.add_child( root_0, stream_initialBodyDeclaration.next_tree )

      end

      stream_initialBodyDeclaration.reset();




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
        # trace_out( __method__, 7 )


      end

      return return_value
    end

    InitialBodyDeclarationReturnValue = define_return_scope

    #
    # parser rule initialBodyDeclaration
    #
    # (in lib/yarpl/Yarpl.g)
    # 55:1: initialBodyDeclaration : statement ;
    #
    def initialBodyDeclaration
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 8 )


      return_value = InitialBodyDeclarationReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      statement15 = nil



      begin
      root_0 = @adaptor.create_flat_list


      # at line 56:7: statement
      @state.following.push( TOKENS_FOLLOWING_statement_IN_initialBodyDeclaration_317 )
      statement15 = statement
      @state.following.pop
      @adaptor.add_child( root_0, statement15.tree )


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
        # trace_out( __method__, 8 )


      end

      return return_value
    end

    TypeDeclarationReturnValue = define_return_scope

    #
    # parser rule typeDeclaration
    #
    # (in lib/yarpl/Yarpl.g)
    # 59:1: typeDeclaration : classDeclaration -> ^( CLASS_DECLARATION classDeclaration ) ;
    #
    def typeDeclaration
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 9 )


      return_value = TypeDeclarationReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      classDeclaration16 = nil


      stream_classDeclaration = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule classDeclaration" )
      begin
      # at line 60:7: classDeclaration
      @state.following.push( TOKENS_FOLLOWING_classDeclaration_IN_typeDeclaration_334 )
      classDeclaration16 = classDeclaration
      @state.following.pop
      stream_classDeclaration.add( classDeclaration16.tree )

      # AST Rewrite
      # elements: classDeclaration
      # token labels: 
      # rule labels: return_value
      # token list labels: 
      # rule list labels: 
      # wildcard labels: 
      return_value.tree = root_0
      stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

      root_0 = @adaptor.create_flat_list
      # 60:24: -> ^( CLASS_DECLARATION classDeclaration )
      # at line 60:27: ^( CLASS_DECLARATION classDeclaration )
      root_1 = @adaptor.create_flat_list
      root_1 = @adaptor.become_root( @adaptor.create_from_type( CLASS_DECLARATION, "CLASS_DECLARATION" ), root_1 )

      @adaptor.add_child( root_1, stream_classDeclaration.next_tree )

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
        # trace_out( __method__, 9 )


      end

      return return_value
    end

    ClassDeclarationReturnValue = define_return_scope

    #
    # parser rule classDeclaration
    #
    # (in lib/yarpl/Yarpl.g)
    # 63:1: classDeclaration : 'class' IDENTIFIER classBody -> ^( IDENTIFIER classBody ) ;
    #
    def classDeclaration
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )


      return_value = ClassDeclarationReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal17 = nil
      __IDENTIFIER18__ = nil
      classBody19 = nil


      tree_for_string_literal17 = nil
      tree_for_IDENTIFIER18 = nil
      stream_T__65 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__65" )
      stream_IDENTIFIER = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token IDENTIFIER" )
      stream_classBody = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule classBody" )
      begin
      # at line 64:7: 'class' IDENTIFIER classBody
      string_literal17 = match( T__65, TOKENS_FOLLOWING_T__65_IN_classDeclaration_359 )
      stream_T__65.add( string_literal17 )

      __IDENTIFIER18__ = match( IDENTIFIER, TOKENS_FOLLOWING_IDENTIFIER_IN_classDeclaration_361 )
      stream_IDENTIFIER.add( __IDENTIFIER18__ )

      @state.following.push( TOKENS_FOLLOWING_classBody_IN_classDeclaration_363 )
      classBody19 = classBody
      @state.following.pop
      stream_classBody.add( classBody19.tree )

      # AST Rewrite
      # elements: IDENTIFIER, classBody
      # token labels: 
      # rule labels: return_value
      # token list labels: 
      # rule list labels: 
      # wildcard labels: 
      return_value.tree = root_0
      stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

      root_0 = @adaptor.create_flat_list
      # 64:36: -> ^( IDENTIFIER classBody )
      # at line 64:39: ^( IDENTIFIER classBody )
      root_1 = @adaptor.create_flat_list
      root_1 = @adaptor.become_root( stream_IDENTIFIER.next_node, root_1 )

      @adaptor.add_child( root_1, stream_classBody.next_tree )

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
        # trace_out( __method__, 10 )


      end

      return return_value
    end

    ClassBodyReturnValue = define_return_scope

    #
    # parser rule classBody
    #
    # (in lib/yarpl/Yarpl.g)
    # 67:1: classBody : '{' ( classBodyDeclaration )* '}' -> ( classBodyDeclaration )* ;
    #
    def classBody
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )


      return_value = ClassBodyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal20 = nil
      char_literal22 = nil
      classBodyDeclaration21 = nil


      tree_for_char_literal20 = nil
      tree_for_char_literal22 = nil
      stream_RBRACE = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token RBRACE" )
      stream_LBRACE = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token LBRACE" )
      stream_classBodyDeclaration = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule classBodyDeclaration" )
      begin
      # at line 68:7: '{' ( classBodyDeclaration )* '}'
      char_literal20 = match( LBRACE, TOKENS_FOLLOWING_LBRACE_IN_classBody_385 )
      stream_LBRACE.add( char_literal20 )

      # at line 68:11: ( classBodyDeclaration )*
      while true # decision 5
        alt_5 = 2
        look_5_0 = @input.peek( 1 )

        if ( look_5_0 == T__66 || look_5_0.between?( T__73, T__74 ) )
          alt_5 = 1

        end
        case alt_5
        when 1
          # at line 68:11: classBodyDeclaration
          @state.following.push( TOKENS_FOLLOWING_classBodyDeclaration_IN_classBody_387 )
          classBodyDeclaration21 = classBodyDeclaration
          @state.following.pop
          stream_classBodyDeclaration.add( classBodyDeclaration21.tree )


        else
          break # out of loop for decision 5
        end
      end # loop for decision 5

      char_literal22 = match( RBRACE, TOKENS_FOLLOWING_RBRACE_IN_classBody_390 )
      stream_RBRACE.add( char_literal22 )

      # AST Rewrite
      # elements: classBodyDeclaration
      # token labels: 
      # rule labels: return_value
      # token list labels: 
      # rule list labels: 
      # wildcard labels: 
      return_value.tree = root_0
      stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

      root_0 = @adaptor.create_flat_list
      # 68:37: -> ( classBodyDeclaration )*
      # at line 68:40: ( classBodyDeclaration )*
      while stream_classBodyDeclaration.has_next?
        @adaptor.add_child( root_0, stream_classBodyDeclaration.next_tree )

      end

      stream_classBodyDeclaration.reset();




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
        # trace_out( __method__, 11 )


      end

      return return_value
    end

    ClassBodyDeclarationReturnValue = define_return_scope

    #
    # parser rule classBodyDeclaration
    #
    # (in lib/yarpl/Yarpl.g)
    # 71:1: classBodyDeclaration : memberDeclaration -> ^( memberDeclaration ) ;
    #
    def classBodyDeclaration
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )


      return_value = ClassBodyDeclarationReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      memberDeclaration23 = nil


      stream_memberDeclaration = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule memberDeclaration" )
      begin
      # at line 72:7: memberDeclaration
      @state.following.push( TOKENS_FOLLOWING_memberDeclaration_IN_classBodyDeclaration_409 )
      memberDeclaration23 = memberDeclaration
      @state.following.pop
      stream_memberDeclaration.add( memberDeclaration23.tree )

      # AST Rewrite
      # elements: memberDeclaration
      # token labels: 
      # rule labels: return_value
      # token list labels: 
      # rule list labels: 
      # wildcard labels: 
      return_value.tree = root_0
      stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

      root_0 = @adaptor.create_flat_list
      # 72:25: -> ^( memberDeclaration )
      # at line 72:28: ^( memberDeclaration )
      root_1 = @adaptor.create_flat_list
      root_1 = @adaptor.become_root( stream_memberDeclaration.next_node, root_1 )

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
        # trace_out( __method__, 12 )


      end

      return return_value
    end

    MemberDeclarationReturnValue = define_return_scope

    #
    # parser rule memberDeclaration
    #
    # (in lib/yarpl/Yarpl.g)
    # 75:1: memberDeclaration : fieldDeclaration -> fieldDeclaration ;
    #
    def memberDeclaration
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )


      return_value = MemberDeclarationReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      fieldDeclaration24 = nil


      stream_fieldDeclaration = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule fieldDeclaration" )
      begin
      # at line 76:7: fieldDeclaration
      @state.following.push( TOKENS_FOLLOWING_fieldDeclaration_IN_memberDeclaration_429 )
      fieldDeclaration24 = fieldDeclaration
      @state.following.pop
      stream_fieldDeclaration.add( fieldDeclaration24.tree )

      # AST Rewrite
      # elements: fieldDeclaration
      # token labels: 
      # rule labels: return_value
      # token list labels: 
      # rule list labels: 
      # wildcard labels: 
      return_value.tree = root_0
      stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

      root_0 = @adaptor.create_flat_list
      # 76:24: -> fieldDeclaration
      @adaptor.add_child( root_0, stream_fieldDeclaration.next_tree )




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
        # trace_out( __method__, 13 )


      end

      return return_value
    end

    FieldDeclarationReturnValue = define_return_scope

    #
    # parser rule fieldDeclaration
    #
    # (in lib/yarpl/Yarpl.g)
    # 79:1: fieldDeclaration : ( variableType type variableDeclaratorId ';' -> ^( FIELD_DECLARATION variableType type variableDeclaratorId ) | 'reference' LPAREN IDENTIFIER RPAREN variableDeclaratorId ';' -> ^( REFERENCE IDENTIFIER variableDeclaratorId ) );
    #
    def fieldDeclaration
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )


      return_value = FieldDeclarationReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal28 = nil
      string_literal29 = nil
      __LPAREN30__ = nil
      __IDENTIFIER31__ = nil
      __RPAREN32__ = nil
      char_literal34 = nil
      variableType25 = nil
      type26 = nil
      variableDeclaratorId27 = nil
      variableDeclaratorId33 = nil


      tree_for_char_literal28 = nil
      tree_for_string_literal29 = nil
      tree_for_LPAREN30 = nil
      tree_for_IDENTIFIER31 = nil
      tree_for_RPAREN32 = nil
      tree_for_char_literal34 = nil
      stream_RPAREN = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token RPAREN" )
      stream_SEMI = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token SEMI" )
      stream_IDENTIFIER = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token IDENTIFIER" )
      stream_T__73 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__73" )
      stream_LPAREN = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token LPAREN" )
      stream_variableType = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule variableType" )
      stream_variableDeclaratorId = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule variableDeclaratorId" )
      stream_type = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule type" )
      begin
      # at line 80:5: ( variableType type variableDeclaratorId ';' -> ^( FIELD_DECLARATION variableType type variableDeclaratorId ) | 'reference' LPAREN IDENTIFIER RPAREN variableDeclaratorId ';' -> ^( REFERENCE IDENTIFIER variableDeclaratorId ) )
      alt_6 = 2
      look_6_0 = @input.peek( 1 )

      if ( look_6_0 == T__66 || look_6_0 == T__74 )
        alt_6 = 1
      elsif ( look_6_0 == T__73 )
        alt_6 = 2
      else
        raise NoViableAlternative( "", 6, 0 )

      end
      case alt_6
      when 1
        # at line 80:7: variableType type variableDeclaratorId ';'
        @state.following.push( TOKENS_FOLLOWING_variableType_IN_fieldDeclaration_451 )
        variableType25 = variableType
        @state.following.pop
        stream_variableType.add( variableType25.tree )

        @state.following.push( TOKENS_FOLLOWING_type_IN_fieldDeclaration_453 )
        type26 = type
        @state.following.pop
        stream_type.add( type26.tree )

        @state.following.push( TOKENS_FOLLOWING_variableDeclaratorId_IN_fieldDeclaration_455 )
        variableDeclaratorId27 = variableDeclaratorId
        @state.following.pop
        stream_variableDeclaratorId.add( variableDeclaratorId27.tree )

        char_literal28 = match( SEMI, TOKENS_FOLLOWING_SEMI_IN_fieldDeclaration_457 )
        stream_SEMI.add( char_literal28 )

        # AST Rewrite
        # elements: variableDeclaratorId, type, variableType
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 
        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 80:50: -> ^( FIELD_DECLARATION variableType type variableDeclaratorId )
        # at line 80:53: ^( FIELD_DECLARATION variableType type variableDeclaratorId )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( FIELD_DECLARATION, "FIELD_DECLARATION" ), root_1 )

        @adaptor.add_child( root_1, stream_variableType.next_tree )

        @adaptor.add_child( root_1, stream_type.next_tree )

        @adaptor.add_child( root_1, stream_variableDeclaratorId.next_tree )

        @adaptor.add_child( root_0, root_1 )




        return_value.tree = root_0



      when 2
        # at line 81:7: 'reference' LPAREN IDENTIFIER RPAREN variableDeclaratorId ';'
        string_literal29 = match( T__73, TOKENS_FOLLOWING_T__73_IN_fieldDeclaration_477 )
        stream_T__73.add( string_literal29 )

        __LPAREN30__ = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_fieldDeclaration_479 )
        stream_LPAREN.add( __LPAREN30__ )

        __IDENTIFIER31__ = match( IDENTIFIER, TOKENS_FOLLOWING_IDENTIFIER_IN_fieldDeclaration_481 )
        stream_IDENTIFIER.add( __IDENTIFIER31__ )

        __RPAREN32__ = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_fieldDeclaration_483 )
        stream_RPAREN.add( __RPAREN32__ )

        @state.following.push( TOKENS_FOLLOWING_variableDeclaratorId_IN_fieldDeclaration_485 )
        variableDeclaratorId33 = variableDeclaratorId
        @state.following.pop
        stream_variableDeclaratorId.add( variableDeclaratorId33.tree )

        char_literal34 = match( SEMI, TOKENS_FOLLOWING_SEMI_IN_fieldDeclaration_487 )
        stream_SEMI.add( char_literal34 )

        # AST Rewrite
        # elements: variableDeclaratorId, IDENTIFIER
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 
        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 81:69: -> ^( REFERENCE IDENTIFIER variableDeclaratorId )
        # at line 81:72: ^( REFERENCE IDENTIFIER variableDeclaratorId )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( REFERENCE, "REFERENCE" ), root_1 )

        @adaptor.add_child( root_1, stream_IDENTIFIER.next_node )

        @adaptor.add_child( root_1, stream_variableDeclaratorId.next_tree )

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
        # trace_out( __method__, 14 )


      end

      return return_value
    end

    VariableDeclaratorsReturnValue = define_return_scope

    #
    # parser rule variableDeclarators
    #
    # (in lib/yarpl/Yarpl.g)
    # 84:1: variableDeclarators : variableDeclarator ( ',' variableDeclarator )* ;
    #
    def variableDeclarators
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )


      return_value = VariableDeclaratorsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal36 = nil
      variableDeclarator35 = nil
      variableDeclarator37 = nil


      tree_for_char_literal36 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 85:7: variableDeclarator ( ',' variableDeclarator )*
      @state.following.push( TOKENS_FOLLOWING_variableDeclarator_IN_variableDeclarators_514 )
      variableDeclarator35 = variableDeclarator
      @state.following.pop
      @adaptor.add_child( root_0, variableDeclarator35.tree )

      # at line 85:26: ( ',' variableDeclarator )*
      while true # decision 7
        alt_7 = 2
        look_7_0 = @input.peek( 1 )

        if ( look_7_0 == COMMA )
          alt_7 = 1

        end
        case alt_7
        when 1
          # at line 85:27: ',' variableDeclarator
          char_literal36 = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_variableDeclarators_517 )
          tree_for_char_literal36 = @adaptor.create_with_payload( char_literal36 )
          @adaptor.add_child( root_0, tree_for_char_literal36 )


          @state.following.push( TOKENS_FOLLOWING_variableDeclarator_IN_variableDeclarators_519 )
          variableDeclarator37 = variableDeclarator
          @state.following.pop
          @adaptor.add_child( root_0, variableDeclarator37.tree )


        else
          break # out of loop for decision 7
        end
      end # loop for decision 7


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
        # trace_out( __method__, 15 )


      end

      return return_value
    end

    VariableDeclaratorReturnValue = define_return_scope

    #
    # parser rule variableDeclarator
    #
    # (in lib/yarpl/Yarpl.g)
    # 88:1: variableDeclarator : variableDeclaratorId '=' variableInitializer -> ^( VARIABLE_DECLARATOR variableDeclaratorId variableInitializer ) ;
    #
    def variableDeclarator
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )


      return_value = VariableDeclaratorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal39 = nil
      variableDeclaratorId38 = nil
      variableInitializer40 = nil


      tree_for_char_literal39 = nil
      stream_ASSIGN = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token ASSIGN" )
      stream_variableDeclaratorId = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule variableDeclaratorId" )
      stream_variableInitializer = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule variableInitializer" )
      begin
      # at line 89:7: variableDeclaratorId '=' variableInitializer
      @state.following.push( TOKENS_FOLLOWING_variableDeclaratorId_IN_variableDeclarator_538 )
      variableDeclaratorId38 = variableDeclaratorId
      @state.following.pop
      stream_variableDeclaratorId.add( variableDeclaratorId38.tree )

      char_literal39 = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_variableDeclarator_540 )
      stream_ASSIGN.add( char_literal39 )

      @state.following.push( TOKENS_FOLLOWING_variableInitializer_IN_variableDeclarator_542 )
      variableInitializer40 = variableInitializer
      @state.following.pop
      stream_variableInitializer.add( variableInitializer40.tree )

      # AST Rewrite
      # elements: variableDeclaratorId, variableInitializer
      # token labels: 
      # rule labels: return_value
      # token list labels: 
      # rule list labels: 
      # wildcard labels: 
      return_value.tree = root_0
      stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

      root_0 = @adaptor.create_flat_list
      # 89:52: -> ^( VARIABLE_DECLARATOR variableDeclaratorId variableInitializer )
      # at line 89:55: ^( VARIABLE_DECLARATOR variableDeclaratorId variableInitializer )
      root_1 = @adaptor.create_flat_list
      root_1 = @adaptor.become_root( @adaptor.create_from_type( VARIABLE_DECLARATOR, "VARIABLE_DECLARATOR" ), root_1 )

      @adaptor.add_child( root_1, stream_variableDeclaratorId.next_tree )

      @adaptor.add_child( root_1, stream_variableInitializer.next_tree )

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
        # trace_out( __method__, 16 )


      end

      return return_value
    end

    VariableDeclaratorIdReturnValue = define_return_scope

    #
    # parser rule variableDeclaratorId
    #
    # (in lib/yarpl/Yarpl.g)
    # 92:1: variableDeclaratorId : IDENTIFIER ;
    #
    def variableDeclaratorId
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )


      return_value = VariableDeclaratorIdReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __IDENTIFIER41__ = nil


      tree_for_IDENTIFIER41 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 93:7: IDENTIFIER
      __IDENTIFIER41__ = match( IDENTIFIER, TOKENS_FOLLOWING_IDENTIFIER_IN_variableDeclaratorId_569 )
      tree_for_IDENTIFIER41 = @adaptor.create_with_payload( __IDENTIFIER41__ )
      @adaptor.add_child( root_0, tree_for_IDENTIFIER41 )



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
        # trace_out( __method__, 17 )


      end

      return return_value
    end

    VariableInitializerReturnValue = define_return_scope

    #
    # parser rule variableInitializer
    #
    # (in lib/yarpl/Yarpl.g)
    # 96:1: variableInitializer : 'new' creator -> creator ;
    #
    def variableInitializer
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )


      return_value = VariableInitializerReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal42 = nil
      creator43 = nil


      tree_for_string_literal42 = nil
      stream_T__71 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__71" )
      stream_creator = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule creator" )
      begin
      # at line 97:7: 'new' creator
      string_literal42 = match( T__71, TOKENS_FOLLOWING_T__71_IN_variableInitializer_586 )
      stream_T__71.add( string_literal42 )

      @state.following.push( TOKENS_FOLLOWING_creator_IN_variableInitializer_588 )
      creator43 = creator
      @state.following.pop
      stream_creator.add( creator43.tree )

      # AST Rewrite
      # elements: creator
      # token labels: 
      # rule labels: return_value
      # token list labels: 
      # rule list labels: 
      # wildcard labels: 
      return_value.tree = root_0
      stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

      root_0 = @adaptor.create_flat_list
      # 97:21: -> creator
      @adaptor.add_child( root_0, stream_creator.next_tree )




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
        # trace_out( __method__, 18 )


      end

      return return_value
    end

    LocalVariableDeclarationReturnValue = define_return_scope

    #
    # parser rule localVariableDeclaration
    #
    # (in lib/yarpl/Yarpl.g)
    # 100:1: localVariableDeclaration : variableDeclarators ';' -> variableDeclarators ;
    #
    def localVariableDeclaration
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )


      return_value = LocalVariableDeclarationReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal45 = nil
      variableDeclarators44 = nil


      tree_for_char_literal45 = nil
      stream_SEMI = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token SEMI" )
      stream_variableDeclarators = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule variableDeclarators" )
      begin
      # at line 101:7: variableDeclarators ';'
      @state.following.push( TOKENS_FOLLOWING_variableDeclarators_IN_localVariableDeclaration_609 )
      variableDeclarators44 = variableDeclarators
      @state.following.pop
      stream_variableDeclarators.add( variableDeclarators44.tree )

      char_literal45 = match( SEMI, TOKENS_FOLLOWING_SEMI_IN_localVariableDeclaration_611 )
      stream_SEMI.add( char_literal45 )

      # AST Rewrite
      # elements: variableDeclarators
      # token labels: 
      # rule labels: return_value
      # token list labels: 
      # rule list labels: 
      # wildcard labels: 
      return_value.tree = root_0
      stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

      root_0 = @adaptor.create_flat_list
      # 101:31: -> variableDeclarators
      @adaptor.add_child( root_0, stream_variableDeclarators.next_tree )




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
        # trace_out( __method__, 19 )


      end

      return return_value
    end

    StatementReturnValue = define_return_scope

    #
    # parser rule statement
    #
    # (in lib/yarpl/Yarpl.g)
    # 105:1: statement : ( localVariableDeclaration | ';' );
    #
    def statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )


      return_value = StatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal47 = nil
      localVariableDeclaration46 = nil


      tree_for_char_literal47 = nil

      begin
      # at line 106:5: ( localVariableDeclaration | ';' )
      alt_8 = 2
      look_8_0 = @input.peek( 1 )

      if ( look_8_0 == IDENTIFIER )
        alt_8 = 1
      elsif ( look_8_0 == SEMI )
        alt_8 = 2
      else
        raise NoViableAlternative( "", 8, 0 )

      end
      case alt_8
      when 1
        root_0 = @adaptor.create_flat_list


        # at line 106:7: localVariableDeclaration
        @state.following.push( TOKENS_FOLLOWING_localVariableDeclaration_IN_statement_633 )
        localVariableDeclaration46 = localVariableDeclaration
        @state.following.pop
        @adaptor.add_child( root_0, localVariableDeclaration46.tree )


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 107:7: ';'
        char_literal47 = match( SEMI, TOKENS_FOLLOWING_SEMI_IN_statement_641 )
        tree_for_char_literal47 = @adaptor.create_with_payload( char_literal47 )
        @adaptor.add_child( root_0, tree_for_char_literal47 )



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
        # trace_out( __method__, 20 )


      end

      return return_value
    end

    ExpressionReturnValue = define_return_scope

    #
    # parser rule expression
    #
    # (in lib/yarpl/Yarpl.g)
    # 111:1: expression : relationalExpression ( ( 'and' | 'or' ) relationalExpression )* ;
    #
    def expression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )


      return_value = ExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set49 = nil
      relationalExpression48 = nil
      relationalExpression50 = nil


      tree_for_set49 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 112:5: relationalExpression ( ( 'and' | 'or' ) relationalExpression )*
      @state.following.push( TOKENS_FOLLOWING_relationalExpression_IN_expression_659 )
      relationalExpression48 = relationalExpression
      @state.following.pop
      @adaptor.add_child( root_0, relationalExpression48.tree )

      # at line 112:26: ( ( 'and' | 'or' ) relationalExpression )*
      while true # decision 9
        alt_9 = 2
        look_9_0 = @input.peek( 1 )

        if ( look_9_0 == T__64 || look_9_0 == T__72 )
          alt_9 = 1

        end
        case alt_9
        when 1
          # at line 112:27: ( 'and' | 'or' ) relationalExpression
          set49 = @input.look

          if @input.peek(1) == T__64 || @input.peek(1) == T__72
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set49 ) )

            @state.error_recovery = false

          else
            mse = MismatchedSet( nil )
            raise mse

          end


          @state.following.push( TOKENS_FOLLOWING_relationalExpression_IN_expression_668 )
          relationalExpression50 = relationalExpression
          @state.following.pop
          @adaptor.add_child( root_0, relationalExpression50.tree )


        else
          break # out of loop for decision 9
        end
      end # loop for decision 9


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
        # trace_out( __method__, 21 )


      end

      return return_value
    end

    RelationalExpressionReturnValue = define_return_scope

    #
    # parser rule relationalExpression
    #
    # (in lib/yarpl/Yarpl.g)
    # 115:1: relationalExpression : addingExpression ( ( EQUALS | NOT_EQUALS | GT | GTE | LT | LTE ) addingExpression )* ;
    #
    def relationalExpression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )


      return_value = RelationalExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set52 = nil
      addingExpression51 = nil
      addingExpression53 = nil


      tree_for_set52 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 116:7: addingExpression ( ( EQUALS | NOT_EQUALS | GT | GTE | LT | LTE ) addingExpression )*
      @state.following.push( TOKENS_FOLLOWING_addingExpression_IN_relationalExpression_687 )
      addingExpression51 = addingExpression
      @state.following.pop
      @adaptor.add_child( root_0, addingExpression51.tree )

      # at line 116:24: ( ( EQUALS | NOT_EQUALS | GT | GTE | LT | LTE ) addingExpression )*
      while true # decision 10
        alt_10 = 2
        look_10_0 = @input.peek( 1 )

        if ( look_10_0 == EQUALS || look_10_0.between?( GT, GTE ) || look_10_0.between?( LT, LTE ) || look_10_0 == NOT_EQUALS )
          alt_10 = 1

        end
        case alt_10
        when 1
          # at line 116:25: ( EQUALS | NOT_EQUALS | GT | GTE | LT | LTE ) addingExpression
          set52 = @input.look

          if @input.peek(1) == EQUALS || @input.peek( 1 ).between?( GT, GTE ) || @input.peek( 1 ).between?( LT, LTE ) || @input.peek(1) == NOT_EQUALS
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set52 ) )

            @state.error_recovery = false

          else
            mse = MismatchedSet( nil )
            raise mse

          end


          @state.following.push( TOKENS_FOLLOWING_addingExpression_IN_relationalExpression_704 )
          addingExpression53 = addingExpression
          @state.following.pop
          @adaptor.add_child( root_0, addingExpression53.tree )


        else
          break # out of loop for decision 10
        end
      end # loop for decision 10


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
        # trace_out( __method__, 22 )


      end

      return return_value
    end

    AddingExpressionReturnValue = define_return_scope

    #
    # parser rule addingExpression
    #
    # (in lib/yarpl/Yarpl.g)
    # 119:1: addingExpression : multiplyingExpression ( ( PLUS | MINUS ) multiplyingExpression )* ;
    #
    def addingExpression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )


      return_value = AddingExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set55 = nil
      multiplyingExpression54 = nil
      multiplyingExpression56 = nil


      tree_for_set55 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 120:7: multiplyingExpression ( ( PLUS | MINUS ) multiplyingExpression )*
      @state.following.push( TOKENS_FOLLOWING_multiplyingExpression_IN_addingExpression_723 )
      multiplyingExpression54 = multiplyingExpression
      @state.following.pop
      @adaptor.add_child( root_0, multiplyingExpression54.tree )

      # at line 120:29: ( ( PLUS | MINUS ) multiplyingExpression )*
      while true # decision 11
        alt_11 = 2
        look_11_0 = @input.peek( 1 )

        if ( look_11_0 == MINUS || look_11_0 == PLUS )
          alt_11 = 1

        end
        case alt_11
        when 1
          # at line 120:30: ( PLUS | MINUS ) multiplyingExpression
          set55 = @input.look

          if @input.peek(1) == MINUS || @input.peek(1) == PLUS
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set55 ) )

            @state.error_recovery = false

          else
            mse = MismatchedSet( nil )
            raise mse

          end


          @state.following.push( TOKENS_FOLLOWING_multiplyingExpression_IN_addingExpression_732 )
          multiplyingExpression56 = multiplyingExpression
          @state.following.pop
          @adaptor.add_child( root_0, multiplyingExpression56.tree )


        else
          break # out of loop for decision 11
        end
      end # loop for decision 11


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
        # trace_out( __method__, 23 )


      end

      return return_value
    end

    MultiplyingExpressionReturnValue = define_return_scope

    #
    # parser rule multiplyingExpression
    #
    # (in lib/yarpl/Yarpl.g)
    # 123:1: multiplyingExpression : signExpression ( ( TIMES | DIV | 'mod' ) signExpression )* ;
    #
    def multiplyingExpression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )


      return_value = MultiplyingExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set58 = nil
      signExpression57 = nil
      signExpression59 = nil


      tree_for_set58 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 124:7: signExpression ( ( TIMES | DIV | 'mod' ) signExpression )*
      @state.following.push( TOKENS_FOLLOWING_signExpression_IN_multiplyingExpression_751 )
      signExpression57 = signExpression
      @state.following.pop
      @adaptor.add_child( root_0, signExpression57.tree )

      # at line 124:22: ( ( TIMES | DIV | 'mod' ) signExpression )*
      while true # decision 12
        alt_12 = 2
        look_12_0 = @input.peek( 1 )

        if ( look_12_0 == DIV || look_12_0 == TIMES || look_12_0 == T__70 )
          alt_12 = 1

        end
        case alt_12
        when 1
          # at line 124:23: ( TIMES | DIV | 'mod' ) signExpression
          set58 = @input.look

          if @input.peek(1) == DIV || @input.peek(1) == TIMES || @input.peek(1) == T__70
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set58 ) )

            @state.error_recovery = false

          else
            mse = MismatchedSet( nil )
            raise mse

          end


          @state.following.push( TOKENS_FOLLOWING_signExpression_IN_multiplyingExpression_762 )
          signExpression59 = signExpression
          @state.following.pop
          @adaptor.add_child( root_0, signExpression59.tree )


        else
          break # out of loop for decision 12
        end
      end # loop for decision 12


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
        # trace_out( __method__, 24 )


      end

      return return_value
    end

    SignExpressionReturnValue = define_return_scope

    #
    # parser rule signExpression
    #
    # (in lib/yarpl/Yarpl.g)
    # 127:1: signExpression : ( PLUS | MINUS )* primeExpression ;
    #
    def signExpression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )


      return_value = SignExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set60 = nil
      primeExpression61 = nil


      tree_for_set60 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 128:7: ( PLUS | MINUS )* primeExpression
      # at line 128:7: ( PLUS | MINUS )*
      while true # decision 13
        alt_13 = 2
        look_13_0 = @input.peek( 1 )

        if ( look_13_0 == MINUS || look_13_0 == PLUS )
          alt_13 = 1

        end
        case alt_13
        when 1
          # at line 
          set60 = @input.look

          if @input.peek(1) == MINUS || @input.peek(1) == PLUS
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set60 ) )

            @state.error_recovery = false

          else
            mse = MismatchedSet( nil )
            raise mse

          end



        else
          break # out of loop for decision 13
        end
      end # loop for decision 13

      @state.following.push( TOKENS_FOLLOWING_primeExpression_IN_signExpression_788 )
      primeExpression61 = primeExpression
      @state.following.pop
      @adaptor.add_child( root_0, primeExpression61.tree )


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
        # trace_out( __method__, 25 )


      end

      return return_value
    end

    PrimeExpressionReturnValue = define_return_scope

    #
    # parser rule primeExpression
    #
    # (in lib/yarpl/Yarpl.g)
    # 131:1: primeExpression : ( primary | LPAREN expression RPAREN );
    #
    def primeExpression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )


      return_value = PrimeExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __LPAREN63__ = nil
      __RPAREN65__ = nil
      primary62 = nil
      expression64 = nil


      tree_for_LPAREN63 = nil
      tree_for_RPAREN65 = nil

      begin
      # at line 132:5: ( primary | LPAREN expression RPAREN )
      alt_14 = 2
      look_14_0 = @input.peek( 1 )

      if ( look_14_0 == IDENTIFIER || look_14_0 == INTEGERLITERAL || look_14_0 == RANGEINTEGERLITERAL )
        alt_14 = 1
      elsif ( look_14_0 == LPAREN )
        alt_14 = 2
      else
        raise NoViableAlternative( "", 14, 0 )

      end
      case alt_14
      when 1
        root_0 = @adaptor.create_flat_list


        # at line 132:7: primary
        @state.following.push( TOKENS_FOLLOWING_primary_IN_primeExpression_805 )
        primary62 = primary
        @state.following.pop
        @adaptor.add_child( root_0, primary62.tree )


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 133:7: LPAREN expression RPAREN
        __LPAREN63__ = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_primeExpression_813 )
        tree_for_LPAREN63 = @adaptor.create_with_payload( __LPAREN63__ )
        @adaptor.add_child( root_0, tree_for_LPAREN63 )


        @state.following.push( TOKENS_FOLLOWING_expression_IN_primeExpression_815 )
        expression64 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression64.tree )

        __RPAREN65__ = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_primeExpression_819 )
        tree_for_RPAREN65 = @adaptor.create_with_payload( __RPAREN65__ )
        @adaptor.add_child( root_0, tree_for_RPAREN65 )



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
        # trace_out( __method__, 26 )


      end

      return return_value
    end

    ExpressionListReturnValue = define_return_scope

    #
    # parser rule expressionList
    #
    # (in lib/yarpl/Yarpl.g)
    # 136:1: expressionList : expression ( ',' expression )* ;
    #
    def expressionList
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )


      return_value = ExpressionListReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal67 = nil
      expression66 = nil
      expression68 = nil


      tree_for_char_literal67 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 137:9: expression ( ',' expression )*
      @state.following.push( TOKENS_FOLLOWING_expression_IN_expressionList_838 )
      expression66 = expression
      @state.following.pop
      @adaptor.add_child( root_0, expression66.tree )

      # at line 137:20: ( ',' expression )*
      while true # decision 15
        alt_15 = 2
        look_15_0 = @input.peek( 1 )

        if ( look_15_0 == COMMA )
          alt_15 = 1

        end
        case alt_15
        when 1
          # at line 137:21: ',' expression
          char_literal67 = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_expressionList_841 )
          tree_for_char_literal67 = @adaptor.create_with_payload( char_literal67 )
          @adaptor.add_child( root_0, tree_for_char_literal67 )


          @state.following.push( TOKENS_FOLLOWING_expression_IN_expressionList_843 )
          expression68 = expression
          @state.following.pop
          @adaptor.add_child( root_0, expression68.tree )


        else
          break # out of loop for decision 15
        end
      end # loop for decision 15


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
        # trace_out( __method__, 27 )


      end

      return return_value
    end

    DeclarationReturnValue = define_return_scope

    #
    # parser rule declaration
    #
    # (in lib/yarpl/Yarpl.g)
    # 140:1: declaration : ( set -> set | primary -> primary );
    #
    def declaration
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )


      return_value = DeclarationReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set69 = nil
      primary70 = nil


      stream_set = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule set" )
      stream_primary = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule primary" )
      begin
      # at line 141:5: ( set -> set | primary -> primary )
      alt_16 = 2
      look_16_0 = @input.peek( 1 )

      if ( look_16_0 == LBRACK )
        alt_16 = 1
      elsif ( look_16_0 == IDENTIFIER || look_16_0 == INTEGERLITERAL || look_16_0 == RANGEINTEGERLITERAL )
        alt_16 = 2
      else
        raise NoViableAlternative( "", 16, 0 )

      end
      case alt_16
      when 1
        # at line 141:7: set
        @state.following.push( TOKENS_FOLLOWING_set_IN_declaration_862 )
        set69 = set
        @state.following.pop
        stream_set.add( set69.tree )

        # AST Rewrite
        # elements: set
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 
        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 141:11: -> set
        @adaptor.add_child( root_0, stream_set.next_tree )




        return_value.tree = root_0



      when 2
        # at line 142:7: primary
        @state.following.push( TOKENS_FOLLOWING_primary_IN_declaration_874 )
        primary70 = primary
        @state.following.pop
        stream_primary.add( primary70.tree )

        # AST Rewrite
        # elements: primary
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 
        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 142:15: -> primary
        @adaptor.add_child( root_0, stream_primary.next_tree )




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
        # trace_out( __method__, 28 )


      end

      return return_value
    end

    SetReturnValue = define_return_scope

    #
    # parser rule set
    #
    # (in lib/yarpl/Yarpl.g)
    # 145:1: set : '[' setDeclaration ']' -> ^( SET setDeclaration ) ;
    #
    def set
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )


      return_value = SetReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal71 = nil
      char_literal73 = nil
      setDeclaration72 = nil


      tree_for_char_literal71 = nil
      tree_for_char_literal73 = nil
      stream_RBRACK = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token RBRACK" )
      stream_LBRACK = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token LBRACK" )
      stream_setDeclaration = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule setDeclaration" )
      begin
      # at line 146:7: '[' setDeclaration ']'
      char_literal71 = match( LBRACK, TOKENS_FOLLOWING_LBRACK_IN_set_895 )
      stream_LBRACK.add( char_literal71 )

      @state.following.push( TOKENS_FOLLOWING_setDeclaration_IN_set_897 )
      setDeclaration72 = setDeclaration
      @state.following.pop
      stream_setDeclaration.add( setDeclaration72.tree )

      char_literal73 = match( RBRACK, TOKENS_FOLLOWING_RBRACK_IN_set_899 )
      stream_RBRACK.add( char_literal73 )

      # AST Rewrite
      # elements: setDeclaration
      # token labels: 
      # rule labels: return_value
      # token list labels: 
      # rule list labels: 
      # wildcard labels: 
      return_value.tree = root_0
      stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

      root_0 = @adaptor.create_flat_list
      # 146:30: -> ^( SET setDeclaration )
      # at line 146:33: ^( SET setDeclaration )
      root_1 = @adaptor.create_flat_list
      root_1 = @adaptor.become_root( @adaptor.create_from_type( SET, "SET" ), root_1 )

      @adaptor.add_child( root_1, stream_setDeclaration.next_tree )

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
        # trace_out( __method__, 29 )


      end

      return return_value
    end

    SetDeclarationReturnValue = define_return_scope

    #
    # parser rule setDeclaration
    #
    # (in lib/yarpl/Yarpl.g)
    # 149:1: setDeclaration : declaration ( COMMA declaration )* -> ( ^( declaration ) )* ;
    #
    def setDeclaration
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )


      return_value = SetDeclarationReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __COMMA75__ = nil
      declaration74 = nil
      declaration76 = nil


      tree_for_COMMA75 = nil
      stream_COMMA = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token COMMA" )
      stream_declaration = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule declaration" )
      begin
      # at line 150:7: declaration ( COMMA declaration )*
      @state.following.push( TOKENS_FOLLOWING_declaration_IN_setDeclaration_924 )
      declaration74 = declaration
      @state.following.pop
      stream_declaration.add( declaration74.tree )

      # at line 150:19: ( COMMA declaration )*
      while true # decision 17
        alt_17 = 2
        look_17_0 = @input.peek( 1 )

        if ( look_17_0 == COMMA )
          alt_17 = 1

        end
        case alt_17
        when 1
          # at line 150:20: COMMA declaration
          __COMMA75__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_setDeclaration_927 )
          stream_COMMA.add( __COMMA75__ )

          @state.following.push( TOKENS_FOLLOWING_declaration_IN_setDeclaration_929 )
          declaration76 = declaration
          @state.following.pop
          stream_declaration.add( declaration76.tree )


        else
          break # out of loop for decision 17
        end
      end # loop for decision 17

      # AST Rewrite
      # elements: declaration
      # token labels: 
      # rule labels: return_value
      # token list labels: 
      # rule list labels: 
      # wildcard labels: 
      return_value.tree = root_0
      stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

      root_0 = @adaptor.create_flat_list
      # 150:40: -> ( ^( declaration ) )*
      # at line 150:43: ( ^( declaration ) )*
      while stream_declaration.has_next?
        # at line 150:43: ^( declaration )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( stream_declaration.next_node, root_1 )

        @adaptor.add_child( root_0, root_1 )

      end

      stream_declaration.reset();




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
        # trace_out( __method__, 30 )


      end

      return return_value
    end

    PrimaryReturnValue = define_return_scope

    #
    # parser rule primary
    #
    # (in lib/yarpl/Yarpl.g)
    # 153:1: primary : literal ;
    #
    def primary
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )


      return_value = PrimaryReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      literal77 = nil



      begin
      root_0 = @adaptor.create_flat_list


      # at line 154:7: literal
      @state.following.push( TOKENS_FOLLOWING_literal_IN_primary_955 )
      literal77 = literal
      @state.following.pop
      @adaptor.add_child( root_0, literal77.tree )


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
        # trace_out( __method__, 31 )


      end

      return return_value
    end

    CreatorReturnValue = define_return_scope

    #
    # parser rule creator
    #
    # (in lib/yarpl/Yarpl.g)
    # 157:1: creator : createdName classCreatorRest -> ^( VARIABLE_DECLARATION createdName classCreatorRest ) ;
    #
    def creator
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )


      return_value = CreatorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      createdName78 = nil
      classCreatorRest79 = nil


      stream_createdName = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule createdName" )
      stream_classCreatorRest = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule classCreatorRest" )
      begin
      # at line 158:7: createdName classCreatorRest
      @state.following.push( TOKENS_FOLLOWING_createdName_IN_creator_969 )
      createdName78 = createdName
      @state.following.pop
      stream_createdName.add( createdName78.tree )

      @state.following.push( TOKENS_FOLLOWING_classCreatorRest_IN_creator_971 )
      classCreatorRest79 = classCreatorRest
      @state.following.pop
      stream_classCreatorRest.add( classCreatorRest79.tree )

      # AST Rewrite
      # elements: createdName, classCreatorRest
      # token labels: 
      # rule labels: return_value
      # token list labels: 
      # rule list labels: 
      # wildcard labels: 
      return_value.tree = root_0
      stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

      root_0 = @adaptor.create_flat_list
      # 158:36: -> ^( VARIABLE_DECLARATION createdName classCreatorRest )
      # at line 158:39: ^( VARIABLE_DECLARATION createdName classCreatorRest )
      root_1 = @adaptor.create_flat_list
      root_1 = @adaptor.become_root( @adaptor.create_from_type( VARIABLE_DECLARATION, "VARIABLE_DECLARATION" ), root_1 )

      @adaptor.add_child( root_1, stream_createdName.next_tree )

      @adaptor.add_child( root_1, stream_classCreatorRest.next_tree )

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
        # trace_out( __method__, 32 )


      end

      return return_value
    end

    CreatedNameReturnValue = define_return_scope

    #
    # parser rule createdName
    #
    # (in lib/yarpl/Yarpl.g)
    # 161:1: createdName : ( structType | primitiveType );
    #
    def createdName
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )


      return_value = CreatedNameReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      structType80 = nil
      primitiveType81 = nil



      begin
      # at line 162:5: ( structType | primitiveType )
      alt_18 = 2
      look_18_0 = @input.peek( 1 )

      if ( look_18_0 == IDENTIFIER )
        alt_18 = 1
      elsif ( look_18_0 == T__69 )
        alt_18 = 2
      else
        raise NoViableAlternative( "", 18, 0 )

      end
      case alt_18
      when 1
        root_0 = @adaptor.create_flat_list


        # at line 162:7: structType
        @state.following.push( TOKENS_FOLLOWING_structType_IN_createdName_999 )
        structType80 = structType
        @state.following.pop
        @adaptor.add_child( root_0, structType80.tree )


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 163:7: primitiveType
        @state.following.push( TOKENS_FOLLOWING_primitiveType_IN_createdName_1007 )
        primitiveType81 = primitiveType
        @state.following.pop
        @adaptor.add_child( root_0, primitiveType81.tree )


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
        # trace_out( __method__, 33 )


      end

      return return_value
    end

    ClassCreatorRestReturnValue = define_return_scope

    #
    # parser rule classCreatorRest
    #
    # (in lib/yarpl/Yarpl.g)
    # 166:1: classCreatorRest : arguments ( classBody )? ;
    #
    def classCreatorRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )


      return_value = ClassCreatorRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      arguments82 = nil
      classBody83 = nil



      begin
      root_0 = @adaptor.create_flat_list


      # at line 167:7: arguments ( classBody )?
      @state.following.push( TOKENS_FOLLOWING_arguments_IN_classCreatorRest_1024 )
      arguments82 = arguments
      @state.following.pop
      @adaptor.add_child( root_0, arguments82.tree )

      # at line 167:17: ( classBody )?
      alt_19 = 2
      look_19_0 = @input.peek( 1 )

      if ( look_19_0 == LBRACE )
        alt_19 = 1
      end
      case alt_19
      when 1
        # at line 167:17: classBody
        @state.following.push( TOKENS_FOLLOWING_classBody_IN_classCreatorRest_1026 )
        classBody83 = classBody
        @state.following.pop
        @adaptor.add_child( root_0, classBody83.tree )


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
        # trace_out( __method__, 34 )


      end

      return return_value
    end

    ArgumentsReturnValue = define_return_scope

    #
    # parser rule arguments
    #
    # (in lib/yarpl/Yarpl.g)
    # 170:1: arguments : '(' ( argumentList )* ')' -> ( argumentList )* ;
    #
    def arguments
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )


      return_value = ArgumentsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal84 = nil
      char_literal86 = nil
      argumentList85 = nil


      tree_for_char_literal84 = nil
      tree_for_char_literal86 = nil
      stream_RPAREN = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token RPAREN" )
      stream_LPAREN = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token LPAREN" )
      stream_argumentList = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule argumentList" )
      begin
      # at line 171:7: '(' ( argumentList )* ')'
      char_literal84 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_arguments_1044 )
      stream_LPAREN.add( char_literal84 )

      # at line 171:11: ( argumentList )*
      while true # decision 20
        alt_20 = 2
        look_20_0 = @input.peek( 1 )

        if ( look_20_0 == IDENTIFIER )
          alt_20 = 1

        end
        case alt_20
        when 1
          # at line 171:11: argumentList
          @state.following.push( TOKENS_FOLLOWING_argumentList_IN_arguments_1046 )
          argumentList85 = argumentList
          @state.following.pop
          stream_argumentList.add( argumentList85.tree )


        else
          break # out of loop for decision 20
        end
      end # loop for decision 20

      char_literal86 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_arguments_1049 )
      stream_RPAREN.add( char_literal86 )

      # AST Rewrite
      # elements: argumentList
      # token labels: 
      # rule labels: return_value
      # token list labels: 
      # rule list labels: 
      # wildcard labels: 
      return_value.tree = root_0
      stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

      root_0 = @adaptor.create_flat_list
      # 171:29: -> ( argumentList )*
      # at line 171:32: ( argumentList )*
      while stream_argumentList.has_next?
        @adaptor.add_child( root_0, stream_argumentList.next_tree )

      end

      stream_argumentList.reset();




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
        # trace_out( __method__, 35 )


      end

      return return_value
    end

    ArgumentListReturnValue = define_return_scope

    #
    # parser rule argumentList
    #
    # (in lib/yarpl/Yarpl.g)
    # 174:1: argumentList : argument ( ',' argument )* ;
    #
    def argumentList
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )


      return_value = ArgumentListReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal88 = nil
      argument87 = nil
      argument89 = nil


      tree_for_char_literal88 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 175:7: argument ( ',' argument )*
      @state.following.push( TOKENS_FOLLOWING_argument_IN_argumentList_1071 )
      argument87 = argument
      @state.following.pop
      @adaptor.add_child( root_0, argument87.tree )

      # at line 175:16: ( ',' argument )*
      while true # decision 21
        alt_21 = 2
        look_21_0 = @input.peek( 1 )

        if ( look_21_0 == COMMA )
          alt_21 = 1

        end
        case alt_21
        when 1
          # at line 175:17: ',' argument
          char_literal88 = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_argumentList_1074 )
          tree_for_char_literal88 = @adaptor.create_with_payload( char_literal88 )
          @adaptor.add_child( root_0, tree_for_char_literal88 )


          @state.following.push( TOKENS_FOLLOWING_argument_IN_argumentList_1076 )
          argument89 = argument
          @state.following.pop
          @adaptor.add_child( root_0, argument89.tree )


        else
          break # out of loop for decision 21
        end
      end # loop for decision 21


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
        # trace_out( __method__, 36 )


      end

      return return_value
    end

    ArgumentReturnValue = define_return_scope

    #
    # parser rule argument
    #
    # (in lib/yarpl/Yarpl.g)
    # 179:1: argument : IDENTIFIER '=' declaration -> ^( ATTRIBUTE IDENTIFIER declaration ) ;
    #
    def argument
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )


      return_value = ArgumentReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __IDENTIFIER90__ = nil
      char_literal91 = nil
      declaration92 = nil


      tree_for_IDENTIFIER90 = nil
      tree_for_char_literal91 = nil
      stream_IDENTIFIER = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token IDENTIFIER" )
      stream_ASSIGN = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token ASSIGN" )
      stream_declaration = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule declaration" )
      begin
      # at line 180:8: IDENTIFIER '=' declaration
      __IDENTIFIER90__ = match( IDENTIFIER, TOKENS_FOLLOWING_IDENTIFIER_IN_argument_1097 )
      stream_IDENTIFIER.add( __IDENTIFIER90__ )

      char_literal91 = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_argument_1099 )
      stream_ASSIGN.add( char_literal91 )

      @state.following.push( TOKENS_FOLLOWING_declaration_IN_argument_1101 )
      declaration92 = declaration
      @state.following.pop
      stream_declaration.add( declaration92.tree )

      # AST Rewrite
      # elements: declaration, IDENTIFIER
      # token labels: 
      # rule labels: return_value
      # token list labels: 
      # rule list labels: 
      # wildcard labels: 
      return_value.tree = root_0
      stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

      root_0 = @adaptor.create_flat_list
      # 180:35: -> ^( ATTRIBUTE IDENTIFIER declaration )
      # at line 180:38: ^( ATTRIBUTE IDENTIFIER declaration )
      root_1 = @adaptor.create_flat_list
      root_1 = @adaptor.become_root( @adaptor.create_from_type( ATTRIBUTE, "ATTRIBUTE" ), root_1 )

      @adaptor.add_child( root_1, stream_IDENTIFIER.next_node )

      @adaptor.add_child( root_1, stream_declaration.next_tree )

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
        # trace_out( __method__, 37 )


      end

      return return_value
    end

    LiteralReturnValue = define_return_scope

    #
    # parser rule literal
    #
    # (in lib/yarpl/Yarpl.g)
    # 184:1: literal : ( RANGEINTEGERLITERAL | INTEGERLITERAL | IDENTIFIER );
    #
    def literal
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 38 )


      return_value = LiteralReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set93 = nil


      tree_for_set93 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 
      set93 = @input.look

      if @input.peek(1) == IDENTIFIER || @input.peek(1) == INTEGERLITERAL || @input.peek(1) == RANGEINTEGERLITERAL
        @input.consume
        @adaptor.add_child( root_0, @adaptor.create_with_payload( set93 ) )

        @state.error_recovery = false

      else
        mse = MismatchedSet( nil )
        raise mse

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
        # trace_out( __method__, 38 )


      end

      return return_value
    end

    TypeReturnValue = define_return_scope

    #
    # parser rule type
    #
    # (in lib/yarpl/Yarpl.g)
    # 190:1: type : ( structType -> ^( structType ) | primitiveType -> ^( primitiveType ) );
    #
    def type
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 39 )


      return_value = TypeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      structType94 = nil
      primitiveType95 = nil


      stream_primitiveType = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule primitiveType" )
      stream_structType = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule structType" )
      begin
      # at line 191:5: ( structType -> ^( structType ) | primitiveType -> ^( primitiveType ) )
      alt_22 = 2
      look_22_0 = @input.peek( 1 )

      if ( look_22_0 == IDENTIFIER )
        alt_22 = 1
      elsif ( look_22_0 == T__69 )
        alt_22 = 2
      else
        raise NoViableAlternative( "", 22, 0 )

      end
      case alt_22
      when 1
        # at line 191:7: structType
        @state.following.push( TOKENS_FOLLOWING_structType_IN_type_1151 )
        structType94 = structType
        @state.following.pop
        stream_structType.add( structType94.tree )

        # AST Rewrite
        # elements: structType
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 
        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 191:18: -> ^( structType )
        # at line 191:21: ^( structType )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( stream_structType.next_node, root_1 )

        @adaptor.add_child( root_0, root_1 )




        return_value.tree = root_0



      when 2
        # at line 192:7: primitiveType
        @state.following.push( TOKENS_FOLLOWING_primitiveType_IN_type_1165 )
        primitiveType95 = primitiveType
        @state.following.pop
        stream_primitiveType.add( primitiveType95.tree )

        # AST Rewrite
        # elements: primitiveType
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 
        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 192:21: -> ^( primitiveType )
        # at line 192:24: ^( primitiveType )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( stream_primitiveType.next_node, root_1 )

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
        # trace_out( __method__, 39 )


      end

      return return_value
    end

    StructTypeReturnValue = define_return_scope

    #
    # parser rule structType
    #
    # (in lib/yarpl/Yarpl.g)
    # 195:1: structType : IDENTIFIER ;
    #
    def structType
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 40 )


      return_value = StructTypeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __IDENTIFIER96__ = nil


      tree_for_IDENTIFIER96 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 196:7: IDENTIFIER
      __IDENTIFIER96__ = match( IDENTIFIER, TOKENS_FOLLOWING_IDENTIFIER_IN_structType_1188 )
      tree_for_IDENTIFIER96 = @adaptor.create_with_payload( __IDENTIFIER96__ )
      @adaptor.add_child( root_0, tree_for_IDENTIFIER96 )



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
        # trace_out( __method__, 40 )


      end

      return return_value
    end

    PrimitiveTypeReturnValue = define_return_scope

    #
    # parser rule primitiveType
    #
    # (in lib/yarpl/Yarpl.g)
    # 199:1: primitiveType : 'integer' -> ^( INTEGER ) ;
    #
    def primitiveType
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 41 )


      return_value = PrimitiveTypeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal97 = nil


      tree_for_string_literal97 = nil
      stream_T__69 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__69" )

      begin
      # at line 200:7: 'integer'
      string_literal97 = match( T__69, TOKENS_FOLLOWING_T__69_IN_primitiveType_1205 )
      stream_T__69.add( string_literal97 )

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
      # 200:17: -> ^( INTEGER )
      # at line 200:20: ^( INTEGER )
      root_1 = @adaptor.create_flat_list
      root_1 = @adaptor.become_root( @adaptor.create_from_type( INTEGER, "INTEGER" ), root_1 )

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
        # trace_out( __method__, 41 )


      end

      return return_value
    end

    VariableTypeReturnValue = define_return_scope

    #
    # parser rule variableType
    #
    # (in lib/yarpl/Yarpl.g)
    # 203:1: variableType : ( 'var' -> ^( VARIABLE ) | 'const' -> ^( CONSTANT ) );
    #
    def variableType
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 42 )


      return_value = VariableTypeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal98 = nil
      string_literal99 = nil


      tree_for_string_literal98 = nil
      tree_for_string_literal99 = nil
      stream_T__66 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__66" )
      stream_T__74 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__74" )

      begin
      # at line 204:5: ( 'var' -> ^( VARIABLE ) | 'const' -> ^( CONSTANT ) )
      alt_23 = 2
      look_23_0 = @input.peek( 1 )

      if ( look_23_0 == T__74 )
        alt_23 = 1
      elsif ( look_23_0 == T__66 )
        alt_23 = 2
      else
        raise NoViableAlternative( "", 23, 0 )

      end
      case alt_23
      when 1
        # at line 204:7: 'var'
        string_literal98 = match( T__74, TOKENS_FOLLOWING_T__74_IN_variableType_1228 )
        stream_T__74.add( string_literal98 )

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
        # 204:13: -> ^( VARIABLE )
        # at line 204:16: ^( VARIABLE )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( VARIABLE, "VARIABLE" ), root_1 )

        @adaptor.add_child( root_0, root_1 )




        return_value.tree = root_0



      when 2
        # at line 205:7: 'const'
        string_literal99 = match( T__66, TOKENS_FOLLOWING_T__66_IN_variableType_1242 )
        stream_T__66.add( string_literal99 )

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
        # 205:15: -> ^( CONSTANT )
        # at line 205:18: ^( CONSTANT )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( CONSTANT, "CONSTANT" ), root_1 )

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
        # trace_out( __method__, 42 )


      end

      return return_value
    end



    TOKENS_FOLLOWING_program_IN_start_113 = Set[ 1, 67, 68 ]
    TOKENS_FOLLOWING_domainDeclaration_IN_program_160 = Set[ 1 ]
    TOKENS_FOLLOWING_initialDeclaration_IN_program_172 = Set[ 1 ]
    TOKENS_FOLLOWING_T__67_IN_domainDeclaration_190 = Set[ 31 ]
    TOKENS_FOLLOWING_domainBody_IN_domainDeclaration_192 = Set[ 1 ]
    TOKENS_FOLLOWING_LBRACE_IN_domainBody_217 = Set[ 47, 65 ]
    TOKENS_FOLLOWING_domainBodyDeclaration_IN_domainBody_219 = Set[ 47, 65 ]
    TOKENS_FOLLOWING_RBRACE_IN_domainBody_222 = Set[ 1 ]
    TOKENS_FOLLOWING_typeDeclaration_IN_domainBodyDeclaration_244 = Set[ 1 ]
    TOKENS_FOLLOWING_T__68_IN_initialDeclaration_262 = Set[ 31 ]
    TOKENS_FOLLOWING_initialBody_IN_initialDeclaration_264 = Set[ 1 ]
    TOKENS_FOLLOWING_LBRACE_IN_initialBody_290 = Set[ 26, 47, 51 ]
    TOKENS_FOLLOWING_initialBodyDeclaration_IN_initialBody_292 = Set[ 26, 47, 51 ]
    TOKENS_FOLLOWING_RBRACE_IN_initialBody_295 = Set[ 1 ]
    TOKENS_FOLLOWING_statement_IN_initialBodyDeclaration_317 = Set[ 1 ]
    TOKENS_FOLLOWING_classDeclaration_IN_typeDeclaration_334 = Set[ 1 ]
    TOKENS_FOLLOWING_T__65_IN_classDeclaration_359 = Set[ 26 ]
    TOKENS_FOLLOWING_IDENTIFIER_IN_classDeclaration_361 = Set[ 31 ]
    TOKENS_FOLLOWING_classBody_IN_classDeclaration_363 = Set[ 1 ]
    TOKENS_FOLLOWING_LBRACE_IN_classBody_385 = Set[ 47, 66, 73, 74 ]
    TOKENS_FOLLOWING_classBodyDeclaration_IN_classBody_387 = Set[ 47, 66, 73, 74 ]
    TOKENS_FOLLOWING_RBRACE_IN_classBody_390 = Set[ 1 ]
    TOKENS_FOLLOWING_memberDeclaration_IN_classBodyDeclaration_409 = Set[ 1 ]
    TOKENS_FOLLOWING_fieldDeclaration_IN_memberDeclaration_429 = Set[ 1 ]
    TOKENS_FOLLOWING_variableType_IN_fieldDeclaration_451 = Set[ 26, 69 ]
    TOKENS_FOLLOWING_type_IN_fieldDeclaration_453 = Set[ 26 ]
    TOKENS_FOLLOWING_variableDeclaratorId_IN_fieldDeclaration_455 = Set[ 51 ]
    TOKENS_FOLLOWING_SEMI_IN_fieldDeclaration_457 = Set[ 1 ]
    TOKENS_FOLLOWING_T__73_IN_fieldDeclaration_477 = Set[ 35 ]
    TOKENS_FOLLOWING_LPAREN_IN_fieldDeclaration_479 = Set[ 26 ]
    TOKENS_FOLLOWING_IDENTIFIER_IN_fieldDeclaration_481 = Set[ 50 ]
    TOKENS_FOLLOWING_RPAREN_IN_fieldDeclaration_483 = Set[ 26 ]
    TOKENS_FOLLOWING_variableDeclaratorId_IN_fieldDeclaration_485 = Set[ 51 ]
    TOKENS_FOLLOWING_SEMI_IN_fieldDeclaration_487 = Set[ 1 ]
    TOKENS_FOLLOWING_variableDeclarator_IN_variableDeclarators_514 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_COMMA_IN_variableDeclarators_517 = Set[ 26 ]
    TOKENS_FOLLOWING_variableDeclarator_IN_variableDeclarators_519 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_variableDeclaratorId_IN_variableDeclarator_538 = Set[ 7 ]
    TOKENS_FOLLOWING_ASSIGN_IN_variableDeclarator_540 = Set[ 71 ]
    TOKENS_FOLLOWING_variableInitializer_IN_variableDeclarator_542 = Set[ 1 ]
    TOKENS_FOLLOWING_IDENTIFIER_IN_variableDeclaratorId_569 = Set[ 1 ]
    TOKENS_FOLLOWING_T__71_IN_variableInitializer_586 = Set[ 26, 69 ]
    TOKENS_FOLLOWING_creator_IN_variableInitializer_588 = Set[ 1 ]
    TOKENS_FOLLOWING_variableDeclarators_IN_localVariableDeclaration_609 = Set[ 51 ]
    TOKENS_FOLLOWING_SEMI_IN_localVariableDeclaration_611 = Set[ 1 ]
    TOKENS_FOLLOWING_localVariableDeclaration_IN_statement_633 = Set[ 1 ]
    TOKENS_FOLLOWING_SEMI_IN_statement_641 = Set[ 1 ]
    TOKENS_FOLLOWING_relationalExpression_IN_expression_659 = Set[ 1, 64, 72 ]
    TOKENS_FOLLOWING_set_IN_expression_662 = Set[ 26, 30, 35, 39, 44, 46 ]
    TOKENS_FOLLOWING_relationalExpression_IN_expression_668 = Set[ 1, 64, 72 ]
    TOKENS_FOLLOWING_addingExpression_IN_relationalExpression_687 = Set[ 1, 22, 24, 25, 36, 37, 42 ]
    TOKENS_FOLLOWING_set_IN_relationalExpression_690 = Set[ 26, 30, 35, 39, 44, 46 ]
    TOKENS_FOLLOWING_addingExpression_IN_relationalExpression_704 = Set[ 1, 22, 24, 25, 36, 37, 42 ]
    TOKENS_FOLLOWING_multiplyingExpression_IN_addingExpression_723 = Set[ 1, 39, 44 ]
    TOKENS_FOLLOWING_set_IN_addingExpression_726 = Set[ 26, 30, 35, 39, 44, 46 ]
    TOKENS_FOLLOWING_multiplyingExpression_IN_addingExpression_732 = Set[ 1, 39, 44 ]
    TOKENS_FOLLOWING_signExpression_IN_multiplyingExpression_751 = Set[ 1, 19, 55, 70 ]
    TOKENS_FOLLOWING_set_IN_multiplyingExpression_754 = Set[ 26, 30, 35, 39, 44, 46 ]
    TOKENS_FOLLOWING_signExpression_IN_multiplyingExpression_762 = Set[ 1, 19, 55, 70 ]
    TOKENS_FOLLOWING_primeExpression_IN_signExpression_788 = Set[ 1 ]
    TOKENS_FOLLOWING_primary_IN_primeExpression_805 = Set[ 1 ]
    TOKENS_FOLLOWING_LPAREN_IN_primeExpression_813 = Set[ 26, 30, 35, 39, 44, 46 ]
    TOKENS_FOLLOWING_expression_IN_primeExpression_815 = Set[ 50 ]
    TOKENS_FOLLOWING_RPAREN_IN_primeExpression_819 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_expressionList_838 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_COMMA_IN_expressionList_841 = Set[ 26, 30, 35, 39, 44, 46 ]
    TOKENS_FOLLOWING_expression_IN_expressionList_843 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_set_IN_declaration_862 = Set[ 1 ]
    TOKENS_FOLLOWING_primary_IN_declaration_874 = Set[ 1 ]
    TOKENS_FOLLOWING_LBRACK_IN_set_895 = Set[ 26, 30, 32, 46 ]
    TOKENS_FOLLOWING_setDeclaration_IN_set_897 = Set[ 48 ]
    TOKENS_FOLLOWING_RBRACK_IN_set_899 = Set[ 1 ]
    TOKENS_FOLLOWING_declaration_IN_setDeclaration_924 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_COMMA_IN_setDeclaration_927 = Set[ 26, 30, 32, 46 ]
    TOKENS_FOLLOWING_declaration_IN_setDeclaration_929 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_literal_IN_primary_955 = Set[ 1 ]
    TOKENS_FOLLOWING_createdName_IN_creator_969 = Set[ 35 ]
    TOKENS_FOLLOWING_classCreatorRest_IN_creator_971 = Set[ 1 ]
    TOKENS_FOLLOWING_structType_IN_createdName_999 = Set[ 1 ]
    TOKENS_FOLLOWING_primitiveType_IN_createdName_1007 = Set[ 1 ]
    TOKENS_FOLLOWING_arguments_IN_classCreatorRest_1024 = Set[ 1, 31 ]
    TOKENS_FOLLOWING_classBody_IN_classCreatorRest_1026 = Set[ 1 ]
    TOKENS_FOLLOWING_LPAREN_IN_arguments_1044 = Set[ 26, 50 ]
    TOKENS_FOLLOWING_argumentList_IN_arguments_1046 = Set[ 26, 50 ]
    TOKENS_FOLLOWING_RPAREN_IN_arguments_1049 = Set[ 1 ]
    TOKENS_FOLLOWING_argument_IN_argumentList_1071 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_COMMA_IN_argumentList_1074 = Set[ 26 ]
    TOKENS_FOLLOWING_argument_IN_argumentList_1076 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_IDENTIFIER_IN_argument_1097 = Set[ 7 ]
    TOKENS_FOLLOWING_ASSIGN_IN_argument_1099 = Set[ 26, 30, 32, 46 ]
    TOKENS_FOLLOWING_declaration_IN_argument_1101 = Set[ 1 ]
    TOKENS_FOLLOWING_structType_IN_type_1151 = Set[ 1 ]
    TOKENS_FOLLOWING_primitiveType_IN_type_1165 = Set[ 1 ]
    TOKENS_FOLLOWING_IDENTIFIER_IN_structType_1188 = Set[ 1 ]
    TOKENS_FOLLOWING_T__69_IN_primitiveType_1205 = Set[ 1 ]
    TOKENS_FOLLOWING_T__74_IN_variableType_1228 = Set[ 1 ]
    TOKENS_FOLLOWING_T__66_IN_variableType_1242 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0

end

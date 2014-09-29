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


    # register the proper human-readable name or literal value
    # for each token type
    #
    # this is necessary because anonymous tokens, which are
    # created from literal values in the grammar, do not
    # have descriptive names
    register_names( "ALPHABET", "ALPHANUMERIC", "AND", "ASSIGN", "ATTRIBUTE", 
                    "BANG", "CLASS_DECLARATION", "COLON", "COMMA", "COMMENT", 
                    "CONSTANT", "CONSTRAINT_DECLARATION", "CONSTRAINT_EXPRESSION", 
                    "DEC", "DIGIT", "DIGITORUNDERSCORE", "DIGITS", "DIV", 
                    "DOMAIN_BODY", "DOMAIN_BODY_DECLARATION", "DOMAIN_DECLARATION", 
                    "DOT", "EQUALS", "FIELD_ACCESSOR", "FIELD_DECLARATION", 
                    "GT", "GTE", "IDENTIFIER", "INC", "INITIAL_DECLARATION", 
                    "INTEGER", "INTEGERLITERAL", "LBRACE", "LBRACK", "LINE_COMMENT", 
                    "LIST", "LOWERCASE", "LPAREN", "LT", "LTE", "MEMBER_DECLARATION", 
                    "MINUS", "MOD", "NONZERODIGIT", "NOT_EQUALS", "OR", 
                    "PLUS", "QUESTION", "RANGEINTEGERLITERAL", "RBRACE", 
                    "RBRACK", "REFERENCE", "RPAREN", "SEMI", "SET", "SIGN", 
                    "START", "TIMES", "TYPE_DECLARATION", "UPPERCASE", "VARIABLE", 
                    "VARIABLE_DECLARATION", "VARIABLE_DECLARATOR", "WS", 
                    "YARPL_LETTER", "YARPL_LETTERORDIGIT", "'and'", "'class'", 
                    "'const'", "'constraint'", "'domain'", "'initial'", 
                    "'integer'", "'mod'", "'new'", "'or'", "'reference'", 
                    "'var'" )


  end


  class Parser < ANTLR3::Parser
    @grammar_home = Yarpl
    include ANTLR3::ASTBuilder

    RULE_METHODS = [ :start, :program, :domainDeclaration, :domainBody, 
                     :domainBodyDeclaration, :initialDeclaration, :initialBody, 
                     :initialBodyDeclaration, :typeDeclaration, :classDeclaration, 
                     :classBody, :classBodyDeclaration, :memberDeclaration, 
                     :fieldDeclaration, :fieldAccessor, :variableDeclarators, 
                     :variableDeclarator, :variableDeclaratorId, :variableInitializer, 
                     :localVariableDeclaration, :constraintDeclaration, 
                     :constraintBody, :expression, :relationalExpression, 
                     :addingExpression, :multiplyingExpression, :signExpression, 
                     :primeExpression, :expressionList, :declaration, :declarationList, 
                     :primaryList, :list, :set, :primary, :creator, :createdName, 
                     :classCreatorRest, :arguments, :argumentList, :argument, 
                     :literal, :type, :structType, :primitiveType, :variableType ].freeze

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
    # 32:1: start : ( program )* -> ^( START ( program )* ) ;
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
      # at line 33:7: ( program )*
      # at line 33:7: ( program )*
      while true # decision 1
        alt_1 = 2
        look_1_0 = @input.peek( 1 )

        if ( look_1_0.between?( T__74, T__75 ) )
          alt_1 = 1

        end
        case alt_1
        when 1
          # at line 33:7: program
          @state.following.push( TOKENS_FOLLOWING_program_IN_start_143 )
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
      # 33:16: -> ^( START ( program )* )
      # at line 33:19: ^( START ( program )* )
      root_1 = @adaptor.create_flat_list
      root_1 = @adaptor.become_root( @adaptor.create_from_type( START, "START" ), root_1 )

      # at line 33:27: ( program )*
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
    # 36:1: program : ( domainDeclaration -> domainDeclaration | initialDeclaration -> initialDeclaration );
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
      # at line 37:5: ( domainDeclaration -> domainDeclaration | initialDeclaration -> initialDeclaration )
      alt_2 = 2
      look_2_0 = @input.peek( 1 )

      if ( look_2_0 == T__74 )
        alt_2 = 1
      elsif ( look_2_0 == T__75 )
        alt_2 = 2
      else
        raise NoViableAlternative( "", 2, 0 )

      end
      case alt_2
      when 1
        # at line 37:7: domainDeclaration
        @state.following.push( TOKENS_FOLLOWING_domainDeclaration_IN_program_190 )
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
        # 37:25: -> domainDeclaration
        @adaptor.add_child( root_0, stream_domainDeclaration.next_tree )




        return_value.tree = root_0



      when 2
        # at line 38:7: initialDeclaration
        @state.following.push( TOKENS_FOLLOWING_initialDeclaration_IN_program_202 )
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
        # 38:26: -> initialDeclaration
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
    # 41:1: domainDeclaration : 'domain' domainBody -> ^( DOMAIN_DECLARATION domainBody ) ;
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
      stream_T__74 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__74" )
      stream_domainBody = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule domainBody" )
      begin
      # at line 42:7: 'domain' domainBody
      string_literal4 = match( T__74, TOKENS_FOLLOWING_T__74_IN_domainDeclaration_220 )
      stream_T__74.add( string_literal4 )

      @state.following.push( TOKENS_FOLLOWING_domainBody_IN_domainDeclaration_222 )
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
      # 42:27: -> ^( DOMAIN_DECLARATION domainBody )
      # at line 42:30: ^( DOMAIN_DECLARATION domainBody )
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
    # 45:1: domainBody : '{' ( domainBodyDeclaration )* '}' -> ( domainBodyDeclaration )* ;
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
      # at line 46:7: '{' ( domainBodyDeclaration )* '}'
      char_literal6 = match( LBRACE, TOKENS_FOLLOWING_LBRACE_IN_domainBody_247 )
      stream_LBRACE.add( char_literal6 )

      # at line 46:11: ( domainBodyDeclaration )*
      while true # decision 3
        alt_3 = 2
        look_3_0 = @input.peek( 1 )

        if ( look_3_0 == T__71 )
          alt_3 = 1

        end
        case alt_3
        when 1
          # at line 46:11: domainBodyDeclaration
          @state.following.push( TOKENS_FOLLOWING_domainBodyDeclaration_IN_domainBody_249 )
          domainBodyDeclaration7 = domainBodyDeclaration
          @state.following.pop
          stream_domainBodyDeclaration.add( domainBodyDeclaration7.tree )


        else
          break # out of loop for decision 3
        end
      end # loop for decision 3

      char_literal8 = match( RBRACE, TOKENS_FOLLOWING_RBRACE_IN_domainBody_252 )
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
      # 46:38: -> ( domainBodyDeclaration )*
      # at line 46:41: ( domainBodyDeclaration )*
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
    # 49:1: domainBodyDeclaration : typeDeclaration -> typeDeclaration ;
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
      # at line 50:7: typeDeclaration
      @state.following.push( TOKENS_FOLLOWING_typeDeclaration_IN_domainBodyDeclaration_274 )
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
      # 50:23: -> typeDeclaration
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
    # 53:1: initialDeclaration : 'initial' initialBody -> ^( INITIAL_DECLARATION initialBody ) ;
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
      stream_T__75 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__75" )
      stream_initialBody = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule initialBody" )
      begin
      # at line 54:7: 'initial' initialBody
      string_literal10 = match( T__75, TOKENS_FOLLOWING_T__75_IN_initialDeclaration_292 )
      stream_T__75.add( string_literal10 )

      @state.following.push( TOKENS_FOLLOWING_initialBody_IN_initialDeclaration_294 )
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
      # 54:30: -> ^( INITIAL_DECLARATION initialBody )
      # at line 54:33: ^( INITIAL_DECLARATION initialBody )
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
    # 57:1: initialBody : '{' ( initialBodyDeclaration )* '}' -> ( initialBodyDeclaration )* ;
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
      # at line 58:7: '{' ( initialBodyDeclaration )* '}'
      char_literal12 = match( LBRACE, TOKENS_FOLLOWING_LBRACE_IN_initialBody_320 )
      stream_LBRACE.add( char_literal12 )

      # at line 58:11: ( initialBodyDeclaration )*
      while true # decision 4
        alt_4 = 2
        look_4_0 = @input.peek( 1 )

        if ( look_4_0 == IDENTIFIER || look_4_0 == T__73 )
          alt_4 = 1

        end
        case alt_4
        when 1
          # at line 58:11: initialBodyDeclaration
          @state.following.push( TOKENS_FOLLOWING_initialBodyDeclaration_IN_initialBody_322 )
          initialBodyDeclaration13 = initialBodyDeclaration
          @state.following.pop
          stream_initialBodyDeclaration.add( initialBodyDeclaration13.tree )


        else
          break # out of loop for decision 4
        end
      end # loop for decision 4

      char_literal14 = match( RBRACE, TOKENS_FOLLOWING_RBRACE_IN_initialBody_325 )
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
      # 58:39: -> ( initialBodyDeclaration )*
      # at line 58:42: ( initialBodyDeclaration )*
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
    # 61:1: initialBodyDeclaration : ( localVariableDeclaration | constraintDeclaration );
    #
    def initialBodyDeclaration
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 8 )


      return_value = InitialBodyDeclarationReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      localVariableDeclaration15 = nil
      constraintDeclaration16 = nil



      begin
      # at line 62:5: ( localVariableDeclaration | constraintDeclaration )
      alt_5 = 2
      look_5_0 = @input.peek( 1 )

      if ( look_5_0 == IDENTIFIER )
        alt_5 = 1
      elsif ( look_5_0 == T__73 )
        alt_5 = 2
      else
        raise NoViableAlternative( "", 5, 0 )

      end
      case alt_5
      when 1
        root_0 = @adaptor.create_flat_list


        # at line 62:7: localVariableDeclaration
        @state.following.push( TOKENS_FOLLOWING_localVariableDeclaration_IN_initialBodyDeclaration_347 )
        localVariableDeclaration15 = localVariableDeclaration
        @state.following.pop
        @adaptor.add_child( root_0, localVariableDeclaration15.tree )


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 63:7: constraintDeclaration
        @state.following.push( TOKENS_FOLLOWING_constraintDeclaration_IN_initialBodyDeclaration_355 )
        constraintDeclaration16 = constraintDeclaration
        @state.following.pop
        @adaptor.add_child( root_0, constraintDeclaration16.tree )


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
        # trace_out( __method__, 8 )


      end

      return return_value
    end

    TypeDeclarationReturnValue = define_return_scope

    #
    # parser rule typeDeclaration
    #
    # (in lib/yarpl/Yarpl.g)
    # 66:1: typeDeclaration : classDeclaration -> ^( CLASS_DECLARATION classDeclaration ) ;
    #
    def typeDeclaration
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 9 )


      return_value = TypeDeclarationReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      classDeclaration17 = nil


      stream_classDeclaration = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule classDeclaration" )
      begin
      # at line 67:7: classDeclaration
      @state.following.push( TOKENS_FOLLOWING_classDeclaration_IN_typeDeclaration_372 )
      classDeclaration17 = classDeclaration
      @state.following.pop
      stream_classDeclaration.add( classDeclaration17.tree )

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
      # 67:24: -> ^( CLASS_DECLARATION classDeclaration )
      # at line 67:27: ^( CLASS_DECLARATION classDeclaration )
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
    # 70:1: classDeclaration : 'class' IDENTIFIER classBody -> ^( IDENTIFIER classBody ) ;
    #
    def classDeclaration
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )


      return_value = ClassDeclarationReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal18 = nil
      __IDENTIFIER19__ = nil
      classBody20 = nil


      tree_for_string_literal18 = nil
      tree_for_IDENTIFIER19 = nil
      stream_T__71 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__71" )
      stream_IDENTIFIER = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token IDENTIFIER" )
      stream_classBody = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule classBody" )
      begin
      # at line 71:7: 'class' IDENTIFIER classBody
      string_literal18 = match( T__71, TOKENS_FOLLOWING_T__71_IN_classDeclaration_397 )
      stream_T__71.add( string_literal18 )

      __IDENTIFIER19__ = match( IDENTIFIER, TOKENS_FOLLOWING_IDENTIFIER_IN_classDeclaration_399 )
      stream_IDENTIFIER.add( __IDENTIFIER19__ )

      @state.following.push( TOKENS_FOLLOWING_classBody_IN_classDeclaration_401 )
      classBody20 = classBody
      @state.following.pop
      stream_classBody.add( classBody20.tree )

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
      # 71:36: -> ^( IDENTIFIER classBody )
      # at line 71:39: ^( IDENTIFIER classBody )
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
    # 74:1: classBody : '{' ( classBodyDeclaration )* '}' -> ( classBodyDeclaration )* ;
    #
    def classBody
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )


      return_value = ClassBodyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal21 = nil
      char_literal23 = nil
      classBodyDeclaration22 = nil


      tree_for_char_literal21 = nil
      tree_for_char_literal23 = nil
      stream_RBRACE = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token RBRACE" )
      stream_LBRACE = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token LBRACE" )
      stream_classBodyDeclaration = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule classBodyDeclaration" )
      begin
      # at line 75:7: '{' ( classBodyDeclaration )* '}'
      char_literal21 = match( LBRACE, TOKENS_FOLLOWING_LBRACE_IN_classBody_423 )
      stream_LBRACE.add( char_literal21 )

      # at line 75:11: ( classBodyDeclaration )*
      while true # decision 6
        alt_6 = 2
        look_6_0 = @input.peek( 1 )

        if ( look_6_0 == T__72 || look_6_0.between?( T__80, T__81 ) )
          alt_6 = 1

        end
        case alt_6
        when 1
          # at line 75:11: classBodyDeclaration
          @state.following.push( TOKENS_FOLLOWING_classBodyDeclaration_IN_classBody_425 )
          classBodyDeclaration22 = classBodyDeclaration
          @state.following.pop
          stream_classBodyDeclaration.add( classBodyDeclaration22.tree )


        else
          break # out of loop for decision 6
        end
      end # loop for decision 6

      char_literal23 = match( RBRACE, TOKENS_FOLLOWING_RBRACE_IN_classBody_428 )
      stream_RBRACE.add( char_literal23 )

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
      # 75:37: -> ( classBodyDeclaration )*
      # at line 75:40: ( classBodyDeclaration )*
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
    # 78:1: classBodyDeclaration : memberDeclaration -> ^( memberDeclaration ) ;
    #
    def classBodyDeclaration
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )


      return_value = ClassBodyDeclarationReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      memberDeclaration24 = nil


      stream_memberDeclaration = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule memberDeclaration" )
      begin
      # at line 79:7: memberDeclaration
      @state.following.push( TOKENS_FOLLOWING_memberDeclaration_IN_classBodyDeclaration_447 )
      memberDeclaration24 = memberDeclaration
      @state.following.pop
      stream_memberDeclaration.add( memberDeclaration24.tree )

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
      # 79:25: -> ^( memberDeclaration )
      # at line 79:28: ^( memberDeclaration )
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
    # 82:1: memberDeclaration : fieldDeclaration -> fieldDeclaration ;
    #
    def memberDeclaration
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )


      return_value = MemberDeclarationReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      fieldDeclaration25 = nil


      stream_fieldDeclaration = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule fieldDeclaration" )
      begin
      # at line 83:7: fieldDeclaration
      @state.following.push( TOKENS_FOLLOWING_fieldDeclaration_IN_memberDeclaration_467 )
      fieldDeclaration25 = fieldDeclaration
      @state.following.pop
      stream_fieldDeclaration.add( fieldDeclaration25.tree )

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
      # 83:24: -> fieldDeclaration
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
    # 86:1: fieldDeclaration : ( variableType type variableDeclaratorId ';' -> ^( FIELD_DECLARATION variableType type variableDeclaratorId ) | 'reference' LPAREN IDENTIFIER RPAREN variableDeclaratorId ';' -> ^( REFERENCE IDENTIFIER variableDeclaratorId ) );
    #
    def fieldDeclaration
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )


      return_value = FieldDeclarationReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal29 = nil
      string_literal30 = nil
      __LPAREN31__ = nil
      __IDENTIFIER32__ = nil
      __RPAREN33__ = nil
      char_literal35 = nil
      variableType26 = nil
      type27 = nil
      variableDeclaratorId28 = nil
      variableDeclaratorId34 = nil


      tree_for_char_literal29 = nil
      tree_for_string_literal30 = nil
      tree_for_LPAREN31 = nil
      tree_for_IDENTIFIER32 = nil
      tree_for_RPAREN33 = nil
      tree_for_char_literal35 = nil
      stream_RPAREN = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token RPAREN" )
      stream_T__80 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__80" )
      stream_SEMI = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token SEMI" )
      stream_IDENTIFIER = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token IDENTIFIER" )
      stream_LPAREN = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token LPAREN" )
      stream_variableType = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule variableType" )
      stream_variableDeclaratorId = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule variableDeclaratorId" )
      stream_type = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule type" )
      begin
      # at line 87:5: ( variableType type variableDeclaratorId ';' -> ^( FIELD_DECLARATION variableType type variableDeclaratorId ) | 'reference' LPAREN IDENTIFIER RPAREN variableDeclaratorId ';' -> ^( REFERENCE IDENTIFIER variableDeclaratorId ) )
      alt_7 = 2
      look_7_0 = @input.peek( 1 )

      if ( look_7_0 == T__72 || look_7_0 == T__81 )
        alt_7 = 1
      elsif ( look_7_0 == T__80 )
        alt_7 = 2
      else
        raise NoViableAlternative( "", 7, 0 )

      end
      case alt_7
      when 1
        # at line 87:7: variableType type variableDeclaratorId ';'
        @state.following.push( TOKENS_FOLLOWING_variableType_IN_fieldDeclaration_489 )
        variableType26 = variableType
        @state.following.pop
        stream_variableType.add( variableType26.tree )

        @state.following.push( TOKENS_FOLLOWING_type_IN_fieldDeclaration_491 )
        type27 = type
        @state.following.pop
        stream_type.add( type27.tree )

        @state.following.push( TOKENS_FOLLOWING_variableDeclaratorId_IN_fieldDeclaration_493 )
        variableDeclaratorId28 = variableDeclaratorId
        @state.following.pop
        stream_variableDeclaratorId.add( variableDeclaratorId28.tree )

        char_literal29 = match( SEMI, TOKENS_FOLLOWING_SEMI_IN_fieldDeclaration_495 )
        stream_SEMI.add( char_literal29 )

        # AST Rewrite
        # elements: type, variableDeclaratorId, variableType
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 
        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 87:50: -> ^( FIELD_DECLARATION variableType type variableDeclaratorId )
        # at line 87:53: ^( FIELD_DECLARATION variableType type variableDeclaratorId )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( FIELD_DECLARATION, "FIELD_DECLARATION" ), root_1 )

        @adaptor.add_child( root_1, stream_variableType.next_tree )

        @adaptor.add_child( root_1, stream_type.next_tree )

        @adaptor.add_child( root_1, stream_variableDeclaratorId.next_tree )

        @adaptor.add_child( root_0, root_1 )




        return_value.tree = root_0



      when 2
        # at line 88:7: 'reference' LPAREN IDENTIFIER RPAREN variableDeclaratorId ';'
        string_literal30 = match( T__80, TOKENS_FOLLOWING_T__80_IN_fieldDeclaration_515 )
        stream_T__80.add( string_literal30 )

        __LPAREN31__ = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_fieldDeclaration_517 )
        stream_LPAREN.add( __LPAREN31__ )

        __IDENTIFIER32__ = match( IDENTIFIER, TOKENS_FOLLOWING_IDENTIFIER_IN_fieldDeclaration_519 )
        stream_IDENTIFIER.add( __IDENTIFIER32__ )

        __RPAREN33__ = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_fieldDeclaration_521 )
        stream_RPAREN.add( __RPAREN33__ )

        @state.following.push( TOKENS_FOLLOWING_variableDeclaratorId_IN_fieldDeclaration_523 )
        variableDeclaratorId34 = variableDeclaratorId
        @state.following.pop
        stream_variableDeclaratorId.add( variableDeclaratorId34.tree )

        char_literal35 = match( SEMI, TOKENS_FOLLOWING_SEMI_IN_fieldDeclaration_525 )
        stream_SEMI.add( char_literal35 )

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
        # 88:69: -> ^( REFERENCE IDENTIFIER variableDeclaratorId )
        # at line 88:72: ^( REFERENCE IDENTIFIER variableDeclaratorId )
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

    FieldAccessorReturnValue = define_return_scope

    #
    # parser rule fieldAccessor
    #
    # (in lib/yarpl/Yarpl.g)
    # 91:1: fieldAccessor : IDENTIFIER '.' IDENTIFIER -> ^( FIELD_ACCESSOR IDENTIFIER IDENTIFIER ) ;
    #
    def fieldAccessor
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )


      return_value = FieldAccessorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __IDENTIFIER36__ = nil
      char_literal37 = nil
      __IDENTIFIER38__ = nil


      tree_for_IDENTIFIER36 = nil
      tree_for_char_literal37 = nil
      tree_for_IDENTIFIER38 = nil
      stream_DOT = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token DOT" )
      stream_IDENTIFIER = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token IDENTIFIER" )

      begin
      # at line 92:7: IDENTIFIER '.' IDENTIFIER
      __IDENTIFIER36__ = match( IDENTIFIER, TOKENS_FOLLOWING_IDENTIFIER_IN_fieldAccessor_552 )
      stream_IDENTIFIER.add( __IDENTIFIER36__ )

      char_literal37 = match( DOT, TOKENS_FOLLOWING_DOT_IN_fieldAccessor_554 )
      stream_DOT.add( char_literal37 )

      __IDENTIFIER38__ = match( IDENTIFIER, TOKENS_FOLLOWING_IDENTIFIER_IN_fieldAccessor_556 )
      stream_IDENTIFIER.add( __IDENTIFIER38__ )

      # AST Rewrite
      # elements: IDENTIFIER, IDENTIFIER
      # token labels: 
      # rule labels: return_value
      # token list labels: 
      # rule list labels: 
      # wildcard labels: 
      return_value.tree = root_0
      stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

      root_0 = @adaptor.create_flat_list
      # 92:33: -> ^( FIELD_ACCESSOR IDENTIFIER IDENTIFIER )
      # at line 92:36: ^( FIELD_ACCESSOR IDENTIFIER IDENTIFIER )
      root_1 = @adaptor.create_flat_list
      root_1 = @adaptor.become_root( @adaptor.create_from_type( FIELD_ACCESSOR, "FIELD_ACCESSOR" ), root_1 )

      @adaptor.add_child( root_1, stream_IDENTIFIER.next_node )

      @adaptor.add_child( root_1, stream_IDENTIFIER.next_node )

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
        # trace_out( __method__, 15 )


      end

      return return_value
    end

    VariableDeclaratorsReturnValue = define_return_scope

    #
    # parser rule variableDeclarators
    #
    # (in lib/yarpl/Yarpl.g)
    # 95:1: variableDeclarators : variableDeclarator ( ',' variableDeclarator )* ;
    #
    def variableDeclarators
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )


      return_value = VariableDeclaratorsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal40 = nil
      variableDeclarator39 = nil
      variableDeclarator41 = nil


      tree_for_char_literal40 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 96:7: variableDeclarator ( ',' variableDeclarator )*
      @state.following.push( TOKENS_FOLLOWING_variableDeclarator_IN_variableDeclarators_583 )
      variableDeclarator39 = variableDeclarator
      @state.following.pop
      @adaptor.add_child( root_0, variableDeclarator39.tree )

      # at line 96:26: ( ',' variableDeclarator )*
      while true # decision 8
        alt_8 = 2
        look_8_0 = @input.peek( 1 )

        if ( look_8_0 == COMMA )
          alt_8 = 1

        end
        case alt_8
        when 1
          # at line 96:27: ',' variableDeclarator
          char_literal40 = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_variableDeclarators_586 )
          tree_for_char_literal40 = @adaptor.create_with_payload( char_literal40 )
          @adaptor.add_child( root_0, tree_for_char_literal40 )


          @state.following.push( TOKENS_FOLLOWING_variableDeclarator_IN_variableDeclarators_588 )
          variableDeclarator41 = variableDeclarator
          @state.following.pop
          @adaptor.add_child( root_0, variableDeclarator41.tree )


        else
          break # out of loop for decision 8
        end
      end # loop for decision 8


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

    VariableDeclaratorReturnValue = define_return_scope

    #
    # parser rule variableDeclarator
    #
    # (in lib/yarpl/Yarpl.g)
    # 99:1: variableDeclarator : variableDeclaratorId '=' variableInitializer -> ^( VARIABLE_DECLARATOR variableDeclaratorId variableInitializer ) ;
    #
    def variableDeclarator
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )


      return_value = VariableDeclaratorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal43 = nil
      variableDeclaratorId42 = nil
      variableInitializer44 = nil


      tree_for_char_literal43 = nil
      stream_ASSIGN = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token ASSIGN" )
      stream_variableDeclaratorId = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule variableDeclaratorId" )
      stream_variableInitializer = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule variableInitializer" )
      begin
      # at line 100:7: variableDeclaratorId '=' variableInitializer
      @state.following.push( TOKENS_FOLLOWING_variableDeclaratorId_IN_variableDeclarator_607 )
      variableDeclaratorId42 = variableDeclaratorId
      @state.following.pop
      stream_variableDeclaratorId.add( variableDeclaratorId42.tree )

      char_literal43 = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_variableDeclarator_609 )
      stream_ASSIGN.add( char_literal43 )

      @state.following.push( TOKENS_FOLLOWING_variableInitializer_IN_variableDeclarator_611 )
      variableInitializer44 = variableInitializer
      @state.following.pop
      stream_variableInitializer.add( variableInitializer44.tree )

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
      # 100:52: -> ^( VARIABLE_DECLARATOR variableDeclaratorId variableInitializer )
      # at line 100:55: ^( VARIABLE_DECLARATOR variableDeclaratorId variableInitializer )
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
        # trace_out( __method__, 17 )


      end

      return return_value
    end

    VariableDeclaratorIdReturnValue = define_return_scope

    #
    # parser rule variableDeclaratorId
    #
    # (in lib/yarpl/Yarpl.g)
    # 103:1: variableDeclaratorId : IDENTIFIER ;
    #
    def variableDeclaratorId
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )


      return_value = VariableDeclaratorIdReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __IDENTIFIER45__ = nil


      tree_for_IDENTIFIER45 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 104:7: IDENTIFIER
      __IDENTIFIER45__ = match( IDENTIFIER, TOKENS_FOLLOWING_IDENTIFIER_IN_variableDeclaratorId_638 )
      tree_for_IDENTIFIER45 = @adaptor.create_with_payload( __IDENTIFIER45__ )
      @adaptor.add_child( root_0, tree_for_IDENTIFIER45 )



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

    VariableInitializerReturnValue = define_return_scope

    #
    # parser rule variableInitializer
    #
    # (in lib/yarpl/Yarpl.g)
    # 107:1: variableInitializer : 'new' creator -> creator ;
    #
    def variableInitializer
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )


      return_value = VariableInitializerReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal46 = nil
      creator47 = nil


      tree_for_string_literal46 = nil
      stream_T__78 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__78" )
      stream_creator = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule creator" )
      begin
      # at line 108:7: 'new' creator
      string_literal46 = match( T__78, TOKENS_FOLLOWING_T__78_IN_variableInitializer_655 )
      stream_T__78.add( string_literal46 )

      @state.following.push( TOKENS_FOLLOWING_creator_IN_variableInitializer_657 )
      creator47 = creator
      @state.following.pop
      stream_creator.add( creator47.tree )

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
      # 108:21: -> creator
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
        # trace_out( __method__, 19 )


      end

      return return_value
    end

    LocalVariableDeclarationReturnValue = define_return_scope

    #
    # parser rule localVariableDeclaration
    #
    # (in lib/yarpl/Yarpl.g)
    # 111:1: localVariableDeclaration : variableDeclarators ';' -> variableDeclarators ;
    #
    def localVariableDeclaration
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )


      return_value = LocalVariableDeclarationReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal49 = nil
      variableDeclarators48 = nil


      tree_for_char_literal49 = nil
      stream_SEMI = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token SEMI" )
      stream_variableDeclarators = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule variableDeclarators" )
      begin
      # at line 112:7: variableDeclarators ';'
      @state.following.push( TOKENS_FOLLOWING_variableDeclarators_IN_localVariableDeclaration_678 )
      variableDeclarators48 = variableDeclarators
      @state.following.pop
      stream_variableDeclarators.add( variableDeclarators48.tree )

      char_literal49 = match( SEMI, TOKENS_FOLLOWING_SEMI_IN_localVariableDeclaration_680 )
      stream_SEMI.add( char_literal49 )

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
      # 112:31: -> variableDeclarators
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
        # trace_out( __method__, 20 )


      end

      return return_value
    end

    ConstraintDeclarationReturnValue = define_return_scope

    #
    # parser rule constraintDeclaration
    #
    # (in lib/yarpl/Yarpl.g)
    # 115:1: constraintDeclaration : 'constraint' constraintBody -> ^( CONSTRAINT_DECLARATION constraintBody ) ;
    #
    def constraintDeclaration
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )


      return_value = ConstraintDeclarationReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal50 = nil
      constraintBody51 = nil


      tree_for_string_literal50 = nil
      stream_T__73 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__73" )
      stream_constraintBody = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule constraintBody" )
      begin
      # at line 116:7: 'constraint' constraintBody
      string_literal50 = match( T__73, TOKENS_FOLLOWING_T__73_IN_constraintDeclaration_701 )
      stream_T__73.add( string_literal50 )

      @state.following.push( TOKENS_FOLLOWING_constraintBody_IN_constraintDeclaration_703 )
      constraintBody51 = constraintBody
      @state.following.pop
      stream_constraintBody.add( constraintBody51.tree )

      # AST Rewrite
      # elements: constraintBody
      # token labels: 
      # rule labels: return_value
      # token list labels: 
      # rule list labels: 
      # wildcard labels: 
      return_value.tree = root_0
      stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

      root_0 = @adaptor.create_flat_list
      # 116:35: -> ^( CONSTRAINT_DECLARATION constraintBody )
      # at line 116:38: ^( CONSTRAINT_DECLARATION constraintBody )
      root_1 = @adaptor.create_flat_list
      root_1 = @adaptor.become_root( @adaptor.create_from_type( CONSTRAINT_DECLARATION, "CONSTRAINT_DECLARATION" ), root_1 )

      @adaptor.add_child( root_1, stream_constraintBody.next_tree )

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
        # trace_out( __method__, 21 )


      end

      return return_value
    end

    ConstraintBodyReturnValue = define_return_scope

    #
    # parser rule constraintBody
    #
    # (in lib/yarpl/Yarpl.g)
    # 119:1: constraintBody : LBRACE expression RBRACE -> ^( CONSTRAINT_EXPRESSION expression ) ;
    #
    def constraintBody
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )


      return_value = ConstraintBodyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __LBRACE52__ = nil
      __RBRACE54__ = nil
      expression53 = nil


      tree_for_LBRACE52 = nil
      tree_for_RBRACE54 = nil
      stream_RBRACE = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token RBRACE" )
      stream_LBRACE = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token LBRACE" )
      stream_expression = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule expression" )
      begin
      # at line 120:7: LBRACE expression RBRACE
      __LBRACE52__ = match( LBRACE, TOKENS_FOLLOWING_LBRACE_IN_constraintBody_728 )
      stream_LBRACE.add( __LBRACE52__ )

      @state.following.push( TOKENS_FOLLOWING_expression_IN_constraintBody_730 )
      expression53 = expression
      @state.following.pop
      stream_expression.add( expression53.tree )

      __RBRACE54__ = match( RBRACE, TOKENS_FOLLOWING_RBRACE_IN_constraintBody_732 )
      stream_RBRACE.add( __RBRACE54__ )

      # AST Rewrite
      # elements: expression
      # token labels: 
      # rule labels: return_value
      # token list labels: 
      # rule list labels: 
      # wildcard labels: 
      return_value.tree = root_0
      stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

      root_0 = @adaptor.create_flat_list
      # 120:32: -> ^( CONSTRAINT_EXPRESSION expression )
      # at line 120:35: ^( CONSTRAINT_EXPRESSION expression )
      root_1 = @adaptor.create_flat_list
      root_1 = @adaptor.become_root( @adaptor.create_from_type( CONSTRAINT_EXPRESSION, "CONSTRAINT_EXPRESSION" ), root_1 )

      @adaptor.add_child( root_1, stream_expression.next_tree )

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
        # trace_out( __method__, 22 )


      end

      return return_value
    end

    ExpressionReturnValue = define_return_scope

    #
    # parser rule expression
    #
    # (in lib/yarpl/Yarpl.g)
    # 123:1: expression : ( relationalExpression ( ( 'and' | 'or' ) relationalExpression )* | fieldAccessor EQUALS fieldAccessor -> ^( EQUALS fieldAccessor fieldAccessor ) );
    #
    def expression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )


      return_value = ExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set56 = nil
      __EQUALS59__ = nil
      relationalExpression55 = nil
      relationalExpression57 = nil
      fieldAccessor58 = nil
      fieldAccessor60 = nil


      tree_for_set56 = nil
      tree_for_EQUALS59 = nil
      stream_EQUALS = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token EQUALS" )
      stream_fieldAccessor = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule fieldAccessor" )
      begin
      # at line 124:5: ( relationalExpression ( ( 'and' | 'or' ) relationalExpression )* | fieldAccessor EQUALS fieldAccessor -> ^( EQUALS fieldAccessor fieldAccessor ) )
      alt_10 = 2
      look_10_0 = @input.peek( 1 )

      if ( look_10_0 == INTEGERLITERAL || look_10_0 == LPAREN || look_10_0 == MINUS || look_10_0 == PLUS || look_10_0 == RANGEINTEGERLITERAL )
        alt_10 = 1
      elsif ( look_10_0 == IDENTIFIER )
        look_10_2 = @input.peek( 2 )

        if ( look_10_2 == DOT )
          alt_10 = 2
        elsif ( look_10_2 == EOF || look_10_2 == COMMA || look_10_2 == DIV || look_10_2 == EQUALS || look_10_2.between?( GT, GTE ) || look_10_2.between?( LT, LTE ) || look_10_2 == MINUS || look_10_2 == NOT_EQUALS || look_10_2 == PLUS || look_10_2 == RBRACE || look_10_2 == RPAREN || look_10_2 == TIMES || look_10_2 == T__70 || look_10_2 == T__77 || look_10_2 == T__79 )
          alt_10 = 1
        else
          raise NoViableAlternative( "", 10, 2 )

        end
      else
        raise NoViableAlternative( "", 10, 0 )

      end
      case alt_10
      when 1
        root_0 = @adaptor.create_flat_list


        # at line 124:7: relationalExpression ( ( 'and' | 'or' ) relationalExpression )*
        @state.following.push( TOKENS_FOLLOWING_relationalExpression_IN_expression_757 )
        relationalExpression55 = relationalExpression
        @state.following.pop
        @adaptor.add_child( root_0, relationalExpression55.tree )

        # at line 124:28: ( ( 'and' | 'or' ) relationalExpression )*
        while true # decision 9
          alt_9 = 2
          look_9_0 = @input.peek( 1 )

          if ( look_9_0 == T__70 || look_9_0 == T__79 )
            alt_9 = 1

          end
          case alt_9
          when 1
            # at line 124:29: ( 'and' | 'or' ) relationalExpression
            set56 = @input.look

            if @input.peek(1) == T__70 || @input.peek(1) == T__79
              @input.consume
              @adaptor.add_child( root_0, @adaptor.create_with_payload( set56 ) )

              @state.error_recovery = false

            else
              mse = MismatchedSet( nil )
              raise mse

            end


            @state.following.push( TOKENS_FOLLOWING_relationalExpression_IN_expression_766 )
            relationalExpression57 = relationalExpression
            @state.following.pop
            @adaptor.add_child( root_0, relationalExpression57.tree )


          else
            break # out of loop for decision 9
          end
        end # loop for decision 9


      when 2
        # at line 125:7: fieldAccessor EQUALS fieldAccessor
        @state.following.push( TOKENS_FOLLOWING_fieldAccessor_IN_expression_776 )
        fieldAccessor58 = fieldAccessor
        @state.following.pop
        stream_fieldAccessor.add( fieldAccessor58.tree )

        __EQUALS59__ = match( EQUALS, TOKENS_FOLLOWING_EQUALS_IN_expression_778 )
        stream_EQUALS.add( __EQUALS59__ )

        @state.following.push( TOKENS_FOLLOWING_fieldAccessor_IN_expression_780 )
        fieldAccessor60 = fieldAccessor
        @state.following.pop
        stream_fieldAccessor.add( fieldAccessor60.tree )

        # AST Rewrite
        # elements: fieldAccessor, EQUALS, fieldAccessor
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 
        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 125:42: -> ^( EQUALS fieldAccessor fieldAccessor )
        # at line 125:45: ^( EQUALS fieldAccessor fieldAccessor )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( stream_EQUALS.next_node, root_1 )

        @adaptor.add_child( root_1, stream_fieldAccessor.next_tree )

        @adaptor.add_child( root_1, stream_fieldAccessor.next_tree )

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
        # trace_out( __method__, 23 )


      end

      return return_value
    end

    RelationalExpressionReturnValue = define_return_scope

    #
    # parser rule relationalExpression
    #
    # (in lib/yarpl/Yarpl.g)
    # 128:1: relationalExpression : addingExpression ( ( EQUALS | NOT_EQUALS | GT | GTE | LT | LTE ) addingExpression )* ;
    #
    def relationalExpression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )


      return_value = RelationalExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set62 = nil
      addingExpression61 = nil
      addingExpression63 = nil


      tree_for_set62 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 129:7: addingExpression ( ( EQUALS | NOT_EQUALS | GT | GTE | LT | LTE ) addingExpression )*
      @state.following.push( TOKENS_FOLLOWING_addingExpression_IN_relationalExpression_807 )
      addingExpression61 = addingExpression
      @state.following.pop
      @adaptor.add_child( root_0, addingExpression61.tree )

      # at line 129:24: ( ( EQUALS | NOT_EQUALS | GT | GTE | LT | LTE ) addingExpression )*
      while true # decision 11
        alt_11 = 2
        look_11_0 = @input.peek( 1 )

        if ( look_11_0 == EQUALS || look_11_0.between?( GT, GTE ) || look_11_0.between?( LT, LTE ) || look_11_0 == NOT_EQUALS )
          alt_11 = 1

        end
        case alt_11
        when 1
          # at line 129:25: ( EQUALS | NOT_EQUALS | GT | GTE | LT | LTE ) addingExpression
          set62 = @input.look

          if @input.peek(1) == EQUALS || @input.peek( 1 ).between?( GT, GTE ) || @input.peek( 1 ).between?( LT, LTE ) || @input.peek(1) == NOT_EQUALS
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set62 ) )

            @state.error_recovery = false

          else
            mse = MismatchedSet( nil )
            raise mse

          end


          @state.following.push( TOKENS_FOLLOWING_addingExpression_IN_relationalExpression_824 )
          addingExpression63 = addingExpression
          @state.following.pop
          @adaptor.add_child( root_0, addingExpression63.tree )


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
        # trace_out( __method__, 24 )


      end

      return return_value
    end

    AddingExpressionReturnValue = define_return_scope

    #
    # parser rule addingExpression
    #
    # (in lib/yarpl/Yarpl.g)
    # 132:1: addingExpression : multiplyingExpression ( ( PLUS | MINUS ) multiplyingExpression )* ;
    #
    def addingExpression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )


      return_value = AddingExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set65 = nil
      multiplyingExpression64 = nil
      multiplyingExpression66 = nil


      tree_for_set65 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 133:7: multiplyingExpression ( ( PLUS | MINUS ) multiplyingExpression )*
      @state.following.push( TOKENS_FOLLOWING_multiplyingExpression_IN_addingExpression_843 )
      multiplyingExpression64 = multiplyingExpression
      @state.following.pop
      @adaptor.add_child( root_0, multiplyingExpression64.tree )

      # at line 133:29: ( ( PLUS | MINUS ) multiplyingExpression )*
      while true # decision 12
        alt_12 = 2
        look_12_0 = @input.peek( 1 )

        if ( look_12_0 == MINUS || look_12_0 == PLUS )
          alt_12 = 1

        end
        case alt_12
        when 1
          # at line 133:30: ( PLUS | MINUS ) multiplyingExpression
          set65 = @input.look

          if @input.peek(1) == MINUS || @input.peek(1) == PLUS
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set65 ) )

            @state.error_recovery = false

          else
            mse = MismatchedSet( nil )
            raise mse

          end


          @state.following.push( TOKENS_FOLLOWING_multiplyingExpression_IN_addingExpression_852 )
          multiplyingExpression66 = multiplyingExpression
          @state.following.pop
          @adaptor.add_child( root_0, multiplyingExpression66.tree )


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
        # trace_out( __method__, 25 )


      end

      return return_value
    end

    MultiplyingExpressionReturnValue = define_return_scope

    #
    # parser rule multiplyingExpression
    #
    # (in lib/yarpl/Yarpl.g)
    # 136:1: multiplyingExpression : signExpression ( ( TIMES | DIV | 'mod' ) signExpression )* ;
    #
    def multiplyingExpression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )


      return_value = MultiplyingExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set68 = nil
      signExpression67 = nil
      signExpression69 = nil


      tree_for_set68 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 137:7: signExpression ( ( TIMES | DIV | 'mod' ) signExpression )*
      @state.following.push( TOKENS_FOLLOWING_signExpression_IN_multiplyingExpression_871 )
      signExpression67 = signExpression
      @state.following.pop
      @adaptor.add_child( root_0, signExpression67.tree )

      # at line 137:22: ( ( TIMES | DIV | 'mod' ) signExpression )*
      while true # decision 13
        alt_13 = 2
        look_13_0 = @input.peek( 1 )

        if ( look_13_0 == DIV || look_13_0 == TIMES || look_13_0 == T__77 )
          alt_13 = 1

        end
        case alt_13
        when 1
          # at line 137:23: ( TIMES | DIV | 'mod' ) signExpression
          set68 = @input.look

          if @input.peek(1) == DIV || @input.peek(1) == TIMES || @input.peek(1) == T__77
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set68 ) )

            @state.error_recovery = false

          else
            mse = MismatchedSet( nil )
            raise mse

          end


          @state.following.push( TOKENS_FOLLOWING_signExpression_IN_multiplyingExpression_882 )
          signExpression69 = signExpression
          @state.following.pop
          @adaptor.add_child( root_0, signExpression69.tree )


        else
          break # out of loop for decision 13
        end
      end # loop for decision 13


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

    SignExpressionReturnValue = define_return_scope

    #
    # parser rule signExpression
    #
    # (in lib/yarpl/Yarpl.g)
    # 140:1: signExpression : ( PLUS | MINUS )* primeExpression ;
    #
    def signExpression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )


      return_value = SignExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set70 = nil
      primeExpression71 = nil


      tree_for_set70 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 141:7: ( PLUS | MINUS )* primeExpression
      # at line 141:7: ( PLUS | MINUS )*
      while true # decision 14
        alt_14 = 2
        look_14_0 = @input.peek( 1 )

        if ( look_14_0 == MINUS || look_14_0 == PLUS )
          alt_14 = 1

        end
        case alt_14
        when 1
          # at line 
          set70 = @input.look

          if @input.peek(1) == MINUS || @input.peek(1) == PLUS
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set70 ) )

            @state.error_recovery = false

          else
            mse = MismatchedSet( nil )
            raise mse

          end



        else
          break # out of loop for decision 14
        end
      end # loop for decision 14

      @state.following.push( TOKENS_FOLLOWING_primeExpression_IN_signExpression_908 )
      primeExpression71 = primeExpression
      @state.following.pop
      @adaptor.add_child( root_0, primeExpression71.tree )


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

    PrimeExpressionReturnValue = define_return_scope

    #
    # parser rule primeExpression
    #
    # (in lib/yarpl/Yarpl.g)
    # 144:1: primeExpression : ( primary | LPAREN expression RPAREN );
    #
    def primeExpression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )


      return_value = PrimeExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __LPAREN73__ = nil
      __RPAREN75__ = nil
      primary72 = nil
      expression74 = nil


      tree_for_LPAREN73 = nil
      tree_for_RPAREN75 = nil

      begin
      # at line 145:5: ( primary | LPAREN expression RPAREN )
      alt_15 = 2
      look_15_0 = @input.peek( 1 )

      if ( look_15_0 == IDENTIFIER || look_15_0 == INTEGERLITERAL || look_15_0 == RANGEINTEGERLITERAL )
        alt_15 = 1
      elsif ( look_15_0 == LPAREN )
        alt_15 = 2
      else
        raise NoViableAlternative( "", 15, 0 )

      end
      case alt_15
      when 1
        root_0 = @adaptor.create_flat_list


        # at line 145:7: primary
        @state.following.push( TOKENS_FOLLOWING_primary_IN_primeExpression_925 )
        primary72 = primary
        @state.following.pop
        @adaptor.add_child( root_0, primary72.tree )


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 146:7: LPAREN expression RPAREN
        __LPAREN73__ = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_primeExpression_933 )
        tree_for_LPAREN73 = @adaptor.create_with_payload( __LPAREN73__ )
        @adaptor.add_child( root_0, tree_for_LPAREN73 )


        @state.following.push( TOKENS_FOLLOWING_expression_IN_primeExpression_935 )
        expression74 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression74.tree )

        __RPAREN75__ = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_primeExpression_939 )
        tree_for_RPAREN75 = @adaptor.create_with_payload( __RPAREN75__ )
        @adaptor.add_child( root_0, tree_for_RPAREN75 )



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

    ExpressionListReturnValue = define_return_scope

    #
    # parser rule expressionList
    #
    # (in lib/yarpl/Yarpl.g)
    # 149:1: expressionList : expression ( ',' expression )* ;
    #
    def expressionList
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )


      return_value = ExpressionListReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal77 = nil
      expression76 = nil
      expression78 = nil


      tree_for_char_literal77 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 150:9: expression ( ',' expression )*
      @state.following.push( TOKENS_FOLLOWING_expression_IN_expressionList_958 )
      expression76 = expression
      @state.following.pop
      @adaptor.add_child( root_0, expression76.tree )

      # at line 150:20: ( ',' expression )*
      while true # decision 16
        alt_16 = 2
        look_16_0 = @input.peek( 1 )

        if ( look_16_0 == COMMA )
          alt_16 = 1

        end
        case alt_16
        when 1
          # at line 150:21: ',' expression
          char_literal77 = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_expressionList_961 )
          tree_for_char_literal77 = @adaptor.create_with_payload( char_literal77 )
          @adaptor.add_child( root_0, tree_for_char_literal77 )


          @state.following.push( TOKENS_FOLLOWING_expression_IN_expressionList_963 )
          expression78 = expression
          @state.following.pop
          @adaptor.add_child( root_0, expression78.tree )


        else
          break # out of loop for decision 16
        end
      end # loop for decision 16


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

    DeclarationReturnValue = define_return_scope

    #
    # parser rule declaration
    #
    # (in lib/yarpl/Yarpl.g)
    # 153:1: declaration : ( list -> list | set -> set | primary -> primary );
    #
    def declaration
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )


      return_value = DeclarationReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      list79 = nil
      set80 = nil
      primary81 = nil


      stream_set = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule set" )
      stream_primary = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule primary" )
      stream_list = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule list" )
      begin
      # at line 154:5: ( list -> list | set -> set | primary -> primary )
      alt_17 = 3
      case look_17 = @input.peek( 1 )
      when LBRACK then alt_17 = 1
      when LBRACE then alt_17 = 2
      when IDENTIFIER, INTEGERLITERAL, RANGEINTEGERLITERAL then alt_17 = 3
      else
        raise NoViableAlternative( "", 17, 0 )

      end
      case alt_17
      when 1
        # at line 154:7: list
        @state.following.push( TOKENS_FOLLOWING_list_IN_declaration_982 )
        list79 = list
        @state.following.pop
        stream_list.add( list79.tree )

        # AST Rewrite
        # elements: list
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 
        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 154:12: -> list
        @adaptor.add_child( root_0, stream_list.next_tree )




        return_value.tree = root_0



      when 2
        # at line 155:7: set
        @state.following.push( TOKENS_FOLLOWING_set_IN_declaration_994 )
        set80 = set
        @state.following.pop
        stream_set.add( set80.tree )

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
        # 155:11: -> set
        @adaptor.add_child( root_0, stream_set.next_tree )




        return_value.tree = root_0



      when 3
        # at line 156:7: primary
        @state.following.push( TOKENS_FOLLOWING_primary_IN_declaration_1006 )
        primary81 = primary
        @state.following.pop
        stream_primary.add( primary81.tree )

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
        # 156:15: -> primary
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
        # trace_out( __method__, 30 )


      end

      return return_value
    end

    DeclarationListReturnValue = define_return_scope

    #
    # parser rule declarationList
    #
    # (in lib/yarpl/Yarpl.g)
    # 159:1: declarationList : declaration ( COMMA declaration )* -> ( ^( declaration ) )* ;
    #
    def declarationList
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )


      return_value = DeclarationListReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __COMMA83__ = nil
      declaration82 = nil
      declaration84 = nil


      tree_for_COMMA83 = nil
      stream_COMMA = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token COMMA" )
      stream_declaration = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule declaration" )
      begin
      # at line 160:7: declaration ( COMMA declaration )*
      @state.following.push( TOKENS_FOLLOWING_declaration_IN_declarationList_1027 )
      declaration82 = declaration
      @state.following.pop
      stream_declaration.add( declaration82.tree )

      # at line 160:19: ( COMMA declaration )*
      while true # decision 18
        alt_18 = 2
        look_18_0 = @input.peek( 1 )

        if ( look_18_0 == COMMA )
          alt_18 = 1

        end
        case alt_18
        when 1
          # at line 160:20: COMMA declaration
          __COMMA83__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_declarationList_1030 )
          stream_COMMA.add( __COMMA83__ )

          @state.following.push( TOKENS_FOLLOWING_declaration_IN_declarationList_1032 )
          declaration84 = declaration
          @state.following.pop
          stream_declaration.add( declaration84.tree )


        else
          break # out of loop for decision 18
        end
      end # loop for decision 18

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
      # 160:40: -> ( ^( declaration ) )*
      # at line 160:43: ( ^( declaration ) )*
      while stream_declaration.has_next?
        # at line 160:43: ^( declaration )
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
        # trace_out( __method__, 31 )


      end

      return return_value
    end

    PrimaryListReturnValue = define_return_scope

    #
    # parser rule primaryList
    #
    # (in lib/yarpl/Yarpl.g)
    # 163:1: primaryList : primary ( COMMA primary )* -> ( ^( primary ) )* ;
    #
    def primaryList
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )


      return_value = PrimaryListReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __COMMA86__ = nil
      primary85 = nil
      primary87 = nil


      tree_for_COMMA86 = nil
      stream_COMMA = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token COMMA" )
      stream_primary = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule primary" )
      begin
      # at line 164:7: primary ( COMMA primary )*
      @state.following.push( TOKENS_FOLLOWING_primary_IN_primaryList_1058 )
      primary85 = primary
      @state.following.pop
      stream_primary.add( primary85.tree )

      # at line 164:15: ( COMMA primary )*
      while true # decision 19
        alt_19 = 2
        look_19_0 = @input.peek( 1 )

        if ( look_19_0 == COMMA )
          alt_19 = 1

        end
        case alt_19
        when 1
          # at line 164:16: COMMA primary
          __COMMA86__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_primaryList_1061 )
          stream_COMMA.add( __COMMA86__ )

          @state.following.push( TOKENS_FOLLOWING_primary_IN_primaryList_1063 )
          primary87 = primary
          @state.following.pop
          stream_primary.add( primary87.tree )


        else
          break # out of loop for decision 19
        end
      end # loop for decision 19

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
      # 164:32: -> ( ^( primary ) )*
      # at line 164:35: ( ^( primary ) )*
      while stream_primary.has_next?
        # at line 164:35: ^( primary )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( stream_primary.next_node, root_1 )

        @adaptor.add_child( root_0, root_1 )

      end

      stream_primary.reset();




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

    ListReturnValue = define_return_scope

    #
    # parser rule list
    #
    # (in lib/yarpl/Yarpl.g)
    # 167:1: list : '[' declarationList ']' -> ^( LIST declarationList ) ;
    #
    def list
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )


      return_value = ListReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal88 = nil
      char_literal90 = nil
      declarationList89 = nil


      tree_for_char_literal88 = nil
      tree_for_char_literal90 = nil
      stream_RBRACK = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token RBRACK" )
      stream_LBRACK = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token LBRACK" )
      stream_declarationList = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule declarationList" )
      begin
      # at line 168:7: '[' declarationList ']'
      char_literal88 = match( LBRACK, TOKENS_FOLLOWING_LBRACK_IN_list_1089 )
      stream_LBRACK.add( char_literal88 )

      @state.following.push( TOKENS_FOLLOWING_declarationList_IN_list_1091 )
      declarationList89 = declarationList
      @state.following.pop
      stream_declarationList.add( declarationList89.tree )

      char_literal90 = match( RBRACK, TOKENS_FOLLOWING_RBRACK_IN_list_1093 )
      stream_RBRACK.add( char_literal90 )

      # AST Rewrite
      # elements: declarationList
      # token labels: 
      # rule labels: return_value
      # token list labels: 
      # rule list labels: 
      # wildcard labels: 
      return_value.tree = root_0
      stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

      root_0 = @adaptor.create_flat_list
      # 168:31: -> ^( LIST declarationList )
      # at line 168:34: ^( LIST declarationList )
      root_1 = @adaptor.create_flat_list
      root_1 = @adaptor.become_root( @adaptor.create_from_type( LIST, "LIST" ), root_1 )

      @adaptor.add_child( root_1, stream_declarationList.next_tree )

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
        # trace_out( __method__, 33 )


      end

      return return_value
    end

    SetReturnValue = define_return_scope

    #
    # parser rule set
    #
    # (in lib/yarpl/Yarpl.g)
    # 171:1: set : '{' primaryList '}' -> ^( SET primaryList ) ;
    #
    def set
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )


      return_value = SetReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal91 = nil
      char_literal93 = nil
      primaryList92 = nil


      tree_for_char_literal91 = nil
      tree_for_char_literal93 = nil
      stream_RBRACE = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token RBRACE" )
      stream_LBRACE = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token LBRACE" )
      stream_primaryList = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule primaryList" )
      begin
      # at line 171:7: '{' primaryList '}'
      char_literal91 = match( LBRACE, TOKENS_FOLLOWING_LBRACE_IN_set_1114 )
      stream_LBRACE.add( char_literal91 )

      @state.following.push( TOKENS_FOLLOWING_primaryList_IN_set_1116 )
      primaryList92 = primaryList
      @state.following.pop
      stream_primaryList.add( primaryList92.tree )

      char_literal93 = match( RBRACE, TOKENS_FOLLOWING_RBRACE_IN_set_1118 )
      stream_RBRACE.add( char_literal93 )

      # AST Rewrite
      # elements: primaryList
      # token labels: 
      # rule labels: return_value
      # token list labels: 
      # rule list labels: 
      # wildcard labels: 
      return_value.tree = root_0
      stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

      root_0 = @adaptor.create_flat_list
      # 171:27: -> ^( SET primaryList )
      # at line 171:30: ^( SET primaryList )
      root_1 = @adaptor.create_flat_list
      root_1 = @adaptor.become_root( @adaptor.create_from_type( SET, "SET" ), root_1 )

      @adaptor.add_child( root_1, stream_primaryList.next_tree )

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
        # trace_out( __method__, 34 )


      end

      return return_value
    end

    PrimaryReturnValue = define_return_scope

    #
    # parser rule primary
    #
    # (in lib/yarpl/Yarpl.g)
    # 176:1: primary : literal ;
    #
    def primary
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )


      return_value = PrimaryReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      literal94 = nil



      begin
      root_0 = @adaptor.create_flat_list


      # at line 177:7: literal
      @state.following.push( TOKENS_FOLLOWING_literal_IN_primary_1145 )
      literal94 = literal
      @state.following.pop
      @adaptor.add_child( root_0, literal94.tree )


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

    CreatorReturnValue = define_return_scope

    #
    # parser rule creator
    #
    # (in lib/yarpl/Yarpl.g)
    # 180:1: creator : createdName classCreatorRest -> ^( VARIABLE_DECLARATION createdName classCreatorRest ) ;
    #
    def creator
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )


      return_value = CreatorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      createdName95 = nil
      classCreatorRest96 = nil


      stream_createdName = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule createdName" )
      stream_classCreatorRest = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule classCreatorRest" )
      begin
      # at line 181:7: createdName classCreatorRest
      @state.following.push( TOKENS_FOLLOWING_createdName_IN_creator_1159 )
      createdName95 = createdName
      @state.following.pop
      stream_createdName.add( createdName95.tree )

      @state.following.push( TOKENS_FOLLOWING_classCreatorRest_IN_creator_1161 )
      classCreatorRest96 = classCreatorRest
      @state.following.pop
      stream_classCreatorRest.add( classCreatorRest96.tree )

      # AST Rewrite
      # elements: classCreatorRest, createdName
      # token labels: 
      # rule labels: return_value
      # token list labels: 
      # rule list labels: 
      # wildcard labels: 
      return_value.tree = root_0
      stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

      root_0 = @adaptor.create_flat_list
      # 181:36: -> ^( VARIABLE_DECLARATION createdName classCreatorRest )
      # at line 181:39: ^( VARIABLE_DECLARATION createdName classCreatorRest )
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
        # trace_out( __method__, 36 )


      end

      return return_value
    end

    CreatedNameReturnValue = define_return_scope

    #
    # parser rule createdName
    #
    # (in lib/yarpl/Yarpl.g)
    # 184:1: createdName : ( structType | primitiveType );
    #
    def createdName
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )


      return_value = CreatedNameReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      structType97 = nil
      primitiveType98 = nil



      begin
      # at line 185:5: ( structType | primitiveType )
      alt_20 = 2
      look_20_0 = @input.peek( 1 )

      if ( look_20_0 == IDENTIFIER )
        alt_20 = 1
      elsif ( look_20_0 == T__76 )
        alt_20 = 2
      else
        raise NoViableAlternative( "", 20, 0 )

      end
      case alt_20
      when 1
        root_0 = @adaptor.create_flat_list


        # at line 185:7: structType
        @state.following.push( TOKENS_FOLLOWING_structType_IN_createdName_1189 )
        structType97 = structType
        @state.following.pop
        @adaptor.add_child( root_0, structType97.tree )


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 186:7: primitiveType
        @state.following.push( TOKENS_FOLLOWING_primitiveType_IN_createdName_1197 )
        primitiveType98 = primitiveType
        @state.following.pop
        @adaptor.add_child( root_0, primitiveType98.tree )


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
        # trace_out( __method__, 37 )


      end

      return return_value
    end

    ClassCreatorRestReturnValue = define_return_scope

    #
    # parser rule classCreatorRest
    #
    # (in lib/yarpl/Yarpl.g)
    # 189:1: classCreatorRest : arguments ( classBody )? ;
    #
    def classCreatorRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 38 )


      return_value = ClassCreatorRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      arguments99 = nil
      classBody100 = nil



      begin
      root_0 = @adaptor.create_flat_list


      # at line 190:7: arguments ( classBody )?
      @state.following.push( TOKENS_FOLLOWING_arguments_IN_classCreatorRest_1214 )
      arguments99 = arguments
      @state.following.pop
      @adaptor.add_child( root_0, arguments99.tree )

      # at line 190:17: ( classBody )?
      alt_21 = 2
      look_21_0 = @input.peek( 1 )

      if ( look_21_0 == LBRACE )
        alt_21 = 1
      end
      case alt_21
      when 1
        # at line 190:17: classBody
        @state.following.push( TOKENS_FOLLOWING_classBody_IN_classCreatorRest_1216 )
        classBody100 = classBody
        @state.following.pop
        @adaptor.add_child( root_0, classBody100.tree )


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

    ArgumentsReturnValue = define_return_scope

    #
    # parser rule arguments
    #
    # (in lib/yarpl/Yarpl.g)
    # 193:1: arguments : '(' ( argumentList )* ')' -> ( argumentList )* ;
    #
    def arguments
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 39 )


      return_value = ArgumentsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal101 = nil
      char_literal103 = nil
      argumentList102 = nil


      tree_for_char_literal101 = nil
      tree_for_char_literal103 = nil
      stream_RPAREN = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token RPAREN" )
      stream_LPAREN = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token LPAREN" )
      stream_argumentList = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule argumentList" )
      begin
      # at line 194:7: '(' ( argumentList )* ')'
      char_literal101 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_arguments_1234 )
      stream_LPAREN.add( char_literal101 )

      # at line 194:11: ( argumentList )*
      while true # decision 22
        alt_22 = 2
        look_22_0 = @input.peek( 1 )

        if ( look_22_0 == IDENTIFIER )
          alt_22 = 1

        end
        case alt_22
        when 1
          # at line 194:11: argumentList
          @state.following.push( TOKENS_FOLLOWING_argumentList_IN_arguments_1236 )
          argumentList102 = argumentList
          @state.following.pop
          stream_argumentList.add( argumentList102.tree )


        else
          break # out of loop for decision 22
        end
      end # loop for decision 22

      char_literal103 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_arguments_1239 )
      stream_RPAREN.add( char_literal103 )

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
      # 194:29: -> ( argumentList )*
      # at line 194:32: ( argumentList )*
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
        # trace_out( __method__, 39 )


      end

      return return_value
    end

    ArgumentListReturnValue = define_return_scope

    #
    # parser rule argumentList
    #
    # (in lib/yarpl/Yarpl.g)
    # 197:1: argumentList : argument ( ',' argument )* ;
    #
    def argumentList
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 40 )


      return_value = ArgumentListReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal105 = nil
      argument104 = nil
      argument106 = nil


      tree_for_char_literal105 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 198:7: argument ( ',' argument )*
      @state.following.push( TOKENS_FOLLOWING_argument_IN_argumentList_1261 )
      argument104 = argument
      @state.following.pop
      @adaptor.add_child( root_0, argument104.tree )

      # at line 198:16: ( ',' argument )*
      while true # decision 23
        alt_23 = 2
        look_23_0 = @input.peek( 1 )

        if ( look_23_0 == COMMA )
          alt_23 = 1

        end
        case alt_23
        when 1
          # at line 198:17: ',' argument
          char_literal105 = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_argumentList_1264 )
          tree_for_char_literal105 = @adaptor.create_with_payload( char_literal105 )
          @adaptor.add_child( root_0, tree_for_char_literal105 )


          @state.following.push( TOKENS_FOLLOWING_argument_IN_argumentList_1266 )
          argument106 = argument
          @state.following.pop
          @adaptor.add_child( root_0, argument106.tree )


        else
          break # out of loop for decision 23
        end
      end # loop for decision 23


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

    ArgumentReturnValue = define_return_scope

    #
    # parser rule argument
    #
    # (in lib/yarpl/Yarpl.g)
    # 202:1: argument : IDENTIFIER '=' declaration -> ^( ATTRIBUTE IDENTIFIER declaration ) ;
    #
    def argument
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 41 )


      return_value = ArgumentReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __IDENTIFIER107__ = nil
      char_literal108 = nil
      declaration109 = nil


      tree_for_IDENTIFIER107 = nil
      tree_for_char_literal108 = nil
      stream_IDENTIFIER = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token IDENTIFIER" )
      stream_ASSIGN = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token ASSIGN" )
      stream_declaration = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule declaration" )
      begin
      # at line 203:8: IDENTIFIER '=' declaration
      __IDENTIFIER107__ = match( IDENTIFIER, TOKENS_FOLLOWING_IDENTIFIER_IN_argument_1287 )
      stream_IDENTIFIER.add( __IDENTIFIER107__ )

      char_literal108 = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_argument_1289 )
      stream_ASSIGN.add( char_literal108 )

      @state.following.push( TOKENS_FOLLOWING_declaration_IN_argument_1291 )
      declaration109 = declaration
      @state.following.pop
      stream_declaration.add( declaration109.tree )

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
      # 203:35: -> ^( ATTRIBUTE IDENTIFIER declaration )
      # at line 203:38: ^( ATTRIBUTE IDENTIFIER declaration )
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
        # trace_out( __method__, 41 )


      end

      return return_value
    end

    LiteralReturnValue = define_return_scope

    #
    # parser rule literal
    #
    # (in lib/yarpl/Yarpl.g)
    # 207:1: literal : ( RANGEINTEGERLITERAL | INTEGERLITERAL | IDENTIFIER );
    #
    def literal
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 42 )


      return_value = LiteralReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set110 = nil


      tree_for_set110 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 
      set110 = @input.look

      if @input.peek(1) == IDENTIFIER || @input.peek(1) == INTEGERLITERAL || @input.peek(1) == RANGEINTEGERLITERAL
        @input.consume
        @adaptor.add_child( root_0, @adaptor.create_with_payload( set110 ) )

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
        # trace_out( __method__, 42 )


      end

      return return_value
    end

    TypeReturnValue = define_return_scope

    #
    # parser rule type
    #
    # (in lib/yarpl/Yarpl.g)
    # 213:1: type : ( structType -> ^( structType ) | primitiveType -> ^( primitiveType ) );
    #
    def type
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 43 )


      return_value = TypeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      structType111 = nil
      primitiveType112 = nil


      stream_primitiveType = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule primitiveType" )
      stream_structType = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule structType" )
      begin
      # at line 214:5: ( structType -> ^( structType ) | primitiveType -> ^( primitiveType ) )
      alt_24 = 2
      look_24_0 = @input.peek( 1 )

      if ( look_24_0 == IDENTIFIER )
        alt_24 = 1
      elsif ( look_24_0 == T__76 )
        alt_24 = 2
      else
        raise NoViableAlternative( "", 24, 0 )

      end
      case alt_24
      when 1
        # at line 214:7: structType
        @state.following.push( TOKENS_FOLLOWING_structType_IN_type_1341 )
        structType111 = structType
        @state.following.pop
        stream_structType.add( structType111.tree )

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
        # 214:18: -> ^( structType )
        # at line 214:21: ^( structType )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( stream_structType.next_node, root_1 )

        @adaptor.add_child( root_0, root_1 )




        return_value.tree = root_0



      when 2
        # at line 215:7: primitiveType
        @state.following.push( TOKENS_FOLLOWING_primitiveType_IN_type_1355 )
        primitiveType112 = primitiveType
        @state.following.pop
        stream_primitiveType.add( primitiveType112.tree )

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
        # 215:21: -> ^( primitiveType )
        # at line 215:24: ^( primitiveType )
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
        # trace_out( __method__, 43 )


      end

      return return_value
    end

    StructTypeReturnValue = define_return_scope

    #
    # parser rule structType
    #
    # (in lib/yarpl/Yarpl.g)
    # 218:1: structType : IDENTIFIER ;
    #
    def structType
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 44 )


      return_value = StructTypeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __IDENTIFIER113__ = nil


      tree_for_IDENTIFIER113 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 219:7: IDENTIFIER
      __IDENTIFIER113__ = match( IDENTIFIER, TOKENS_FOLLOWING_IDENTIFIER_IN_structType_1378 )
      tree_for_IDENTIFIER113 = @adaptor.create_with_payload( __IDENTIFIER113__ )
      @adaptor.add_child( root_0, tree_for_IDENTIFIER113 )



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
        # trace_out( __method__, 44 )


      end

      return return_value
    end

    PrimitiveTypeReturnValue = define_return_scope

    #
    # parser rule primitiveType
    #
    # (in lib/yarpl/Yarpl.g)
    # 222:1: primitiveType : 'integer' -> ^( INTEGER ) ;
    #
    def primitiveType
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 45 )


      return_value = PrimitiveTypeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal114 = nil


      tree_for_string_literal114 = nil
      stream_T__76 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__76" )

      begin
      # at line 223:7: 'integer'
      string_literal114 = match( T__76, TOKENS_FOLLOWING_T__76_IN_primitiveType_1395 )
      stream_T__76.add( string_literal114 )

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
      # 223:17: -> ^( INTEGER )
      # at line 223:20: ^( INTEGER )
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
        # trace_out( __method__, 45 )


      end

      return return_value
    end

    VariableTypeReturnValue = define_return_scope

    #
    # parser rule variableType
    #
    # (in lib/yarpl/Yarpl.g)
    # 226:1: variableType : ( 'var' -> ^( VARIABLE ) | 'const' -> ^( CONSTANT ) );
    #
    def variableType
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 46 )


      return_value = VariableTypeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal115 = nil
      string_literal116 = nil


      tree_for_string_literal115 = nil
      tree_for_string_literal116 = nil
      stream_T__72 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__72" )
      stream_T__81 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__81" )

      begin
      # at line 227:5: ( 'var' -> ^( VARIABLE ) | 'const' -> ^( CONSTANT ) )
      alt_25 = 2
      look_25_0 = @input.peek( 1 )

      if ( look_25_0 == T__81 )
        alt_25 = 1
      elsif ( look_25_0 == T__72 )
        alt_25 = 2
      else
        raise NoViableAlternative( "", 25, 0 )

      end
      case alt_25
      when 1
        # at line 227:7: 'var'
        string_literal115 = match( T__81, TOKENS_FOLLOWING_T__81_IN_variableType_1418 )
        stream_T__81.add( string_literal115 )

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
        # 227:13: -> ^( VARIABLE )
        # at line 227:16: ^( VARIABLE )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( VARIABLE, "VARIABLE" ), root_1 )

        @adaptor.add_child( root_0, root_1 )




        return_value.tree = root_0



      when 2
        # at line 228:7: 'const'
        string_literal116 = match( T__72, TOKENS_FOLLOWING_T__72_IN_variableType_1432 )
        stream_T__72.add( string_literal116 )

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
        # 228:15: -> ^( CONSTANT )
        # at line 228:18: ^( CONSTANT )
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
        # trace_out( __method__, 46 )


      end

      return return_value
    end



    TOKENS_FOLLOWING_program_IN_start_143 = Set[ 1, 74, 75 ]
    TOKENS_FOLLOWING_domainDeclaration_IN_program_190 = Set[ 1 ]
    TOKENS_FOLLOWING_initialDeclaration_IN_program_202 = Set[ 1 ]
    TOKENS_FOLLOWING_T__74_IN_domainDeclaration_220 = Set[ 36 ]
    TOKENS_FOLLOWING_domainBody_IN_domainDeclaration_222 = Set[ 1 ]
    TOKENS_FOLLOWING_LBRACE_IN_domainBody_247 = Set[ 53, 71 ]
    TOKENS_FOLLOWING_domainBodyDeclaration_IN_domainBody_249 = Set[ 53, 71 ]
    TOKENS_FOLLOWING_RBRACE_IN_domainBody_252 = Set[ 1 ]
    TOKENS_FOLLOWING_typeDeclaration_IN_domainBodyDeclaration_274 = Set[ 1 ]
    TOKENS_FOLLOWING_T__75_IN_initialDeclaration_292 = Set[ 36 ]
    TOKENS_FOLLOWING_initialBody_IN_initialDeclaration_294 = Set[ 1 ]
    TOKENS_FOLLOWING_LBRACE_IN_initialBody_320 = Set[ 31, 53, 73 ]
    TOKENS_FOLLOWING_initialBodyDeclaration_IN_initialBody_322 = Set[ 31, 53, 73 ]
    TOKENS_FOLLOWING_RBRACE_IN_initialBody_325 = Set[ 1 ]
    TOKENS_FOLLOWING_localVariableDeclaration_IN_initialBodyDeclaration_347 = Set[ 1 ]
    TOKENS_FOLLOWING_constraintDeclaration_IN_initialBodyDeclaration_355 = Set[ 1 ]
    TOKENS_FOLLOWING_classDeclaration_IN_typeDeclaration_372 = Set[ 1 ]
    TOKENS_FOLLOWING_T__71_IN_classDeclaration_397 = Set[ 31 ]
    TOKENS_FOLLOWING_IDENTIFIER_IN_classDeclaration_399 = Set[ 36 ]
    TOKENS_FOLLOWING_classBody_IN_classDeclaration_401 = Set[ 1 ]
    TOKENS_FOLLOWING_LBRACE_IN_classBody_423 = Set[ 53, 72, 80, 81 ]
    TOKENS_FOLLOWING_classBodyDeclaration_IN_classBody_425 = Set[ 53, 72, 80, 81 ]
    TOKENS_FOLLOWING_RBRACE_IN_classBody_428 = Set[ 1 ]
    TOKENS_FOLLOWING_memberDeclaration_IN_classBodyDeclaration_447 = Set[ 1 ]
    TOKENS_FOLLOWING_fieldDeclaration_IN_memberDeclaration_467 = Set[ 1 ]
    TOKENS_FOLLOWING_variableType_IN_fieldDeclaration_489 = Set[ 31, 76 ]
    TOKENS_FOLLOWING_type_IN_fieldDeclaration_491 = Set[ 31 ]
    TOKENS_FOLLOWING_variableDeclaratorId_IN_fieldDeclaration_493 = Set[ 57 ]
    TOKENS_FOLLOWING_SEMI_IN_fieldDeclaration_495 = Set[ 1 ]
    TOKENS_FOLLOWING_T__80_IN_fieldDeclaration_515 = Set[ 41 ]
    TOKENS_FOLLOWING_LPAREN_IN_fieldDeclaration_517 = Set[ 31 ]
    TOKENS_FOLLOWING_IDENTIFIER_IN_fieldDeclaration_519 = Set[ 56 ]
    TOKENS_FOLLOWING_RPAREN_IN_fieldDeclaration_521 = Set[ 31 ]
    TOKENS_FOLLOWING_variableDeclaratorId_IN_fieldDeclaration_523 = Set[ 57 ]
    TOKENS_FOLLOWING_SEMI_IN_fieldDeclaration_525 = Set[ 1 ]
    TOKENS_FOLLOWING_IDENTIFIER_IN_fieldAccessor_552 = Set[ 25 ]
    TOKENS_FOLLOWING_DOT_IN_fieldAccessor_554 = Set[ 31 ]
    TOKENS_FOLLOWING_IDENTIFIER_IN_fieldAccessor_556 = Set[ 1 ]
    TOKENS_FOLLOWING_variableDeclarator_IN_variableDeclarators_583 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_COMMA_IN_variableDeclarators_586 = Set[ 31 ]
    TOKENS_FOLLOWING_variableDeclarator_IN_variableDeclarators_588 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_variableDeclaratorId_IN_variableDeclarator_607 = Set[ 7 ]
    TOKENS_FOLLOWING_ASSIGN_IN_variableDeclarator_609 = Set[ 78 ]
    TOKENS_FOLLOWING_variableInitializer_IN_variableDeclarator_611 = Set[ 1 ]
    TOKENS_FOLLOWING_IDENTIFIER_IN_variableDeclaratorId_638 = Set[ 1 ]
    TOKENS_FOLLOWING_T__78_IN_variableInitializer_655 = Set[ 31, 76 ]
    TOKENS_FOLLOWING_creator_IN_variableInitializer_657 = Set[ 1 ]
    TOKENS_FOLLOWING_variableDeclarators_IN_localVariableDeclaration_678 = Set[ 57 ]
    TOKENS_FOLLOWING_SEMI_IN_localVariableDeclaration_680 = Set[ 1 ]
    TOKENS_FOLLOWING_T__73_IN_constraintDeclaration_701 = Set[ 36 ]
    TOKENS_FOLLOWING_constraintBody_IN_constraintDeclaration_703 = Set[ 1 ]
    TOKENS_FOLLOWING_LBRACE_IN_constraintBody_728 = Set[ 31, 35, 41, 45, 50, 52 ]
    TOKENS_FOLLOWING_expression_IN_constraintBody_730 = Set[ 53 ]
    TOKENS_FOLLOWING_RBRACE_IN_constraintBody_732 = Set[ 1 ]
    TOKENS_FOLLOWING_relationalExpression_IN_expression_757 = Set[ 1, 70, 79 ]
    TOKENS_FOLLOWING_set_IN_expression_760 = Set[ 31, 35, 41, 45, 50, 52 ]
    TOKENS_FOLLOWING_relationalExpression_IN_expression_766 = Set[ 1, 70, 79 ]
    TOKENS_FOLLOWING_fieldAccessor_IN_expression_776 = Set[ 26 ]
    TOKENS_FOLLOWING_EQUALS_IN_expression_778 = Set[ 31 ]
    TOKENS_FOLLOWING_fieldAccessor_IN_expression_780 = Set[ 1 ]
    TOKENS_FOLLOWING_addingExpression_IN_relationalExpression_807 = Set[ 1, 26, 29, 30, 42, 43, 48 ]
    TOKENS_FOLLOWING_set_IN_relationalExpression_810 = Set[ 31, 35, 41, 45, 50, 52 ]
    TOKENS_FOLLOWING_addingExpression_IN_relationalExpression_824 = Set[ 1, 26, 29, 30, 42, 43, 48 ]
    TOKENS_FOLLOWING_multiplyingExpression_IN_addingExpression_843 = Set[ 1, 45, 50 ]
    TOKENS_FOLLOWING_set_IN_addingExpression_846 = Set[ 31, 35, 41, 45, 50, 52 ]
    TOKENS_FOLLOWING_multiplyingExpression_IN_addingExpression_852 = Set[ 1, 45, 50 ]
    TOKENS_FOLLOWING_signExpression_IN_multiplyingExpression_871 = Set[ 1, 21, 61, 77 ]
    TOKENS_FOLLOWING_set_IN_multiplyingExpression_874 = Set[ 31, 35, 41, 45, 50, 52 ]
    TOKENS_FOLLOWING_signExpression_IN_multiplyingExpression_882 = Set[ 1, 21, 61, 77 ]
    TOKENS_FOLLOWING_primeExpression_IN_signExpression_908 = Set[ 1 ]
    TOKENS_FOLLOWING_primary_IN_primeExpression_925 = Set[ 1 ]
    TOKENS_FOLLOWING_LPAREN_IN_primeExpression_933 = Set[ 31, 35, 41, 45, 50, 52 ]
    TOKENS_FOLLOWING_expression_IN_primeExpression_935 = Set[ 56 ]
    TOKENS_FOLLOWING_RPAREN_IN_primeExpression_939 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_expressionList_958 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_COMMA_IN_expressionList_961 = Set[ 31, 35, 41, 45, 50, 52 ]
    TOKENS_FOLLOWING_expression_IN_expressionList_963 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_list_IN_declaration_982 = Set[ 1 ]
    TOKENS_FOLLOWING_set_IN_declaration_994 = Set[ 1 ]
    TOKENS_FOLLOWING_primary_IN_declaration_1006 = Set[ 1 ]
    TOKENS_FOLLOWING_declaration_IN_declarationList_1027 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_COMMA_IN_declarationList_1030 = Set[ 31, 35, 36, 37, 52 ]
    TOKENS_FOLLOWING_declaration_IN_declarationList_1032 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_primary_IN_primaryList_1058 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_COMMA_IN_primaryList_1061 = Set[ 31, 35, 52 ]
    TOKENS_FOLLOWING_primary_IN_primaryList_1063 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_LBRACK_IN_list_1089 = Set[ 31, 35, 36, 37, 52 ]
    TOKENS_FOLLOWING_declarationList_IN_list_1091 = Set[ 54 ]
    TOKENS_FOLLOWING_RBRACK_IN_list_1093 = Set[ 1 ]
    TOKENS_FOLLOWING_LBRACE_IN_set_1114 = Set[ 31, 35, 52 ]
    TOKENS_FOLLOWING_primaryList_IN_set_1116 = Set[ 53 ]
    TOKENS_FOLLOWING_RBRACE_IN_set_1118 = Set[ 1 ]
    TOKENS_FOLLOWING_literal_IN_primary_1145 = Set[ 1 ]
    TOKENS_FOLLOWING_createdName_IN_creator_1159 = Set[ 41 ]
    TOKENS_FOLLOWING_classCreatorRest_IN_creator_1161 = Set[ 1 ]
    TOKENS_FOLLOWING_structType_IN_createdName_1189 = Set[ 1 ]
    TOKENS_FOLLOWING_primitiveType_IN_createdName_1197 = Set[ 1 ]
    TOKENS_FOLLOWING_arguments_IN_classCreatorRest_1214 = Set[ 1, 36 ]
    TOKENS_FOLLOWING_classBody_IN_classCreatorRest_1216 = Set[ 1 ]
    TOKENS_FOLLOWING_LPAREN_IN_arguments_1234 = Set[ 31, 56 ]
    TOKENS_FOLLOWING_argumentList_IN_arguments_1236 = Set[ 31, 56 ]
    TOKENS_FOLLOWING_RPAREN_IN_arguments_1239 = Set[ 1 ]
    TOKENS_FOLLOWING_argument_IN_argumentList_1261 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_COMMA_IN_argumentList_1264 = Set[ 31 ]
    TOKENS_FOLLOWING_argument_IN_argumentList_1266 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_IDENTIFIER_IN_argument_1287 = Set[ 7 ]
    TOKENS_FOLLOWING_ASSIGN_IN_argument_1289 = Set[ 31, 35, 36, 37, 52 ]
    TOKENS_FOLLOWING_declaration_IN_argument_1291 = Set[ 1 ]
    TOKENS_FOLLOWING_structType_IN_type_1341 = Set[ 1 ]
    TOKENS_FOLLOWING_primitiveType_IN_type_1355 = Set[ 1 ]
    TOKENS_FOLLOWING_IDENTIFIER_IN_structType_1378 = Set[ 1 ]
    TOKENS_FOLLOWING_T__76_IN_primitiveType_1395 = Set[ 1 ]
    TOKENS_FOLLOWING_T__81_IN_variableType_1418 = Set[ 1 ]
    TOKENS_FOLLOWING_T__72_IN_variableType_1432 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0

end

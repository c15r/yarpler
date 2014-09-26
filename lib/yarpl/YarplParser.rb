#!/usr/bin/env ruby
#
# Yarpl.g
# --
# Generated using ANTLR version: 3.5
# Ruby runtime library version: 1.10.0
# Input grammar file: Yarpl.g
# Generated at: 2014-09-26 14:36:43
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
    define_tokens( :EOF => -1, :T__73 => 73, :T__74 => 74, :T__75 => 75, 
                   :T__76 => 76, :T__77 => 77, :T__78 => 78, :T__79 => 79, 
                   :T__80 => 80, :T__81 => 81, :T__82 => 82, :T__83 => 83, 
                   :ALPHABET => 4, :ALPHANUMERIC => 5, :AND => 6, :ASSIGN => 7, 
                   :ATTRIBUTE => 8, :BANG => 9, :CLASS_BODY => 10, :CLASS_BODY_DECLARATION => 11, 
                   :CLASS_DECLARATION => 12, :COLON => 13, :COMMA => 14, 
                   :COMMENT => 15, :CONSTANT => 16, :CONSTRAINT_DECLARATION => 17, 
                   :CONSTRAINT_EXPRESSION => 18, :DEC => 19, :DIGIT => 20, 
                   :DIGITORUNDERSCORE => 21, :DIGITS => 22, :DIV => 23, 
                   :DOMAIN_BODY => 24, :DOMAIN_BODY_DECLARATION => 25, :DOMAIN_DECLARATION => 26, 
                   :DOT => 27, :EQUALS => 28, :FIELD_ACCESSOR => 29, :FIELD_DECLARATION => 30, 
                   :GT => 31, :GTE => 32, :IDENTIFIER => 33, :INC => 34, 
                   :INITIAL_BODY => 35, :INITIAL_DECLARATION => 36, :INTEGER => 37, 
                   :INTEGERLITERAL => 38, :LBRACE => 39, :LBRACK => 40, 
                   :LINE_COMMENT => 41, :LOWERCASE => 42, :LPAREN => 43, 
                   :LT => 44, :LTE => 45, :MEMBER_DECLARATION => 46, :MINUS => 47, 
                   :MOD => 48, :NONZERODIGIT => 49, :NOT_EQUALS => 50, :OR => 51, 
                   :PLUS => 52, :PROGRAM => 53, :QUESTION => 54, :RANGEINTEGERLITERAL => 55, 
                   :RBRACE => 56, :RBRACK => 57, :RPAREN => 58, :SEMI => 59, 
                   :SET => 60, :SIGN => 61, :START => 62, :TIMES => 63, 
                   :TYPE_DECLARATION => 64, :UPPERCASE => 65, :VARIABLE => 66, 
                   :VARIABLE_DECLARATION => 67, :VARIABLE_DECLARATOR => 68, 
                   :VARIABLE_TYPE => 69, :WS => 70, :YARPL_LETTER => 71, 
                   :YARPL_LETTERORDIGIT => 72 )


    # register the proper human-readable name or literal value
    # for each token type
    #
    # this is necessary because anonymous tokens, which are
    # created from literal values in the grammar, do not
    # have descriptive names
    register_names( "ALPHABET", "ALPHANUMERIC", "AND", "ASSIGN", "ATTRIBUTE", 
                    "BANG", "CLASS_BODY", "CLASS_BODY_DECLARATION", "CLASS_DECLARATION", 
                    "COLON", "COMMA", "COMMENT", "CONSTANT", "CONSTRAINT_DECLARATION", 
                    "CONSTRAINT_EXPRESSION", "DEC", "DIGIT", "DIGITORUNDERSCORE", 
                    "DIGITS", "DIV", "DOMAIN_BODY", "DOMAIN_BODY_DECLARATION", 
                    "DOMAIN_DECLARATION", "DOT", "EQUALS", "FIELD_ACCESSOR", 
                    "FIELD_DECLARATION", "GT", "GTE", "IDENTIFIER", "INC", 
                    "INITIAL_BODY", "INITIAL_DECLARATION", "INTEGER", "INTEGERLITERAL", 
                    "LBRACE", "LBRACK", "LINE_COMMENT", "LOWERCASE", "LPAREN", 
                    "LT", "LTE", "MEMBER_DECLARATION", "MINUS", "MOD", "NONZERODIGIT", 
                    "NOT_EQUALS", "OR", "PLUS", "PROGRAM", "QUESTION", "RANGEINTEGERLITERAL", 
                    "RBRACE", "RBRACK", "RPAREN", "SEMI", "SET", "SIGN", 
                    "START", "TIMES", "TYPE_DECLARATION", "UPPERCASE", "VARIABLE", 
                    "VARIABLE_DECLARATION", "VARIABLE_DECLARATOR", "VARIABLE_TYPE", 
                    "WS", "YARPL_LETTER", "YARPL_LETTERORDIGIT", "'and'", 
                    "'class'", "'const'", "'constraint'", "'domain'", "'initial'", 
                    "'integer'", "'mod'", "'new'", "'or'", "'var'" )


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
                     :primeExpression, :expressionList, :declaration, :set, 
                     :setDeclaration, :primary, :creator, :createdName, 
                     :classCreatorRest, :arguments, :argumentList, :argument, 
                     :literal, :type, :structType, :primitiveType, :variableType ].freeze

    include TokenData

    begin
      generated_using( "Yarpl.g", "3.5", "1.10.0" )
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
    # (in Yarpl.g)
    # 35:1: start : ( program )* -> ^( START ( program )* ) ;
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
      # at line 36:7: ( program )*
      # at line 36:7: ( program )*
      while true # decision 1
        alt_1 = 2
        look_1_0 = @input.peek( 1 )

        if ( look_1_0.between?( T__77, T__78 ) )
          alt_1 = 1

        end
        case alt_1
        when 1
          # at line 36:7: program
          @state.following.push( TOKENS_FOLLOWING_program_IN_start_158 )
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
      # 36:16: -> ^( START ( program )* )
      # at line 36:19: ^( START ( program )* )
      root_1 = @adaptor.create_flat_list
      root_1 = @adaptor.become_root( @adaptor.create_from_type( START, "START" ), root_1 )

      # at line 36:27: ( program )*
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
    # (in Yarpl.g)
    # 39:1: program : ( domainDeclaration -> domainDeclaration | initialDeclaration -> initialDeclaration );
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
      # at line 40:5: ( domainDeclaration -> domainDeclaration | initialDeclaration -> initialDeclaration )
      alt_2 = 2
      look_2_0 = @input.peek( 1 )

      if ( look_2_0 == T__77 )
        alt_2 = 1
      elsif ( look_2_0 == T__78 )
        alt_2 = 2
      else
        raise NoViableAlternative( "", 2, 0 )

      end
      case alt_2
      when 1
        # at line 40:7: domainDeclaration
        @state.following.push( TOKENS_FOLLOWING_domainDeclaration_IN_program_205 )
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
        # 40:25: -> domainDeclaration
        @adaptor.add_child( root_0, stream_domainDeclaration.next_tree )




        return_value.tree = root_0



      when 2
        # at line 41:7: initialDeclaration
        @state.following.push( TOKENS_FOLLOWING_initialDeclaration_IN_program_217 )
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
        # 41:26: -> initialDeclaration
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
    # (in Yarpl.g)
    # 44:1: domainDeclaration : 'domain' domainBody -> ^( DOMAIN_DECLARATION domainBody ) ;
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
      stream_T__77 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__77" )
      stream_domainBody = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule domainBody" )
      begin
      # at line 45:7: 'domain' domainBody
      string_literal4 = match( T__77, TOKENS_FOLLOWING_T__77_IN_domainDeclaration_235 )
      stream_T__77.add( string_literal4 )

      @state.following.push( TOKENS_FOLLOWING_domainBody_IN_domainDeclaration_237 )
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
      # 45:27: -> ^( DOMAIN_DECLARATION domainBody )
      # at line 45:30: ^( DOMAIN_DECLARATION domainBody )
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
    # (in Yarpl.g)
    # 48:1: domainBody : '{' ( domainBodyDeclaration )* '}' -> ( domainBodyDeclaration )* ;
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
      # at line 49:7: '{' ( domainBodyDeclaration )* '}'
      char_literal6 = match( LBRACE, TOKENS_FOLLOWING_LBRACE_IN_domainBody_262 )
      stream_LBRACE.add( char_literal6 )

      # at line 49:11: ( domainBodyDeclaration )*
      while true # decision 3
        alt_3 = 2
        look_3_0 = @input.peek( 1 )

        if ( look_3_0 == T__74 )
          alt_3 = 1

        end
        case alt_3
        when 1
          # at line 49:11: domainBodyDeclaration
          @state.following.push( TOKENS_FOLLOWING_domainBodyDeclaration_IN_domainBody_264 )
          domainBodyDeclaration7 = domainBodyDeclaration
          @state.following.pop
          stream_domainBodyDeclaration.add( domainBodyDeclaration7.tree )


        else
          break # out of loop for decision 3
        end
      end # loop for decision 3

      char_literal8 = match( RBRACE, TOKENS_FOLLOWING_RBRACE_IN_domainBody_267 )
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
      # 49:38: -> ( domainBodyDeclaration )*
      # at line 49:41: ( domainBodyDeclaration )*
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
    # (in Yarpl.g)
    # 52:1: domainBodyDeclaration : typeDeclaration -> typeDeclaration ;
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
      # at line 53:7: typeDeclaration
      @state.following.push( TOKENS_FOLLOWING_typeDeclaration_IN_domainBodyDeclaration_289 )
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
      # 53:23: -> typeDeclaration
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
    # (in Yarpl.g)
    # 56:1: initialDeclaration : 'initial' initialBody -> ^( INITIAL_DECLARATION initialBody ) ;
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
      stream_T__78 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__78" )
      stream_initialBody = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule initialBody" )
      begin
      # at line 57:7: 'initial' initialBody
      string_literal10 = match( T__78, TOKENS_FOLLOWING_T__78_IN_initialDeclaration_307 )
      stream_T__78.add( string_literal10 )

      @state.following.push( TOKENS_FOLLOWING_initialBody_IN_initialDeclaration_309 )
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
      # 57:30: -> ^( INITIAL_DECLARATION initialBody )
      # at line 57:33: ^( INITIAL_DECLARATION initialBody )
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
    # (in Yarpl.g)
    # 60:1: initialBody : '{' ( initialBodyDeclaration )* '}' -> ( initialBodyDeclaration )* ;
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
      # at line 61:7: '{' ( initialBodyDeclaration )* '}'
      char_literal12 = match( LBRACE, TOKENS_FOLLOWING_LBRACE_IN_initialBody_335 )
      stream_LBRACE.add( char_literal12 )

      # at line 61:11: ( initialBodyDeclaration )*
      while true # decision 4
        alt_4 = 2
        look_4_0 = @input.peek( 1 )

        if ( look_4_0 == IDENTIFIER || look_4_0 == T__76 )
          alt_4 = 1

        end
        case alt_4
        when 1
          # at line 61:11: initialBodyDeclaration
          @state.following.push( TOKENS_FOLLOWING_initialBodyDeclaration_IN_initialBody_337 )
          initialBodyDeclaration13 = initialBodyDeclaration
          @state.following.pop
          stream_initialBodyDeclaration.add( initialBodyDeclaration13.tree )


        else
          break # out of loop for decision 4
        end
      end # loop for decision 4

      char_literal14 = match( RBRACE, TOKENS_FOLLOWING_RBRACE_IN_initialBody_340 )
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
      # 61:39: -> ( initialBodyDeclaration )*
      # at line 61:42: ( initialBodyDeclaration )*
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
    # (in Yarpl.g)
    # 64:1: initialBodyDeclaration : ( localVariableDeclaration | constraintDeclaration );
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
      # at line 65:5: ( localVariableDeclaration | constraintDeclaration )
      alt_5 = 2
      look_5_0 = @input.peek( 1 )

      if ( look_5_0 == IDENTIFIER )
        alt_5 = 1
      elsif ( look_5_0 == T__76 )
        alt_5 = 2
      else
        raise NoViableAlternative( "", 5, 0 )

      end
      case alt_5
      when 1
        root_0 = @adaptor.create_flat_list


        # at line 65:7: localVariableDeclaration
        @state.following.push( TOKENS_FOLLOWING_localVariableDeclaration_IN_initialBodyDeclaration_362 )
        localVariableDeclaration15 = localVariableDeclaration
        @state.following.pop
        @adaptor.add_child( root_0, localVariableDeclaration15.tree )


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 66:7: constraintDeclaration
        @state.following.push( TOKENS_FOLLOWING_constraintDeclaration_IN_initialBodyDeclaration_370 )
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
    # (in Yarpl.g)
    # 69:1: typeDeclaration : classDeclaration -> ^( CLASS_DECLARATION classDeclaration ) ;
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
      # at line 70:7: classDeclaration
      @state.following.push( TOKENS_FOLLOWING_classDeclaration_IN_typeDeclaration_387 )
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
      # 70:24: -> ^( CLASS_DECLARATION classDeclaration )
      # at line 70:27: ^( CLASS_DECLARATION classDeclaration )
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
    # (in Yarpl.g)
    # 73:1: classDeclaration : 'class' IDENTIFIER classBody -> ^( IDENTIFIER classBody ) ;
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
      stream_T__74 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__74" )
      stream_IDENTIFIER = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token IDENTIFIER" )
      stream_classBody = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule classBody" )
      begin
      # at line 74:7: 'class' IDENTIFIER classBody
      string_literal18 = match( T__74, TOKENS_FOLLOWING_T__74_IN_classDeclaration_412 )
      stream_T__74.add( string_literal18 )

      __IDENTIFIER19__ = match( IDENTIFIER, TOKENS_FOLLOWING_IDENTIFIER_IN_classDeclaration_414 )
      stream_IDENTIFIER.add( __IDENTIFIER19__ )

      @state.following.push( TOKENS_FOLLOWING_classBody_IN_classDeclaration_416 )
      classBody20 = classBody
      @state.following.pop
      stream_classBody.add( classBody20.tree )

      # AST Rewrite
      # elements: classBody, IDENTIFIER
      # token labels: 
      # rule labels: return_value
      # token list labels: 
      # rule list labels: 
      # wildcard labels: 
      return_value.tree = root_0
      stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

      root_0 = @adaptor.create_flat_list
      # 74:36: -> ^( IDENTIFIER classBody )
      # at line 74:39: ^( IDENTIFIER classBody )
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
    # (in Yarpl.g)
    # 77:1: classBody : '{' ( classBodyDeclaration )* '}' -> ( classBodyDeclaration )* ;
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
      # at line 78:7: '{' ( classBodyDeclaration )* '}'
      char_literal21 = match( LBRACE, TOKENS_FOLLOWING_LBRACE_IN_classBody_438 )
      stream_LBRACE.add( char_literal21 )

      # at line 78:11: ( classBodyDeclaration )*
      while true # decision 6
        alt_6 = 2
        look_6_0 = @input.peek( 1 )

        if ( look_6_0 == T__75 || look_6_0 == T__83 )
          alt_6 = 1

        end
        case alt_6
        when 1
          # at line 78:11: classBodyDeclaration
          @state.following.push( TOKENS_FOLLOWING_classBodyDeclaration_IN_classBody_440 )
          classBodyDeclaration22 = classBodyDeclaration
          @state.following.pop
          stream_classBodyDeclaration.add( classBodyDeclaration22.tree )


        else
          break # out of loop for decision 6
        end
      end # loop for decision 6

      char_literal23 = match( RBRACE, TOKENS_FOLLOWING_RBRACE_IN_classBody_443 )
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
      # 78:37: -> ( classBodyDeclaration )*
      # at line 78:40: ( classBodyDeclaration )*
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
    # (in Yarpl.g)
    # 81:1: classBodyDeclaration : memberDeclaration -> ^( memberDeclaration ) ;
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
      # at line 82:7: memberDeclaration
      @state.following.push( TOKENS_FOLLOWING_memberDeclaration_IN_classBodyDeclaration_462 )
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
      # 82:25: -> ^( memberDeclaration )
      # at line 82:28: ^( memberDeclaration )
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
    # (in Yarpl.g)
    # 85:1: memberDeclaration : fieldDeclaration -> fieldDeclaration ;
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
      # at line 86:7: fieldDeclaration
      @state.following.push( TOKENS_FOLLOWING_fieldDeclaration_IN_memberDeclaration_482 )
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
      # 86:24: -> fieldDeclaration
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
    # (in Yarpl.g)
    # 89:1: fieldDeclaration : variableType type variableDeclaratorId ';' -> ^( FIELD_DECLARATION variableType type variableDeclaratorId ) ;
    #
    def fieldDeclaration
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )


      return_value = FieldDeclarationReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal29 = nil
      variableType26 = nil
      type27 = nil
      variableDeclaratorId28 = nil


      tree_for_char_literal29 = nil
      stream_SEMI = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token SEMI" )
      stream_variableType = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule variableType" )
      stream_variableDeclaratorId = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule variableDeclaratorId" )
      stream_type = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule type" )
      begin
      # at line 90:7: variableType type variableDeclaratorId ';'
      @state.following.push( TOKENS_FOLLOWING_variableType_IN_fieldDeclaration_504 )
      variableType26 = variableType
      @state.following.pop
      stream_variableType.add( variableType26.tree )

      @state.following.push( TOKENS_FOLLOWING_type_IN_fieldDeclaration_506 )
      type27 = type
      @state.following.pop
      stream_type.add( type27.tree )

      @state.following.push( TOKENS_FOLLOWING_variableDeclaratorId_IN_fieldDeclaration_508 )
      variableDeclaratorId28 = variableDeclaratorId
      @state.following.pop
      stream_variableDeclaratorId.add( variableDeclaratorId28.tree )

      char_literal29 = match( SEMI, TOKENS_FOLLOWING_SEMI_IN_fieldDeclaration_510 )
      stream_SEMI.add( char_literal29 )

      # AST Rewrite
      # elements: variableDeclaratorId, variableType, type
      # token labels: 
      # rule labels: return_value
      # token list labels: 
      # rule list labels: 
      # wildcard labels: 
      return_value.tree = root_0
      stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

      root_0 = @adaptor.create_flat_list
      # 90:50: -> ^( FIELD_DECLARATION variableType type variableDeclaratorId )
      # at line 90:53: ^( FIELD_DECLARATION variableType type variableDeclaratorId )
      root_1 = @adaptor.create_flat_list
      root_1 = @adaptor.become_root( @adaptor.create_from_type( FIELD_DECLARATION, "FIELD_DECLARATION" ), root_1 )

      @adaptor.add_child( root_1, stream_variableType.next_tree )

      @adaptor.add_child( root_1, stream_type.next_tree )

      @adaptor.add_child( root_1, stream_variableDeclaratorId.next_tree )

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
        # trace_out( __method__, 14 )


      end

      return return_value
    end

    FieldAccessorReturnValue = define_return_scope

    #
    # parser rule fieldAccessor
    #
    # (in Yarpl.g)
    # 93:1: fieldAccessor : IDENTIFIER '.' IDENTIFIER -> ^( FIELD_ACCESSOR IDENTIFIER IDENTIFIER ) ;
    #
    def fieldAccessor
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )


      return_value = FieldAccessorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __IDENTIFIER30__ = nil
      char_literal31 = nil
      __IDENTIFIER32__ = nil


      tree_for_IDENTIFIER30 = nil
      tree_for_char_literal31 = nil
      tree_for_IDENTIFIER32 = nil
      stream_DOT = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token DOT" )
      stream_IDENTIFIER = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token IDENTIFIER" )

      begin
      # at line 94:7: IDENTIFIER '.' IDENTIFIER
      __IDENTIFIER30__ = match( IDENTIFIER, TOKENS_FOLLOWING_IDENTIFIER_IN_fieldAccessor_539 )
      stream_IDENTIFIER.add( __IDENTIFIER30__ )

      char_literal31 = match( DOT, TOKENS_FOLLOWING_DOT_IN_fieldAccessor_541 )
      stream_DOT.add( char_literal31 )

      __IDENTIFIER32__ = match( IDENTIFIER, TOKENS_FOLLOWING_IDENTIFIER_IN_fieldAccessor_543 )
      stream_IDENTIFIER.add( __IDENTIFIER32__ )

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
      # 94:33: -> ^( FIELD_ACCESSOR IDENTIFIER IDENTIFIER )
      # at line 94:36: ^( FIELD_ACCESSOR IDENTIFIER IDENTIFIER )
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
    # (in Yarpl.g)
    # 97:1: variableDeclarators : variableDeclarator ( ',' variableDeclarator )* ;
    #
    def variableDeclarators
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )


      return_value = VariableDeclaratorsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal34 = nil
      variableDeclarator33 = nil
      variableDeclarator35 = nil


      tree_for_char_literal34 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 98:7: variableDeclarator ( ',' variableDeclarator )*
      @state.following.push( TOKENS_FOLLOWING_variableDeclarator_IN_variableDeclarators_570 )
      variableDeclarator33 = variableDeclarator
      @state.following.pop
      @adaptor.add_child( root_0, variableDeclarator33.tree )

      # at line 98:26: ( ',' variableDeclarator )*
      while true # decision 7
        alt_7 = 2
        look_7_0 = @input.peek( 1 )

        if ( look_7_0 == COMMA )
          alt_7 = 1

        end
        case alt_7
        when 1
          # at line 98:27: ',' variableDeclarator
          char_literal34 = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_variableDeclarators_573 )
          tree_for_char_literal34 = @adaptor.create_with_payload( char_literal34 )
          @adaptor.add_child( root_0, tree_for_char_literal34 )


          @state.following.push( TOKENS_FOLLOWING_variableDeclarator_IN_variableDeclarators_575 )
          variableDeclarator35 = variableDeclarator
          @state.following.pop
          @adaptor.add_child( root_0, variableDeclarator35.tree )


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
        # trace_out( __method__, 16 )


      end

      return return_value
    end

    VariableDeclaratorReturnValue = define_return_scope

    #
    # parser rule variableDeclarator
    #
    # (in Yarpl.g)
    # 101:1: variableDeclarator : variableDeclaratorId '=' variableInitializer -> ^( VARIABLE_DECLARATOR variableDeclaratorId variableInitializer ) ;
    #
    def variableDeclarator
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )


      return_value = VariableDeclaratorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal37 = nil
      variableDeclaratorId36 = nil
      variableInitializer38 = nil


      tree_for_char_literal37 = nil
      stream_ASSIGN = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token ASSIGN" )
      stream_variableDeclaratorId = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule variableDeclaratorId" )
      stream_variableInitializer = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule variableInitializer" )
      begin
      # at line 102:7: variableDeclaratorId '=' variableInitializer
      @state.following.push( TOKENS_FOLLOWING_variableDeclaratorId_IN_variableDeclarator_594 )
      variableDeclaratorId36 = variableDeclaratorId
      @state.following.pop
      stream_variableDeclaratorId.add( variableDeclaratorId36.tree )

      char_literal37 = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_variableDeclarator_596 )
      stream_ASSIGN.add( char_literal37 )

      @state.following.push( TOKENS_FOLLOWING_variableInitializer_IN_variableDeclarator_598 )
      variableInitializer38 = variableInitializer
      @state.following.pop
      stream_variableInitializer.add( variableInitializer38.tree )

      # AST Rewrite
      # elements: variableInitializer, variableDeclaratorId
      # token labels: 
      # rule labels: return_value
      # token list labels: 
      # rule list labels: 
      # wildcard labels: 
      return_value.tree = root_0
      stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

      root_0 = @adaptor.create_flat_list
      # 102:52: -> ^( VARIABLE_DECLARATOR variableDeclaratorId variableInitializer )
      # at line 102:55: ^( VARIABLE_DECLARATOR variableDeclaratorId variableInitializer )
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
    # (in Yarpl.g)
    # 105:1: variableDeclaratorId : IDENTIFIER ;
    #
    def variableDeclaratorId
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )


      return_value = VariableDeclaratorIdReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __IDENTIFIER39__ = nil


      tree_for_IDENTIFIER39 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 106:7: IDENTIFIER
      __IDENTIFIER39__ = match( IDENTIFIER, TOKENS_FOLLOWING_IDENTIFIER_IN_variableDeclaratorId_625 )
      tree_for_IDENTIFIER39 = @adaptor.create_with_payload( __IDENTIFIER39__ )
      @adaptor.add_child( root_0, tree_for_IDENTIFIER39 )



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
    # (in Yarpl.g)
    # 109:1: variableInitializer : 'new' creator -> creator ;
    #
    def variableInitializer
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )


      return_value = VariableInitializerReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal40 = nil
      creator41 = nil


      tree_for_string_literal40 = nil
      stream_T__81 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__81" )
      stream_creator = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule creator" )
      begin
      # at line 110:7: 'new' creator
      string_literal40 = match( T__81, TOKENS_FOLLOWING_T__81_IN_variableInitializer_642 )
      stream_T__81.add( string_literal40 )

      @state.following.push( TOKENS_FOLLOWING_creator_IN_variableInitializer_644 )
      creator41 = creator
      @state.following.pop
      stream_creator.add( creator41.tree )

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
      # 110:21: -> creator
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
    # (in Yarpl.g)
    # 113:1: localVariableDeclaration : variableDeclarators ';' -> variableDeclarators ;
    #
    def localVariableDeclaration
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )


      return_value = LocalVariableDeclarationReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal43 = nil
      variableDeclarators42 = nil


      tree_for_char_literal43 = nil
      stream_SEMI = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token SEMI" )
      stream_variableDeclarators = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule variableDeclarators" )
      begin
      # at line 114:7: variableDeclarators ';'
      @state.following.push( TOKENS_FOLLOWING_variableDeclarators_IN_localVariableDeclaration_665 )
      variableDeclarators42 = variableDeclarators
      @state.following.pop
      stream_variableDeclarators.add( variableDeclarators42.tree )

      char_literal43 = match( SEMI, TOKENS_FOLLOWING_SEMI_IN_localVariableDeclaration_667 )
      stream_SEMI.add( char_literal43 )

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
      # 114:31: -> variableDeclarators
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
    # (in Yarpl.g)
    # 117:1: constraintDeclaration : 'constraint' constraintBody -> ^( CONSTRAINT_DECLARATION constraintBody ) ;
    #
    def constraintDeclaration
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )


      return_value = ConstraintDeclarationReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal44 = nil
      constraintBody45 = nil


      tree_for_string_literal44 = nil
      stream_T__76 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__76" )
      stream_constraintBody = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule constraintBody" )
      begin
      # at line 118:7: 'constraint' constraintBody
      string_literal44 = match( T__76, TOKENS_FOLLOWING_T__76_IN_constraintDeclaration_688 )
      stream_T__76.add( string_literal44 )

      @state.following.push( TOKENS_FOLLOWING_constraintBody_IN_constraintDeclaration_690 )
      constraintBody45 = constraintBody
      @state.following.pop
      stream_constraintBody.add( constraintBody45.tree )

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
      # 118:35: -> ^( CONSTRAINT_DECLARATION constraintBody )
      # at line 118:38: ^( CONSTRAINT_DECLARATION constraintBody )
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
    # (in Yarpl.g)
    # 121:1: constraintBody : LBRACE expression RBRACE -> ^( CONSTRAINT_EXPRESSION expression ) ;
    #
    def constraintBody
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )


      return_value = ConstraintBodyReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __LBRACE46__ = nil
      __RBRACE48__ = nil
      expression47 = nil


      tree_for_LBRACE46 = nil
      tree_for_RBRACE48 = nil
      stream_RBRACE = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token RBRACE" )
      stream_LBRACE = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token LBRACE" )
      stream_expression = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule expression" )
      begin
      # at line 122:7: LBRACE expression RBRACE
      __LBRACE46__ = match( LBRACE, TOKENS_FOLLOWING_LBRACE_IN_constraintBody_715 )
      stream_LBRACE.add( __LBRACE46__ )

      @state.following.push( TOKENS_FOLLOWING_expression_IN_constraintBody_717 )
      expression47 = expression
      @state.following.pop
      stream_expression.add( expression47.tree )

      __RBRACE48__ = match( RBRACE, TOKENS_FOLLOWING_RBRACE_IN_constraintBody_719 )
      stream_RBRACE.add( __RBRACE48__ )

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
      # 122:32: -> ^( CONSTRAINT_EXPRESSION expression )
      # at line 122:35: ^( CONSTRAINT_EXPRESSION expression )
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
    # (in Yarpl.g)
    # 125:1: expression : ( relationalExpression ( ( 'and' | 'or' ) relationalExpression )* | fieldAccessor EQUALS fieldAccessor -> ^( EQUALS fieldAccessor fieldAccessor ) );
    #
    def expression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )


      return_value = ExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set50 = nil
      __EQUALS53__ = nil
      relationalExpression49 = nil
      relationalExpression51 = nil
      fieldAccessor52 = nil
      fieldAccessor54 = nil


      tree_for_set50 = nil
      tree_for_EQUALS53 = nil
      stream_EQUALS = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token EQUALS" )
      stream_fieldAccessor = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule fieldAccessor" )
      begin
      # at line 126:5: ( relationalExpression ( ( 'and' | 'or' ) relationalExpression )* | fieldAccessor EQUALS fieldAccessor -> ^( EQUALS fieldAccessor fieldAccessor ) )
      alt_9 = 2
      look_9_0 = @input.peek( 1 )

      if ( look_9_0 == INTEGERLITERAL || look_9_0 == LPAREN || look_9_0 == MINUS || look_9_0 == PLUS || look_9_0 == RANGEINTEGERLITERAL )
        alt_9 = 1
      elsif ( look_9_0 == IDENTIFIER )
        look_9_2 = @input.peek( 2 )

        if ( look_9_2 == DOT )
          alt_9 = 2
        elsif ( look_9_2 == EOF || look_9_2 == COMMA || look_9_2 == DIV || look_9_2 == EQUALS || look_9_2.between?( GT, GTE ) || look_9_2.between?( LT, LTE ) || look_9_2 == MINUS || look_9_2 == NOT_EQUALS || look_9_2 == PLUS || look_9_2 == RBRACE || look_9_2 == RPAREN || look_9_2 == TIMES || look_9_2 == T__73 || look_9_2 == T__80 || look_9_2 == T__82 )
          alt_9 = 1
        else
          raise NoViableAlternative( "", 9, 2 )

        end
      else
        raise NoViableAlternative( "", 9, 0 )

      end
      case alt_9
      when 1
        root_0 = @adaptor.create_flat_list


        # at line 126:7: relationalExpression ( ( 'and' | 'or' ) relationalExpression )*
        @state.following.push( TOKENS_FOLLOWING_relationalExpression_IN_expression_744 )
        relationalExpression49 = relationalExpression
        @state.following.pop
        @adaptor.add_child( root_0, relationalExpression49.tree )

        # at line 126:28: ( ( 'and' | 'or' ) relationalExpression )*
        while true # decision 8
          alt_8 = 2
          look_8_0 = @input.peek( 1 )

          if ( look_8_0 == T__73 || look_8_0 == T__82 )
            alt_8 = 1

          end
          case alt_8
          when 1
            # at line 126:29: ( 'and' | 'or' ) relationalExpression
            set50 = @input.look

            if @input.peek(1) == T__73 || @input.peek(1) == T__82
              @input.consume
              @adaptor.add_child( root_0, @adaptor.create_with_payload( set50 ) )

              @state.error_recovery = false

            else
              mse = MismatchedSet( nil )
              raise mse

            end


            @state.following.push( TOKENS_FOLLOWING_relationalExpression_IN_expression_753 )
            relationalExpression51 = relationalExpression
            @state.following.pop
            @adaptor.add_child( root_0, relationalExpression51.tree )


          else
            break # out of loop for decision 8
          end
        end # loop for decision 8


      when 2
        # at line 127:7: fieldAccessor EQUALS fieldAccessor
        @state.following.push( TOKENS_FOLLOWING_fieldAccessor_IN_expression_763 )
        fieldAccessor52 = fieldAccessor
        @state.following.pop
        stream_fieldAccessor.add( fieldAccessor52.tree )

        __EQUALS53__ = match( EQUALS, TOKENS_FOLLOWING_EQUALS_IN_expression_765 )
        stream_EQUALS.add( __EQUALS53__ )

        @state.following.push( TOKENS_FOLLOWING_fieldAccessor_IN_expression_767 )
        fieldAccessor54 = fieldAccessor
        @state.following.pop
        stream_fieldAccessor.add( fieldAccessor54.tree )

        # AST Rewrite
        # elements: EQUALS, fieldAccessor, fieldAccessor
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 
        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 127:42: -> ^( EQUALS fieldAccessor fieldAccessor )
        # at line 127:45: ^( EQUALS fieldAccessor fieldAccessor )
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
    # (in Yarpl.g)
    # 130:1: relationalExpression : addingExpression ( ( EQUALS | NOT_EQUALS | GT | GTE | LT | LTE ) addingExpression )* ;
    #
    def relationalExpression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )


      return_value = RelationalExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set56 = nil
      addingExpression55 = nil
      addingExpression57 = nil


      tree_for_set56 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 131:7: addingExpression ( ( EQUALS | NOT_EQUALS | GT | GTE | LT | LTE ) addingExpression )*
      @state.following.push( TOKENS_FOLLOWING_addingExpression_IN_relationalExpression_794 )
      addingExpression55 = addingExpression
      @state.following.pop
      @adaptor.add_child( root_0, addingExpression55.tree )

      # at line 131:24: ( ( EQUALS | NOT_EQUALS | GT | GTE | LT | LTE ) addingExpression )*
      while true # decision 10
        alt_10 = 2
        look_10_0 = @input.peek( 1 )

        if ( look_10_0 == EQUALS || look_10_0.between?( GT, GTE ) || look_10_0.between?( LT, LTE ) || look_10_0 == NOT_EQUALS )
          alt_10 = 1

        end
        case alt_10
        when 1
          # at line 131:25: ( EQUALS | NOT_EQUALS | GT | GTE | LT | LTE ) addingExpression
          set56 = @input.look

          if @input.peek(1) == EQUALS || @input.peek( 1 ).between?( GT, GTE ) || @input.peek( 1 ).between?( LT, LTE ) || @input.peek(1) == NOT_EQUALS
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set56 ) )

            @state.error_recovery = false

          else
            mse = MismatchedSet( nil )
            raise mse

          end


          @state.following.push( TOKENS_FOLLOWING_addingExpression_IN_relationalExpression_811 )
          addingExpression57 = addingExpression
          @state.following.pop
          @adaptor.add_child( root_0, addingExpression57.tree )


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
        # trace_out( __method__, 24 )


      end

      return return_value
    end

    AddingExpressionReturnValue = define_return_scope

    #
    # parser rule addingExpression
    #
    # (in Yarpl.g)
    # 134:1: addingExpression : multiplyingExpression ( ( PLUS | MINUS ) multiplyingExpression )* ;
    #
    def addingExpression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )


      return_value = AddingExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set59 = nil
      multiplyingExpression58 = nil
      multiplyingExpression60 = nil


      tree_for_set59 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 135:7: multiplyingExpression ( ( PLUS | MINUS ) multiplyingExpression )*
      @state.following.push( TOKENS_FOLLOWING_multiplyingExpression_IN_addingExpression_830 )
      multiplyingExpression58 = multiplyingExpression
      @state.following.pop
      @adaptor.add_child( root_0, multiplyingExpression58.tree )

      # at line 135:29: ( ( PLUS | MINUS ) multiplyingExpression )*
      while true # decision 11
        alt_11 = 2
        look_11_0 = @input.peek( 1 )

        if ( look_11_0 == MINUS || look_11_0 == PLUS )
          alt_11 = 1

        end
        case alt_11
        when 1
          # at line 135:30: ( PLUS | MINUS ) multiplyingExpression
          set59 = @input.look

          if @input.peek(1) == MINUS || @input.peek(1) == PLUS
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set59 ) )

            @state.error_recovery = false

          else
            mse = MismatchedSet( nil )
            raise mse

          end


          @state.following.push( TOKENS_FOLLOWING_multiplyingExpression_IN_addingExpression_839 )
          multiplyingExpression60 = multiplyingExpression
          @state.following.pop
          @adaptor.add_child( root_0, multiplyingExpression60.tree )


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
        # trace_out( __method__, 25 )


      end

      return return_value
    end

    MultiplyingExpressionReturnValue = define_return_scope

    #
    # parser rule multiplyingExpression
    #
    # (in Yarpl.g)
    # 138:1: multiplyingExpression : signExpression ( ( TIMES | DIV | 'mod' ) signExpression )* ;
    #
    def multiplyingExpression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )


      return_value = MultiplyingExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set62 = nil
      signExpression61 = nil
      signExpression63 = nil


      tree_for_set62 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 139:7: signExpression ( ( TIMES | DIV | 'mod' ) signExpression )*
      @state.following.push( TOKENS_FOLLOWING_signExpression_IN_multiplyingExpression_858 )
      signExpression61 = signExpression
      @state.following.pop
      @adaptor.add_child( root_0, signExpression61.tree )

      # at line 139:22: ( ( TIMES | DIV | 'mod' ) signExpression )*
      while true # decision 12
        alt_12 = 2
        look_12_0 = @input.peek( 1 )

        if ( look_12_0 == DIV || look_12_0 == TIMES || look_12_0 == T__80 )
          alt_12 = 1

        end
        case alt_12
        when 1
          # at line 139:23: ( TIMES | DIV | 'mod' ) signExpression
          set62 = @input.look

          if @input.peek(1) == DIV || @input.peek(1) == TIMES || @input.peek(1) == T__80
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set62 ) )

            @state.error_recovery = false

          else
            mse = MismatchedSet( nil )
            raise mse

          end


          @state.following.push( TOKENS_FOLLOWING_signExpression_IN_multiplyingExpression_869 )
          signExpression63 = signExpression
          @state.following.pop
          @adaptor.add_child( root_0, signExpression63.tree )


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
        # trace_out( __method__, 26 )


      end

      return return_value
    end

    SignExpressionReturnValue = define_return_scope

    #
    # parser rule signExpression
    #
    # (in Yarpl.g)
    # 142:1: signExpression : ( PLUS | MINUS )* primeExpression ;
    #
    def signExpression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )


      return_value = SignExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set64 = nil
      primeExpression65 = nil


      tree_for_set64 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 143:7: ( PLUS | MINUS )* primeExpression
      # at line 143:7: ( PLUS | MINUS )*
      while true # decision 13
        alt_13 = 2
        look_13_0 = @input.peek( 1 )

        if ( look_13_0 == MINUS || look_13_0 == PLUS )
          alt_13 = 1

        end
        case alt_13
        when 1
          # at line 
          set64 = @input.look

          if @input.peek(1) == MINUS || @input.peek(1) == PLUS
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set64 ) )

            @state.error_recovery = false

          else
            mse = MismatchedSet( nil )
            raise mse

          end



        else
          break # out of loop for decision 13
        end
      end # loop for decision 13

      @state.following.push( TOKENS_FOLLOWING_primeExpression_IN_signExpression_895 )
      primeExpression65 = primeExpression
      @state.following.pop
      @adaptor.add_child( root_0, primeExpression65.tree )


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
    # (in Yarpl.g)
    # 146:1: primeExpression : ( primary | LPAREN expression RPAREN );
    #
    def primeExpression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )


      return_value = PrimeExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __LPAREN67__ = nil
      __RPAREN69__ = nil
      primary66 = nil
      expression68 = nil


      tree_for_LPAREN67 = nil
      tree_for_RPAREN69 = nil

      begin
      # at line 147:5: ( primary | LPAREN expression RPAREN )
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


        # at line 147:7: primary
        @state.following.push( TOKENS_FOLLOWING_primary_IN_primeExpression_912 )
        primary66 = primary
        @state.following.pop
        @adaptor.add_child( root_0, primary66.tree )


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 148:7: LPAREN expression RPAREN
        __LPAREN67__ = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_primeExpression_920 )
        tree_for_LPAREN67 = @adaptor.create_with_payload( __LPAREN67__ )
        @adaptor.add_child( root_0, tree_for_LPAREN67 )


        @state.following.push( TOKENS_FOLLOWING_expression_IN_primeExpression_922 )
        expression68 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression68.tree )

        __RPAREN69__ = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_primeExpression_926 )
        tree_for_RPAREN69 = @adaptor.create_with_payload( __RPAREN69__ )
        @adaptor.add_child( root_0, tree_for_RPAREN69 )



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
    # (in Yarpl.g)
    # 151:1: expressionList : expression ( ',' expression )* ;
    #
    def expressionList
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )


      return_value = ExpressionListReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal71 = nil
      expression70 = nil
      expression72 = nil


      tree_for_char_literal71 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 152:9: expression ( ',' expression )*
      @state.following.push( TOKENS_FOLLOWING_expression_IN_expressionList_945 )
      expression70 = expression
      @state.following.pop
      @adaptor.add_child( root_0, expression70.tree )

      # at line 152:20: ( ',' expression )*
      while true # decision 15
        alt_15 = 2
        look_15_0 = @input.peek( 1 )

        if ( look_15_0 == COMMA )
          alt_15 = 1

        end
        case alt_15
        when 1
          # at line 152:21: ',' expression
          char_literal71 = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_expressionList_948 )
          tree_for_char_literal71 = @adaptor.create_with_payload( char_literal71 )
          @adaptor.add_child( root_0, tree_for_char_literal71 )


          @state.following.push( TOKENS_FOLLOWING_expression_IN_expressionList_950 )
          expression72 = expression
          @state.following.pop
          @adaptor.add_child( root_0, expression72.tree )


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
        # trace_out( __method__, 29 )


      end

      return return_value
    end

    DeclarationReturnValue = define_return_scope

    #
    # parser rule declaration
    #
    # (in Yarpl.g)
    # 155:1: declaration : ( set -> set | primary -> primary );
    #
    def declaration
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )


      return_value = DeclarationReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set73 = nil
      primary74 = nil


      stream_set = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule set" )
      stream_primary = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule primary" )
      begin
      # at line 156:5: ( set -> set | primary -> primary )
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
        # at line 156:7: set
        @state.following.push( TOKENS_FOLLOWING_set_IN_declaration_969 )
        set73 = set
        @state.following.pop
        stream_set.add( set73.tree )

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
        # 156:11: -> set
        @adaptor.add_child( root_0, stream_set.next_tree )




        return_value.tree = root_0



      when 2
        # at line 157:7: primary
        @state.following.push( TOKENS_FOLLOWING_primary_IN_declaration_981 )
        primary74 = primary
        @state.following.pop
        stream_primary.add( primary74.tree )

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
        # 157:15: -> primary
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

    SetReturnValue = define_return_scope

    #
    # parser rule set
    #
    # (in Yarpl.g)
    # 160:1: set : '[' setDeclaration ']' -> ^( SET setDeclaration ) ;
    #
    def set
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )


      return_value = SetReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal75 = nil
      char_literal77 = nil
      setDeclaration76 = nil


      tree_for_char_literal75 = nil
      tree_for_char_literal77 = nil
      stream_RBRACK = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token RBRACK" )
      stream_LBRACK = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token LBRACK" )
      stream_setDeclaration = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule setDeclaration" )
      begin
      # at line 161:7: '[' setDeclaration ']'
      char_literal75 = match( LBRACK, TOKENS_FOLLOWING_LBRACK_IN_set_1002 )
      stream_LBRACK.add( char_literal75 )

      @state.following.push( TOKENS_FOLLOWING_setDeclaration_IN_set_1004 )
      setDeclaration76 = setDeclaration
      @state.following.pop
      stream_setDeclaration.add( setDeclaration76.tree )

      char_literal77 = match( RBRACK, TOKENS_FOLLOWING_RBRACK_IN_set_1006 )
      stream_RBRACK.add( char_literal77 )

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
      # 161:30: -> ^( SET setDeclaration )
      # at line 161:33: ^( SET setDeclaration )
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
        # trace_out( __method__, 31 )


      end

      return return_value
    end

    SetDeclarationReturnValue = define_return_scope

    #
    # parser rule setDeclaration
    #
    # (in Yarpl.g)
    # 164:1: setDeclaration : declaration ( COMMA declaration )* -> ( ^( declaration ) )* ;
    #
    def setDeclaration
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )


      return_value = SetDeclarationReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __COMMA79__ = nil
      declaration78 = nil
      declaration80 = nil


      tree_for_COMMA79 = nil
      stream_COMMA = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token COMMA" )
      stream_declaration = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule declaration" )
      begin
      # at line 165:7: declaration ( COMMA declaration )*
      @state.following.push( TOKENS_FOLLOWING_declaration_IN_setDeclaration_1031 )
      declaration78 = declaration
      @state.following.pop
      stream_declaration.add( declaration78.tree )

      # at line 165:19: ( COMMA declaration )*
      while true # decision 17
        alt_17 = 2
        look_17_0 = @input.peek( 1 )

        if ( look_17_0 == COMMA )
          alt_17 = 1

        end
        case alt_17
        when 1
          # at line 165:20: COMMA declaration
          __COMMA79__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_setDeclaration_1034 )
          stream_COMMA.add( __COMMA79__ )

          @state.following.push( TOKENS_FOLLOWING_declaration_IN_setDeclaration_1036 )
          declaration80 = declaration
          @state.following.pop
          stream_declaration.add( declaration80.tree )


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
      # 165:40: -> ( ^( declaration ) )*
      # at line 165:43: ( ^( declaration ) )*
      while stream_declaration.has_next?
        # at line 165:43: ^( declaration )
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
        # trace_out( __method__, 32 )


      end

      return return_value
    end

    PrimaryReturnValue = define_return_scope

    #
    # parser rule primary
    #
    # (in Yarpl.g)
    # 168:1: primary : literal ;
    #
    def primary
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )


      return_value = PrimaryReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      literal81 = nil



      begin
      root_0 = @adaptor.create_flat_list


      # at line 169:7: literal
      @state.following.push( TOKENS_FOLLOWING_literal_IN_primary_1062 )
      literal81 = literal
      @state.following.pop
      @adaptor.add_child( root_0, literal81.tree )


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

    CreatorReturnValue = define_return_scope

    #
    # parser rule creator
    #
    # (in Yarpl.g)
    # 172:1: creator : createdName classCreatorRest -> ^( VARIABLE_DECLARATION createdName classCreatorRest ) ;
    #
    def creator
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )


      return_value = CreatorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      createdName82 = nil
      classCreatorRest83 = nil


      stream_createdName = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule createdName" )
      stream_classCreatorRest = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule classCreatorRest" )
      begin
      # at line 173:7: createdName classCreatorRest
      @state.following.push( TOKENS_FOLLOWING_createdName_IN_creator_1076 )
      createdName82 = createdName
      @state.following.pop
      stream_createdName.add( createdName82.tree )

      @state.following.push( TOKENS_FOLLOWING_classCreatorRest_IN_creator_1078 )
      classCreatorRest83 = classCreatorRest
      @state.following.pop
      stream_classCreatorRest.add( classCreatorRest83.tree )

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
      # 173:36: -> ^( VARIABLE_DECLARATION createdName classCreatorRest )
      # at line 173:39: ^( VARIABLE_DECLARATION createdName classCreatorRest )
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
        # trace_out( __method__, 34 )


      end

      return return_value
    end

    CreatedNameReturnValue = define_return_scope

    #
    # parser rule createdName
    #
    # (in Yarpl.g)
    # 176:1: createdName : ( structType | primitiveType );
    #
    def createdName
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )


      return_value = CreatedNameReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      structType84 = nil
      primitiveType85 = nil



      begin
      # at line 177:5: ( structType | primitiveType )
      alt_18 = 2
      look_18_0 = @input.peek( 1 )

      if ( look_18_0 == IDENTIFIER )
        alt_18 = 1
      elsif ( look_18_0 == T__79 )
        alt_18 = 2
      else
        raise NoViableAlternative( "", 18, 0 )

      end
      case alt_18
      when 1
        root_0 = @adaptor.create_flat_list


        # at line 177:7: structType
        @state.following.push( TOKENS_FOLLOWING_structType_IN_createdName_1106 )
        structType84 = structType
        @state.following.pop
        @adaptor.add_child( root_0, structType84.tree )


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 178:7: primitiveType
        @state.following.push( TOKENS_FOLLOWING_primitiveType_IN_createdName_1114 )
        primitiveType85 = primitiveType
        @state.following.pop
        @adaptor.add_child( root_0, primitiveType85.tree )


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
        # trace_out( __method__, 35 )


      end

      return return_value
    end

    ClassCreatorRestReturnValue = define_return_scope

    #
    # parser rule classCreatorRest
    #
    # (in Yarpl.g)
    # 181:1: classCreatorRest : arguments ( classBody )? ;
    #
    def classCreatorRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )


      return_value = ClassCreatorRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      arguments86 = nil
      classBody87 = nil



      begin
      root_0 = @adaptor.create_flat_list


      # at line 182:7: arguments ( classBody )?
      @state.following.push( TOKENS_FOLLOWING_arguments_IN_classCreatorRest_1131 )
      arguments86 = arguments
      @state.following.pop
      @adaptor.add_child( root_0, arguments86.tree )

      # at line 182:17: ( classBody )?
      alt_19 = 2
      look_19_0 = @input.peek( 1 )

      if ( look_19_0 == LBRACE )
        alt_19 = 1
      end
      case alt_19
      when 1
        # at line 182:17: classBody
        @state.following.push( TOKENS_FOLLOWING_classBody_IN_classCreatorRest_1133 )
        classBody87 = classBody
        @state.following.pop
        @adaptor.add_child( root_0, classBody87.tree )


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
        # trace_out( __method__, 36 )


      end

      return return_value
    end

    ArgumentsReturnValue = define_return_scope

    #
    # parser rule arguments
    #
    # (in Yarpl.g)
    # 185:1: arguments : '(' ( argumentList )* ')' -> ( argumentList )* ;
    #
    def arguments
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )


      return_value = ArgumentsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal88 = nil
      char_literal90 = nil
      argumentList89 = nil


      tree_for_char_literal88 = nil
      tree_for_char_literal90 = nil
      stream_RPAREN = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token RPAREN" )
      stream_LPAREN = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token LPAREN" )
      stream_argumentList = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule argumentList" )
      begin
      # at line 186:7: '(' ( argumentList )* ')'
      char_literal88 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_arguments_1151 )
      stream_LPAREN.add( char_literal88 )

      # at line 186:11: ( argumentList )*
      while true # decision 20
        alt_20 = 2
        look_20_0 = @input.peek( 1 )

        if ( look_20_0 == IDENTIFIER )
          alt_20 = 1

        end
        case alt_20
        when 1
          # at line 186:11: argumentList
          @state.following.push( TOKENS_FOLLOWING_argumentList_IN_arguments_1153 )
          argumentList89 = argumentList
          @state.following.pop
          stream_argumentList.add( argumentList89.tree )


        else
          break # out of loop for decision 20
        end
      end # loop for decision 20

      char_literal90 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_arguments_1156 )
      stream_RPAREN.add( char_literal90 )

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
      # 186:29: -> ( argumentList )*
      # at line 186:32: ( argumentList )*
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
        # trace_out( __method__, 37 )


      end

      return return_value
    end

    ArgumentListReturnValue = define_return_scope

    #
    # parser rule argumentList
    #
    # (in Yarpl.g)
    # 189:1: argumentList : argument ( ',' argument )* ;
    #
    def argumentList
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 38 )


      return_value = ArgumentListReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal92 = nil
      argument91 = nil
      argument93 = nil


      tree_for_char_literal92 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 190:7: argument ( ',' argument )*
      @state.following.push( TOKENS_FOLLOWING_argument_IN_argumentList_1178 )
      argument91 = argument
      @state.following.pop
      @adaptor.add_child( root_0, argument91.tree )

      # at line 190:16: ( ',' argument )*
      while true # decision 21
        alt_21 = 2
        look_21_0 = @input.peek( 1 )

        if ( look_21_0 == COMMA )
          alt_21 = 1

        end
        case alt_21
        when 1
          # at line 190:17: ',' argument
          char_literal92 = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_argumentList_1181 )
          tree_for_char_literal92 = @adaptor.create_with_payload( char_literal92 )
          @adaptor.add_child( root_0, tree_for_char_literal92 )


          @state.following.push( TOKENS_FOLLOWING_argument_IN_argumentList_1183 )
          argument93 = argument
          @state.following.pop
          @adaptor.add_child( root_0, argument93.tree )


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
        # trace_out( __method__, 38 )


      end

      return return_value
    end

    ArgumentReturnValue = define_return_scope

    #
    # parser rule argument
    #
    # (in Yarpl.g)
    # 194:1: argument : IDENTIFIER '=' declaration -> ^( ATTRIBUTE IDENTIFIER declaration ) ;
    #
    def argument
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 39 )


      return_value = ArgumentReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __IDENTIFIER94__ = nil
      char_literal95 = nil
      declaration96 = nil


      tree_for_IDENTIFIER94 = nil
      tree_for_char_literal95 = nil
      stream_IDENTIFIER = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token IDENTIFIER" )
      stream_ASSIGN = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token ASSIGN" )
      stream_declaration = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule declaration" )
      begin
      # at line 195:8: IDENTIFIER '=' declaration
      __IDENTIFIER94__ = match( IDENTIFIER, TOKENS_FOLLOWING_IDENTIFIER_IN_argument_1204 )
      stream_IDENTIFIER.add( __IDENTIFIER94__ )

      char_literal95 = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_argument_1206 )
      stream_ASSIGN.add( char_literal95 )

      @state.following.push( TOKENS_FOLLOWING_declaration_IN_argument_1208 )
      declaration96 = declaration
      @state.following.pop
      stream_declaration.add( declaration96.tree )

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
      # 195:35: -> ^( ATTRIBUTE IDENTIFIER declaration )
      # at line 195:38: ^( ATTRIBUTE IDENTIFIER declaration )
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
        # trace_out( __method__, 39 )


      end

      return return_value
    end

    LiteralReturnValue = define_return_scope

    #
    # parser rule literal
    #
    # (in Yarpl.g)
    # 199:1: literal : ( RANGEINTEGERLITERAL | INTEGERLITERAL | IDENTIFIER );
    #
    def literal
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 40 )


      return_value = LiteralReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set97 = nil


      tree_for_set97 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 
      set97 = @input.look

      if @input.peek(1) == IDENTIFIER || @input.peek(1) == INTEGERLITERAL || @input.peek(1) == RANGEINTEGERLITERAL
        @input.consume
        @adaptor.add_child( root_0, @adaptor.create_with_payload( set97 ) )

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
        # trace_out( __method__, 40 )


      end

      return return_value
    end

    TypeReturnValue = define_return_scope

    #
    # parser rule type
    #
    # (in Yarpl.g)
    # 205:1: type : ( structType -> ^( structType ) | primitiveType -> ^( primitiveType ) );
    #
    def type
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 41 )


      return_value = TypeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      structType98 = nil
      primitiveType99 = nil


      stream_primitiveType = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule primitiveType" )
      stream_structType = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule structType" )
      begin
      # at line 206:5: ( structType -> ^( structType ) | primitiveType -> ^( primitiveType ) )
      alt_22 = 2
      look_22_0 = @input.peek( 1 )

      if ( look_22_0 == IDENTIFIER )
        alt_22 = 1
      elsif ( look_22_0 == T__79 )
        alt_22 = 2
      else
        raise NoViableAlternative( "", 22, 0 )

      end
      case alt_22
      when 1
        # at line 206:7: structType
        @state.following.push( TOKENS_FOLLOWING_structType_IN_type_1258 )
        structType98 = structType
        @state.following.pop
        stream_structType.add( structType98.tree )

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
        # 206:18: -> ^( structType )
        # at line 206:21: ^( structType )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( stream_structType.next_node, root_1 )

        @adaptor.add_child( root_0, root_1 )




        return_value.tree = root_0



      when 2
        # at line 207:7: primitiveType
        @state.following.push( TOKENS_FOLLOWING_primitiveType_IN_type_1272 )
        primitiveType99 = primitiveType
        @state.following.pop
        stream_primitiveType.add( primitiveType99.tree )

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
        # 207:21: -> ^( primitiveType )
        # at line 207:24: ^( primitiveType )
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
        # trace_out( __method__, 41 )


      end

      return return_value
    end

    StructTypeReturnValue = define_return_scope

    #
    # parser rule structType
    #
    # (in Yarpl.g)
    # 210:1: structType : IDENTIFIER ;
    #
    def structType
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 42 )


      return_value = StructTypeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __IDENTIFIER100__ = nil


      tree_for_IDENTIFIER100 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 211:7: IDENTIFIER
      __IDENTIFIER100__ = match( IDENTIFIER, TOKENS_FOLLOWING_IDENTIFIER_IN_structType_1295 )
      tree_for_IDENTIFIER100 = @adaptor.create_with_payload( __IDENTIFIER100__ )
      @adaptor.add_child( root_0, tree_for_IDENTIFIER100 )



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

    PrimitiveTypeReturnValue = define_return_scope

    #
    # parser rule primitiveType
    #
    # (in Yarpl.g)
    # 214:1: primitiveType : 'integer' -> ^( INTEGER ) ;
    #
    def primitiveType
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 43 )


      return_value = PrimitiveTypeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal101 = nil


      tree_for_string_literal101 = nil
      stream_T__79 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__79" )

      begin
      # at line 215:7: 'integer'
      string_literal101 = match( T__79, TOKENS_FOLLOWING_T__79_IN_primitiveType_1312 )
      stream_T__79.add( string_literal101 )

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
      # 215:17: -> ^( INTEGER )
      # at line 215:20: ^( INTEGER )
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
        # trace_out( __method__, 43 )


      end

      return return_value
    end

    VariableTypeReturnValue = define_return_scope

    #
    # parser rule variableType
    #
    # (in Yarpl.g)
    # 218:1: variableType : ( 'var' -> ^( VARIABLE ) | 'const' -> ^( CONSTANT ) );
    #
    def variableType
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 44 )


      return_value = VariableTypeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal102 = nil
      string_literal103 = nil


      tree_for_string_literal102 = nil
      tree_for_string_literal103 = nil
      stream_T__83 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__83" )
      stream_T__75 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__75" )

      begin
      # at line 219:5: ( 'var' -> ^( VARIABLE ) | 'const' -> ^( CONSTANT ) )
      alt_23 = 2
      look_23_0 = @input.peek( 1 )

      if ( look_23_0 == T__83 )
        alt_23 = 1
      elsif ( look_23_0 == T__75 )
        alt_23 = 2
      else
        raise NoViableAlternative( "", 23, 0 )

      end
      case alt_23
      when 1
        # at line 219:7: 'var'
        string_literal102 = match( T__83, TOKENS_FOLLOWING_T__83_IN_variableType_1335 )
        stream_T__83.add( string_literal102 )

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
        # 219:13: -> ^( VARIABLE )
        # at line 219:16: ^( VARIABLE )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( VARIABLE, "VARIABLE" ), root_1 )

        @adaptor.add_child( root_0, root_1 )




        return_value.tree = root_0



      when 2
        # at line 220:7: 'const'
        string_literal103 = match( T__75, TOKENS_FOLLOWING_T__75_IN_variableType_1349 )
        stream_T__75.add( string_literal103 )

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
        # 220:15: -> ^( CONSTANT )
        # at line 220:18: ^( CONSTANT )
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
        # trace_out( __method__, 44 )


      end

      return return_value
    end



    TOKENS_FOLLOWING_program_IN_start_158 = Set[ 1, 77, 78 ]
    TOKENS_FOLLOWING_domainDeclaration_IN_program_205 = Set[ 1 ]
    TOKENS_FOLLOWING_initialDeclaration_IN_program_217 = Set[ 1 ]
    TOKENS_FOLLOWING_T__77_IN_domainDeclaration_235 = Set[ 39 ]
    TOKENS_FOLLOWING_domainBody_IN_domainDeclaration_237 = Set[ 1 ]
    TOKENS_FOLLOWING_LBRACE_IN_domainBody_262 = Set[ 56, 74 ]
    TOKENS_FOLLOWING_domainBodyDeclaration_IN_domainBody_264 = Set[ 56, 74 ]
    TOKENS_FOLLOWING_RBRACE_IN_domainBody_267 = Set[ 1 ]
    TOKENS_FOLLOWING_typeDeclaration_IN_domainBodyDeclaration_289 = Set[ 1 ]
    TOKENS_FOLLOWING_T__78_IN_initialDeclaration_307 = Set[ 39 ]
    TOKENS_FOLLOWING_initialBody_IN_initialDeclaration_309 = Set[ 1 ]
    TOKENS_FOLLOWING_LBRACE_IN_initialBody_335 = Set[ 33, 56, 76 ]
    TOKENS_FOLLOWING_initialBodyDeclaration_IN_initialBody_337 = Set[ 33, 56, 76 ]
    TOKENS_FOLLOWING_RBRACE_IN_initialBody_340 = Set[ 1 ]
    TOKENS_FOLLOWING_localVariableDeclaration_IN_initialBodyDeclaration_362 = Set[ 1 ]
    TOKENS_FOLLOWING_constraintDeclaration_IN_initialBodyDeclaration_370 = Set[ 1 ]
    TOKENS_FOLLOWING_classDeclaration_IN_typeDeclaration_387 = Set[ 1 ]
    TOKENS_FOLLOWING_T__74_IN_classDeclaration_412 = Set[ 33 ]
    TOKENS_FOLLOWING_IDENTIFIER_IN_classDeclaration_414 = Set[ 39 ]
    TOKENS_FOLLOWING_classBody_IN_classDeclaration_416 = Set[ 1 ]
    TOKENS_FOLLOWING_LBRACE_IN_classBody_438 = Set[ 56, 75, 83 ]
    TOKENS_FOLLOWING_classBodyDeclaration_IN_classBody_440 = Set[ 56, 75, 83 ]
    TOKENS_FOLLOWING_RBRACE_IN_classBody_443 = Set[ 1 ]
    TOKENS_FOLLOWING_memberDeclaration_IN_classBodyDeclaration_462 = Set[ 1 ]
    TOKENS_FOLLOWING_fieldDeclaration_IN_memberDeclaration_482 = Set[ 1 ]
    TOKENS_FOLLOWING_variableType_IN_fieldDeclaration_504 = Set[ 33, 79 ]
    TOKENS_FOLLOWING_type_IN_fieldDeclaration_506 = Set[ 33 ]
    TOKENS_FOLLOWING_variableDeclaratorId_IN_fieldDeclaration_508 = Set[ 59 ]
    TOKENS_FOLLOWING_SEMI_IN_fieldDeclaration_510 = Set[ 1 ]
    TOKENS_FOLLOWING_IDENTIFIER_IN_fieldAccessor_539 = Set[ 27 ]
    TOKENS_FOLLOWING_DOT_IN_fieldAccessor_541 = Set[ 33 ]
    TOKENS_FOLLOWING_IDENTIFIER_IN_fieldAccessor_543 = Set[ 1 ]
    TOKENS_FOLLOWING_variableDeclarator_IN_variableDeclarators_570 = Set[ 1, 14 ]
    TOKENS_FOLLOWING_COMMA_IN_variableDeclarators_573 = Set[ 33 ]
    TOKENS_FOLLOWING_variableDeclarator_IN_variableDeclarators_575 = Set[ 1, 14 ]
    TOKENS_FOLLOWING_variableDeclaratorId_IN_variableDeclarator_594 = Set[ 7 ]
    TOKENS_FOLLOWING_ASSIGN_IN_variableDeclarator_596 = Set[ 81 ]
    TOKENS_FOLLOWING_variableInitializer_IN_variableDeclarator_598 = Set[ 1 ]
    TOKENS_FOLLOWING_IDENTIFIER_IN_variableDeclaratorId_625 = Set[ 1 ]
    TOKENS_FOLLOWING_T__81_IN_variableInitializer_642 = Set[ 33, 79 ]
    TOKENS_FOLLOWING_creator_IN_variableInitializer_644 = Set[ 1 ]
    TOKENS_FOLLOWING_variableDeclarators_IN_localVariableDeclaration_665 = Set[ 59 ]
    TOKENS_FOLLOWING_SEMI_IN_localVariableDeclaration_667 = Set[ 1 ]
    TOKENS_FOLLOWING_T__76_IN_constraintDeclaration_688 = Set[ 39 ]
    TOKENS_FOLLOWING_constraintBody_IN_constraintDeclaration_690 = Set[ 1 ]
    TOKENS_FOLLOWING_LBRACE_IN_constraintBody_715 = Set[ 33, 38, 43, 47, 52, 55 ]
    TOKENS_FOLLOWING_expression_IN_constraintBody_717 = Set[ 56 ]
    TOKENS_FOLLOWING_RBRACE_IN_constraintBody_719 = Set[ 1 ]
    TOKENS_FOLLOWING_relationalExpression_IN_expression_744 = Set[ 1, 73, 82 ]
    TOKENS_FOLLOWING_set_IN_expression_747 = Set[ 33, 38, 43, 47, 52, 55 ]
    TOKENS_FOLLOWING_relationalExpression_IN_expression_753 = Set[ 1, 73, 82 ]
    TOKENS_FOLLOWING_fieldAccessor_IN_expression_763 = Set[ 28 ]
    TOKENS_FOLLOWING_EQUALS_IN_expression_765 = Set[ 33 ]
    TOKENS_FOLLOWING_fieldAccessor_IN_expression_767 = Set[ 1 ]
    TOKENS_FOLLOWING_addingExpression_IN_relationalExpression_794 = Set[ 1, 28, 31, 32, 44, 45, 50 ]
    TOKENS_FOLLOWING_set_IN_relationalExpression_797 = Set[ 33, 38, 43, 47, 52, 55 ]
    TOKENS_FOLLOWING_addingExpression_IN_relationalExpression_811 = Set[ 1, 28, 31, 32, 44, 45, 50 ]
    TOKENS_FOLLOWING_multiplyingExpression_IN_addingExpression_830 = Set[ 1, 47, 52 ]
    TOKENS_FOLLOWING_set_IN_addingExpression_833 = Set[ 33, 38, 43, 47, 52, 55 ]
    TOKENS_FOLLOWING_multiplyingExpression_IN_addingExpression_839 = Set[ 1, 47, 52 ]
    TOKENS_FOLLOWING_signExpression_IN_multiplyingExpression_858 = Set[ 1, 23, 63, 80 ]
    TOKENS_FOLLOWING_set_IN_multiplyingExpression_861 = Set[ 33, 38, 43, 47, 52, 55 ]
    TOKENS_FOLLOWING_signExpression_IN_multiplyingExpression_869 = Set[ 1, 23, 63, 80 ]
    TOKENS_FOLLOWING_primeExpression_IN_signExpression_895 = Set[ 1 ]
    TOKENS_FOLLOWING_primary_IN_primeExpression_912 = Set[ 1 ]
    TOKENS_FOLLOWING_LPAREN_IN_primeExpression_920 = Set[ 33, 38, 43, 47, 52, 55 ]
    TOKENS_FOLLOWING_expression_IN_primeExpression_922 = Set[ 58 ]
    TOKENS_FOLLOWING_RPAREN_IN_primeExpression_926 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_expressionList_945 = Set[ 1, 14 ]
    TOKENS_FOLLOWING_COMMA_IN_expressionList_948 = Set[ 33, 38, 43, 47, 52, 55 ]
    TOKENS_FOLLOWING_expression_IN_expressionList_950 = Set[ 1, 14 ]
    TOKENS_FOLLOWING_set_IN_declaration_969 = Set[ 1 ]
    TOKENS_FOLLOWING_primary_IN_declaration_981 = Set[ 1 ]
    TOKENS_FOLLOWING_LBRACK_IN_set_1002 = Set[ 33, 38, 40, 55 ]
    TOKENS_FOLLOWING_setDeclaration_IN_set_1004 = Set[ 57 ]
    TOKENS_FOLLOWING_RBRACK_IN_set_1006 = Set[ 1 ]
    TOKENS_FOLLOWING_declaration_IN_setDeclaration_1031 = Set[ 1, 14 ]
    TOKENS_FOLLOWING_COMMA_IN_setDeclaration_1034 = Set[ 33, 38, 40, 55 ]
    TOKENS_FOLLOWING_declaration_IN_setDeclaration_1036 = Set[ 1, 14 ]
    TOKENS_FOLLOWING_literal_IN_primary_1062 = Set[ 1 ]
    TOKENS_FOLLOWING_createdName_IN_creator_1076 = Set[ 43 ]
    TOKENS_FOLLOWING_classCreatorRest_IN_creator_1078 = Set[ 1 ]
    TOKENS_FOLLOWING_structType_IN_createdName_1106 = Set[ 1 ]
    TOKENS_FOLLOWING_primitiveType_IN_createdName_1114 = Set[ 1 ]
    TOKENS_FOLLOWING_arguments_IN_classCreatorRest_1131 = Set[ 1, 39 ]
    TOKENS_FOLLOWING_classBody_IN_classCreatorRest_1133 = Set[ 1 ]
    TOKENS_FOLLOWING_LPAREN_IN_arguments_1151 = Set[ 33, 58 ]
    TOKENS_FOLLOWING_argumentList_IN_arguments_1153 = Set[ 33, 58 ]
    TOKENS_FOLLOWING_RPAREN_IN_arguments_1156 = Set[ 1 ]
    TOKENS_FOLLOWING_argument_IN_argumentList_1178 = Set[ 1, 14 ]
    TOKENS_FOLLOWING_COMMA_IN_argumentList_1181 = Set[ 33 ]
    TOKENS_FOLLOWING_argument_IN_argumentList_1183 = Set[ 1, 14 ]
    TOKENS_FOLLOWING_IDENTIFIER_IN_argument_1204 = Set[ 7 ]
    TOKENS_FOLLOWING_ASSIGN_IN_argument_1206 = Set[ 33, 38, 40, 55 ]
    TOKENS_FOLLOWING_declaration_IN_argument_1208 = Set[ 1 ]
    TOKENS_FOLLOWING_structType_IN_type_1258 = Set[ 1 ]
    TOKENS_FOLLOWING_primitiveType_IN_type_1272 = Set[ 1 ]
    TOKENS_FOLLOWING_IDENTIFIER_IN_structType_1295 = Set[ 1 ]
    TOKENS_FOLLOWING_T__79_IN_primitiveType_1312 = Set[ 1 ]
    TOKENS_FOLLOWING_T__83_IN_variableType_1335 = Set[ 1 ]
    TOKENS_FOLLOWING_T__75_IN_variableType_1349 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0

end

#!/usr/bin/env ruby
#
# Yarpl.g
# --
# Generated using ANTLR version: 3.5
# Ruby runtime library version: 1.10.0
# Input grammar file: Yarpl.g
# Generated at: 2014-09-26 16:54:05
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
    define_tokens( :EOF => -1, :T__69 => 69, :T__70 => 70, :T__71 => 71, 
                   :T__72 => 72, :T__73 => 73, :T__74 => 74, :T__75 => 75, 
                   :T__76 => 76, :T__77 => 77, :T__78 => 78, :T__79 => 79, 
                   :T__80 => 80, :ALPHABET => 4, :ALPHANUMERIC => 5, :AND => 6, 
                   :ASSIGN => 7, :ATTRIBUTE => 8, :BANG => 9, :CLASS_DECLARATION => 10, 
                   :COLON => 11, :COMMA => 12, :COMMENT => 13, :CONSTANT => 14, 
                   :CONSTRAINT_DECLARATION => 15, :CONSTRAINT_EXPRESSION => 16, 
                   :DEC => 17, :DIGIT => 18, :DIGITORUNDERSCORE => 19, :DIGITS => 20, 
                   :DIV => 21, :DOMAIN_BODY => 22, :DOMAIN_BODY_DECLARATION => 23, 
                   :DOMAIN_DECLARATION => 24, :DOT => 25, :EQUALS => 26, 
                   :FIELD_ACCESSOR => 27, :FIELD_DECLARATION => 28, :GT => 29, 
                   :GTE => 30, :IDENTIFIER => 31, :INC => 32, :INITIAL_DECLARATION => 33, 
                   :INTEGER => 34, :INTEGERLITERAL => 35, :LBRACE => 36, 
                   :LBRACK => 37, :LINE_COMMENT => 38, :LOWERCASE => 39, 
                   :LPAREN => 40, :LT => 41, :LTE => 42, :MEMBER_DECLARATION => 43, 
                   :MINUS => 44, :MOD => 45, :NONZERODIGIT => 46, :NOT_EQUALS => 47, 
                   :OR => 48, :PLUS => 49, :QUESTION => 50, :RANGEINTEGERLITERAL => 51, 
                   :RBRACE => 52, :RBRACK => 53, :REFERENCE => 54, :RPAREN => 55, 
                   :SEMI => 56, :SET => 57, :SIGN => 58, :START => 59, :TIMES => 60, 
                   :TYPE_DECLARATION => 61, :UPPERCASE => 62, :VARIABLE => 63, 
                   :VARIABLE_DECLARATION => 64, :VARIABLE_DECLARATOR => 65, 
                   :WS => 66, :YARPL_LETTER => 67, :YARPL_LETTERORDIGIT => 68 )


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
                    "LOWERCASE", "LPAREN", "LT", "LTE", "MEMBER_DECLARATION", 
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
    # 31:1: start : ( program )* -> ^( START ( program )* ) ;
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
      # at line 32:7: ( program )*
      # at line 32:7: ( program )*
      while true # decision 1
        alt_1 = 2
        look_1_0 = @input.peek( 1 )

        if ( look_1_0.between?( T__73, T__74 ) )
          alt_1 = 1

        end
        case alt_1
        when 1
          # at line 32:7: program
          @state.following.push( TOKENS_FOLLOWING_program_IN_start_138 )
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
      # 32:16: -> ^( START ( program )* )
      # at line 32:19: ^( START ( program )* )
      root_1 = @adaptor.create_flat_list
      root_1 = @adaptor.become_root( @adaptor.create_from_type( START, "START" ), root_1 )

      # at line 32:27: ( program )*
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
    # 35:1: program : ( domainDeclaration -> domainDeclaration | initialDeclaration -> initialDeclaration );
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
      # at line 36:5: ( domainDeclaration -> domainDeclaration | initialDeclaration -> initialDeclaration )
      alt_2 = 2
      look_2_0 = @input.peek( 1 )

      if ( look_2_0 == T__73 )
        alt_2 = 1
      elsif ( look_2_0 == T__74 )
        alt_2 = 2
      else
        raise NoViableAlternative( "", 2, 0 )

      end
      case alt_2
      when 1
        # at line 36:7: domainDeclaration
        @state.following.push( TOKENS_FOLLOWING_domainDeclaration_IN_program_185 )
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
        # 36:25: -> domainDeclaration
        @adaptor.add_child( root_0, stream_domainDeclaration.next_tree )




        return_value.tree = root_0



      when 2
        # at line 37:7: initialDeclaration
        @state.following.push( TOKENS_FOLLOWING_initialDeclaration_IN_program_197 )
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
        # 37:26: -> initialDeclaration
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
    # 40:1: domainDeclaration : 'domain' domainBody -> ^( DOMAIN_DECLARATION domainBody ) ;
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
      stream_T__73 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__73" )
      stream_domainBody = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule domainBody" )
      begin
      # at line 41:7: 'domain' domainBody
      string_literal4 = match( T__73, TOKENS_FOLLOWING_T__73_IN_domainDeclaration_215 )
      stream_T__73.add( string_literal4 )

      @state.following.push( TOKENS_FOLLOWING_domainBody_IN_domainDeclaration_217 )
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
      # 41:27: -> ^( DOMAIN_DECLARATION domainBody )
      # at line 41:30: ^( DOMAIN_DECLARATION domainBody )
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
    # 44:1: domainBody : '{' ( domainBodyDeclaration )* '}' -> ( domainBodyDeclaration )* ;
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
      # at line 45:7: '{' ( domainBodyDeclaration )* '}'
      char_literal6 = match( LBRACE, TOKENS_FOLLOWING_LBRACE_IN_domainBody_242 )
      stream_LBRACE.add( char_literal6 )

      # at line 45:11: ( domainBodyDeclaration )*
      while true # decision 3
        alt_3 = 2
        look_3_0 = @input.peek( 1 )

        if ( look_3_0 == T__70 )
          alt_3 = 1

        end
        case alt_3
        when 1
          # at line 45:11: domainBodyDeclaration
          @state.following.push( TOKENS_FOLLOWING_domainBodyDeclaration_IN_domainBody_244 )
          domainBodyDeclaration7 = domainBodyDeclaration
          @state.following.pop
          stream_domainBodyDeclaration.add( domainBodyDeclaration7.tree )


        else
          break # out of loop for decision 3
        end
      end # loop for decision 3

      char_literal8 = match( RBRACE, TOKENS_FOLLOWING_RBRACE_IN_domainBody_247 )
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
      # 45:38: -> ( domainBodyDeclaration )*
      # at line 45:41: ( domainBodyDeclaration )*
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
    # 48:1: domainBodyDeclaration : typeDeclaration -> typeDeclaration ;
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
      # at line 49:7: typeDeclaration
      @state.following.push( TOKENS_FOLLOWING_typeDeclaration_IN_domainBodyDeclaration_269 )
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
      # 49:23: -> typeDeclaration
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
    # 52:1: initialDeclaration : 'initial' initialBody -> ^( INITIAL_DECLARATION initialBody ) ;
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
      stream_T__74 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__74" )
      stream_initialBody = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule initialBody" )
      begin
      # at line 53:7: 'initial' initialBody
      string_literal10 = match( T__74, TOKENS_FOLLOWING_T__74_IN_initialDeclaration_287 )
      stream_T__74.add( string_literal10 )

      @state.following.push( TOKENS_FOLLOWING_initialBody_IN_initialDeclaration_289 )
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
      # 53:30: -> ^( INITIAL_DECLARATION initialBody )
      # at line 53:33: ^( INITIAL_DECLARATION initialBody )
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
    # 56:1: initialBody : '{' ( initialBodyDeclaration )* '}' -> ( initialBodyDeclaration )* ;
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
      # at line 57:7: '{' ( initialBodyDeclaration )* '}'
      char_literal12 = match( LBRACE, TOKENS_FOLLOWING_LBRACE_IN_initialBody_315 )
      stream_LBRACE.add( char_literal12 )

      # at line 57:11: ( initialBodyDeclaration )*
      while true # decision 4
        alt_4 = 2
        look_4_0 = @input.peek( 1 )

        if ( look_4_0 == IDENTIFIER || look_4_0 == T__72 )
          alt_4 = 1

        end
        case alt_4
        when 1
          # at line 57:11: initialBodyDeclaration
          @state.following.push( TOKENS_FOLLOWING_initialBodyDeclaration_IN_initialBody_317 )
          initialBodyDeclaration13 = initialBodyDeclaration
          @state.following.pop
          stream_initialBodyDeclaration.add( initialBodyDeclaration13.tree )


        else
          break # out of loop for decision 4
        end
      end # loop for decision 4

      char_literal14 = match( RBRACE, TOKENS_FOLLOWING_RBRACE_IN_initialBody_320 )
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
      # 57:39: -> ( initialBodyDeclaration )*
      # at line 57:42: ( initialBodyDeclaration )*
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
    # 60:1: initialBodyDeclaration : ( localVariableDeclaration | constraintDeclaration );
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
      # at line 61:5: ( localVariableDeclaration | constraintDeclaration )
      alt_5 = 2
      look_5_0 = @input.peek( 1 )

      if ( look_5_0 == IDENTIFIER )
        alt_5 = 1
      elsif ( look_5_0 == T__72 )
        alt_5 = 2
      else
        raise NoViableAlternative( "", 5, 0 )

      end
      case alt_5
      when 1
        root_0 = @adaptor.create_flat_list


        # at line 61:7: localVariableDeclaration
        @state.following.push( TOKENS_FOLLOWING_localVariableDeclaration_IN_initialBodyDeclaration_342 )
        localVariableDeclaration15 = localVariableDeclaration
        @state.following.pop
        @adaptor.add_child( root_0, localVariableDeclaration15.tree )


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 62:7: constraintDeclaration
        @state.following.push( TOKENS_FOLLOWING_constraintDeclaration_IN_initialBodyDeclaration_350 )
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
    # 65:1: typeDeclaration : classDeclaration -> ^( CLASS_DECLARATION classDeclaration ) ;
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
      # at line 66:7: classDeclaration
      @state.following.push( TOKENS_FOLLOWING_classDeclaration_IN_typeDeclaration_367 )
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
      # 66:24: -> ^( CLASS_DECLARATION classDeclaration )
      # at line 66:27: ^( CLASS_DECLARATION classDeclaration )
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
    # 69:1: classDeclaration : 'class' IDENTIFIER classBody -> ^( IDENTIFIER classBody ) ;
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
      stream_T__70 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__70" )
      stream_IDENTIFIER = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token IDENTIFIER" )
      stream_classBody = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule classBody" )
      begin
      # at line 70:7: 'class' IDENTIFIER classBody
      string_literal18 = match( T__70, TOKENS_FOLLOWING_T__70_IN_classDeclaration_392 )
      stream_T__70.add( string_literal18 )

      __IDENTIFIER19__ = match( IDENTIFIER, TOKENS_FOLLOWING_IDENTIFIER_IN_classDeclaration_394 )
      stream_IDENTIFIER.add( __IDENTIFIER19__ )

      @state.following.push( TOKENS_FOLLOWING_classBody_IN_classDeclaration_396 )
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
      # 70:36: -> ^( IDENTIFIER classBody )
      # at line 70:39: ^( IDENTIFIER classBody )
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
    # 73:1: classBody : '{' ( classBodyDeclaration )* '}' -> ( classBodyDeclaration )* ;
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
      # at line 74:7: '{' ( classBodyDeclaration )* '}'
      char_literal21 = match( LBRACE, TOKENS_FOLLOWING_LBRACE_IN_classBody_418 )
      stream_LBRACE.add( char_literal21 )

      # at line 74:11: ( classBodyDeclaration )*
      while true # decision 6
        alt_6 = 2
        look_6_0 = @input.peek( 1 )

        if ( look_6_0 == T__71 || look_6_0.between?( T__79, T__80 ) )
          alt_6 = 1

        end
        case alt_6
        when 1
          # at line 74:11: classBodyDeclaration
          @state.following.push( TOKENS_FOLLOWING_classBodyDeclaration_IN_classBody_420 )
          classBodyDeclaration22 = classBodyDeclaration
          @state.following.pop
          stream_classBodyDeclaration.add( classBodyDeclaration22.tree )


        else
          break # out of loop for decision 6
        end
      end # loop for decision 6

      char_literal23 = match( RBRACE, TOKENS_FOLLOWING_RBRACE_IN_classBody_423 )
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
      # 74:37: -> ( classBodyDeclaration )*
      # at line 74:40: ( classBodyDeclaration )*
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
    # 77:1: classBodyDeclaration : memberDeclaration -> ^( memberDeclaration ) ;
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
      # at line 78:7: memberDeclaration
      @state.following.push( TOKENS_FOLLOWING_memberDeclaration_IN_classBodyDeclaration_442 )
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
      # 78:25: -> ^( memberDeclaration )
      # at line 78:28: ^( memberDeclaration )
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
    # 81:1: memberDeclaration : fieldDeclaration -> fieldDeclaration ;
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
      # at line 82:7: fieldDeclaration
      @state.following.push( TOKENS_FOLLOWING_fieldDeclaration_IN_memberDeclaration_462 )
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
      # 82:24: -> fieldDeclaration
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
    # 85:1: fieldDeclaration : ( variableType type variableDeclaratorId ';' -> ^( FIELD_DECLARATION variableType type variableDeclaratorId ) | 'reference' LPAREN IDENTIFIER RPAREN variableDeclaratorId ';' -> ^( REFERENCE IDENTIFIER variableDeclaratorId ) );
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
      stream_SEMI = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token SEMI" )
      stream_IDENTIFIER = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token IDENTIFIER" )
      stream_LPAREN = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token LPAREN" )
      stream_T__79 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__79" )
      stream_variableType = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule variableType" )
      stream_variableDeclaratorId = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule variableDeclaratorId" )
      stream_type = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule type" )
      begin
      # at line 86:5: ( variableType type variableDeclaratorId ';' -> ^( FIELD_DECLARATION variableType type variableDeclaratorId ) | 'reference' LPAREN IDENTIFIER RPAREN variableDeclaratorId ';' -> ^( REFERENCE IDENTIFIER variableDeclaratorId ) )
      alt_7 = 2
      look_7_0 = @input.peek( 1 )

      if ( look_7_0 == T__71 || look_7_0 == T__80 )
        alt_7 = 1
      elsif ( look_7_0 == T__79 )
        alt_7 = 2
      else
        raise NoViableAlternative( "", 7, 0 )

      end
      case alt_7
      when 1
        # at line 86:7: variableType type variableDeclaratorId ';'
        @state.following.push( TOKENS_FOLLOWING_variableType_IN_fieldDeclaration_484 )
        variableType26 = variableType
        @state.following.pop
        stream_variableType.add( variableType26.tree )

        @state.following.push( TOKENS_FOLLOWING_type_IN_fieldDeclaration_486 )
        type27 = type
        @state.following.pop
        stream_type.add( type27.tree )

        @state.following.push( TOKENS_FOLLOWING_variableDeclaratorId_IN_fieldDeclaration_488 )
        variableDeclaratorId28 = variableDeclaratorId
        @state.following.pop
        stream_variableDeclaratorId.add( variableDeclaratorId28.tree )

        char_literal29 = match( SEMI, TOKENS_FOLLOWING_SEMI_IN_fieldDeclaration_490 )
        stream_SEMI.add( char_literal29 )

        # AST Rewrite
        # elements: type, variableType, variableDeclaratorId
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 
        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 86:50: -> ^( FIELD_DECLARATION variableType type variableDeclaratorId )
        # at line 86:53: ^( FIELD_DECLARATION variableType type variableDeclaratorId )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( FIELD_DECLARATION, "FIELD_DECLARATION" ), root_1 )

        @adaptor.add_child( root_1, stream_variableType.next_tree )

        @adaptor.add_child( root_1, stream_type.next_tree )

        @adaptor.add_child( root_1, stream_variableDeclaratorId.next_tree )

        @adaptor.add_child( root_0, root_1 )




        return_value.tree = root_0



      when 2
        # at line 87:7: 'reference' LPAREN IDENTIFIER RPAREN variableDeclaratorId ';'
        string_literal30 = match( T__79, TOKENS_FOLLOWING_T__79_IN_fieldDeclaration_510 )
        stream_T__79.add( string_literal30 )

        __LPAREN31__ = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_fieldDeclaration_512 )
        stream_LPAREN.add( __LPAREN31__ )

        __IDENTIFIER32__ = match( IDENTIFIER, TOKENS_FOLLOWING_IDENTIFIER_IN_fieldDeclaration_514 )
        stream_IDENTIFIER.add( __IDENTIFIER32__ )

        __RPAREN33__ = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_fieldDeclaration_516 )
        stream_RPAREN.add( __RPAREN33__ )

        @state.following.push( TOKENS_FOLLOWING_variableDeclaratorId_IN_fieldDeclaration_518 )
        variableDeclaratorId34 = variableDeclaratorId
        @state.following.pop
        stream_variableDeclaratorId.add( variableDeclaratorId34.tree )

        char_literal35 = match( SEMI, TOKENS_FOLLOWING_SEMI_IN_fieldDeclaration_520 )
        stream_SEMI.add( char_literal35 )

        # AST Rewrite
        # elements: IDENTIFIER, variableDeclaratorId
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 
        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 87:69: -> ^( REFERENCE IDENTIFIER variableDeclaratorId )
        # at line 87:72: ^( REFERENCE IDENTIFIER variableDeclaratorId )
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
    # (in Yarpl.g)
    # 90:1: fieldAccessor : IDENTIFIER '.' IDENTIFIER -> ^( FIELD_ACCESSOR IDENTIFIER IDENTIFIER ) ;
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
      # at line 91:7: IDENTIFIER '.' IDENTIFIER
      __IDENTIFIER36__ = match( IDENTIFIER, TOKENS_FOLLOWING_IDENTIFIER_IN_fieldAccessor_547 )
      stream_IDENTIFIER.add( __IDENTIFIER36__ )

      char_literal37 = match( DOT, TOKENS_FOLLOWING_DOT_IN_fieldAccessor_549 )
      stream_DOT.add( char_literal37 )

      __IDENTIFIER38__ = match( IDENTIFIER, TOKENS_FOLLOWING_IDENTIFIER_IN_fieldAccessor_551 )
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
      # 91:33: -> ^( FIELD_ACCESSOR IDENTIFIER IDENTIFIER )
      # at line 91:36: ^( FIELD_ACCESSOR IDENTIFIER IDENTIFIER )
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
    # 94:1: variableDeclarators : variableDeclarator ( ',' variableDeclarator )* ;
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


      # at line 95:7: variableDeclarator ( ',' variableDeclarator )*
      @state.following.push( TOKENS_FOLLOWING_variableDeclarator_IN_variableDeclarators_578 )
      variableDeclarator39 = variableDeclarator
      @state.following.pop
      @adaptor.add_child( root_0, variableDeclarator39.tree )

      # at line 95:26: ( ',' variableDeclarator )*
      while true # decision 8
        alt_8 = 2
        look_8_0 = @input.peek( 1 )

        if ( look_8_0 == COMMA )
          alt_8 = 1

        end
        case alt_8
        when 1
          # at line 95:27: ',' variableDeclarator
          char_literal40 = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_variableDeclarators_581 )
          tree_for_char_literal40 = @adaptor.create_with_payload( char_literal40 )
          @adaptor.add_child( root_0, tree_for_char_literal40 )


          @state.following.push( TOKENS_FOLLOWING_variableDeclarator_IN_variableDeclarators_583 )
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
    # (in Yarpl.g)
    # 98:1: variableDeclarator : variableDeclaratorId '=' variableInitializer -> ^( VARIABLE_DECLARATOR variableDeclaratorId variableInitializer ) ;
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
      # at line 99:7: variableDeclaratorId '=' variableInitializer
      @state.following.push( TOKENS_FOLLOWING_variableDeclaratorId_IN_variableDeclarator_602 )
      variableDeclaratorId42 = variableDeclaratorId
      @state.following.pop
      stream_variableDeclaratorId.add( variableDeclaratorId42.tree )

      char_literal43 = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_variableDeclarator_604 )
      stream_ASSIGN.add( char_literal43 )

      @state.following.push( TOKENS_FOLLOWING_variableInitializer_IN_variableDeclarator_606 )
      variableInitializer44 = variableInitializer
      @state.following.pop
      stream_variableInitializer.add( variableInitializer44.tree )

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
      # 99:52: -> ^( VARIABLE_DECLARATOR variableDeclaratorId variableInitializer )
      # at line 99:55: ^( VARIABLE_DECLARATOR variableDeclaratorId variableInitializer )
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
    # 102:1: variableDeclaratorId : IDENTIFIER ;
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


      # at line 103:7: IDENTIFIER
      __IDENTIFIER45__ = match( IDENTIFIER, TOKENS_FOLLOWING_IDENTIFIER_IN_variableDeclaratorId_633 )
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
    # (in Yarpl.g)
    # 106:1: variableInitializer : 'new' creator -> creator ;
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
      stream_T__77 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__77" )
      stream_creator = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule creator" )
      begin
      # at line 107:7: 'new' creator
      string_literal46 = match( T__77, TOKENS_FOLLOWING_T__77_IN_variableInitializer_650 )
      stream_T__77.add( string_literal46 )

      @state.following.push( TOKENS_FOLLOWING_creator_IN_variableInitializer_652 )
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
      # 107:21: -> creator
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
    # 110:1: localVariableDeclaration : variableDeclarators ';' -> variableDeclarators ;
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
      # at line 111:7: variableDeclarators ';'
      @state.following.push( TOKENS_FOLLOWING_variableDeclarators_IN_localVariableDeclaration_673 )
      variableDeclarators48 = variableDeclarators
      @state.following.pop
      stream_variableDeclarators.add( variableDeclarators48.tree )

      char_literal49 = match( SEMI, TOKENS_FOLLOWING_SEMI_IN_localVariableDeclaration_675 )
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
      # 111:31: -> variableDeclarators
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
    # 114:1: constraintDeclaration : 'constraint' constraintBody -> ^( CONSTRAINT_DECLARATION constraintBody ) ;
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
      stream_T__72 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__72" )
      stream_constraintBody = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule constraintBody" )
      begin
      # at line 115:7: 'constraint' constraintBody
      string_literal50 = match( T__72, TOKENS_FOLLOWING_T__72_IN_constraintDeclaration_696 )
      stream_T__72.add( string_literal50 )

      @state.following.push( TOKENS_FOLLOWING_constraintBody_IN_constraintDeclaration_698 )
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
      # 115:35: -> ^( CONSTRAINT_DECLARATION constraintBody )
      # at line 115:38: ^( CONSTRAINT_DECLARATION constraintBody )
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
    # 118:1: constraintBody : LBRACE expression RBRACE -> ^( CONSTRAINT_EXPRESSION expression ) ;
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
      # at line 119:7: LBRACE expression RBRACE
      __LBRACE52__ = match( LBRACE, TOKENS_FOLLOWING_LBRACE_IN_constraintBody_723 )
      stream_LBRACE.add( __LBRACE52__ )

      @state.following.push( TOKENS_FOLLOWING_expression_IN_constraintBody_725 )
      expression53 = expression
      @state.following.pop
      stream_expression.add( expression53.tree )

      __RBRACE54__ = match( RBRACE, TOKENS_FOLLOWING_RBRACE_IN_constraintBody_727 )
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
      # 119:32: -> ^( CONSTRAINT_EXPRESSION expression )
      # at line 119:35: ^( CONSTRAINT_EXPRESSION expression )
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
    # 122:1: expression : ( relationalExpression ( ( 'and' | 'or' ) relationalExpression )* | fieldAccessor EQUALS fieldAccessor -> ^( EQUALS fieldAccessor fieldAccessor ) );
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
      # at line 123:5: ( relationalExpression ( ( 'and' | 'or' ) relationalExpression )* | fieldAccessor EQUALS fieldAccessor -> ^( EQUALS fieldAccessor fieldAccessor ) )
      alt_10 = 2
      look_10_0 = @input.peek( 1 )

      if ( look_10_0 == INTEGERLITERAL || look_10_0 == LPAREN || look_10_0 == MINUS || look_10_0 == PLUS || look_10_0 == RANGEINTEGERLITERAL )
        alt_10 = 1
      elsif ( look_10_0 == IDENTIFIER )
        look_10_2 = @input.peek( 2 )

        if ( look_10_2 == DOT )
          alt_10 = 2
        elsif ( look_10_2 == EOF || look_10_2 == COMMA || look_10_2 == DIV || look_10_2 == EQUALS || look_10_2.between?( GT, GTE ) || look_10_2.between?( LT, LTE ) || look_10_2 == MINUS || look_10_2 == NOT_EQUALS || look_10_2 == PLUS || look_10_2 == RBRACE || look_10_2 == RPAREN || look_10_2 == TIMES || look_10_2 == T__69 || look_10_2 == T__76 || look_10_2 == T__78 )
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


        # at line 123:7: relationalExpression ( ( 'and' | 'or' ) relationalExpression )*
        @state.following.push( TOKENS_FOLLOWING_relationalExpression_IN_expression_752 )
        relationalExpression55 = relationalExpression
        @state.following.pop
        @adaptor.add_child( root_0, relationalExpression55.tree )

        # at line 123:28: ( ( 'and' | 'or' ) relationalExpression )*
        while true # decision 9
          alt_9 = 2
          look_9_0 = @input.peek( 1 )

          if ( look_9_0 == T__69 || look_9_0 == T__78 )
            alt_9 = 1

          end
          case alt_9
          when 1
            # at line 123:29: ( 'and' | 'or' ) relationalExpression
            set56 = @input.look

            if @input.peek(1) == T__69 || @input.peek(1) == T__78
              @input.consume
              @adaptor.add_child( root_0, @adaptor.create_with_payload( set56 ) )

              @state.error_recovery = false

            else
              mse = MismatchedSet( nil )
              raise mse

            end


            @state.following.push( TOKENS_FOLLOWING_relationalExpression_IN_expression_761 )
            relationalExpression57 = relationalExpression
            @state.following.pop
            @adaptor.add_child( root_0, relationalExpression57.tree )


          else
            break # out of loop for decision 9
          end
        end # loop for decision 9


      when 2
        # at line 124:7: fieldAccessor EQUALS fieldAccessor
        @state.following.push( TOKENS_FOLLOWING_fieldAccessor_IN_expression_771 )
        fieldAccessor58 = fieldAccessor
        @state.following.pop
        stream_fieldAccessor.add( fieldAccessor58.tree )

        __EQUALS59__ = match( EQUALS, TOKENS_FOLLOWING_EQUALS_IN_expression_773 )
        stream_EQUALS.add( __EQUALS59__ )

        @state.following.push( TOKENS_FOLLOWING_fieldAccessor_IN_expression_775 )
        fieldAccessor60 = fieldAccessor
        @state.following.pop
        stream_fieldAccessor.add( fieldAccessor60.tree )

        # AST Rewrite
        # elements: fieldAccessor, fieldAccessor, EQUALS
        # token labels: 
        # rule labels: return_value
        # token list labels: 
        # rule list labels: 
        # wildcard labels: 
        return_value.tree = root_0
        stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

        root_0 = @adaptor.create_flat_list
        # 124:42: -> ^( EQUALS fieldAccessor fieldAccessor )
        # at line 124:45: ^( EQUALS fieldAccessor fieldAccessor )
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
    # 127:1: relationalExpression : addingExpression ( ( EQUALS | NOT_EQUALS | GT | GTE | LT | LTE ) addingExpression )* ;
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


      # at line 128:7: addingExpression ( ( EQUALS | NOT_EQUALS | GT | GTE | LT | LTE ) addingExpression )*
      @state.following.push( TOKENS_FOLLOWING_addingExpression_IN_relationalExpression_802 )
      addingExpression61 = addingExpression
      @state.following.pop
      @adaptor.add_child( root_0, addingExpression61.tree )

      # at line 128:24: ( ( EQUALS | NOT_EQUALS | GT | GTE | LT | LTE ) addingExpression )*
      while true # decision 11
        alt_11 = 2
        look_11_0 = @input.peek( 1 )

        if ( look_11_0 == EQUALS || look_11_0.between?( GT, GTE ) || look_11_0.between?( LT, LTE ) || look_11_0 == NOT_EQUALS )
          alt_11 = 1

        end
        case alt_11
        when 1
          # at line 128:25: ( EQUALS | NOT_EQUALS | GT | GTE | LT | LTE ) addingExpression
          set62 = @input.look

          if @input.peek(1) == EQUALS || @input.peek( 1 ).between?( GT, GTE ) || @input.peek( 1 ).between?( LT, LTE ) || @input.peek(1) == NOT_EQUALS
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set62 ) )

            @state.error_recovery = false

          else
            mse = MismatchedSet( nil )
            raise mse

          end


          @state.following.push( TOKENS_FOLLOWING_addingExpression_IN_relationalExpression_819 )
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
    # (in Yarpl.g)
    # 131:1: addingExpression : multiplyingExpression ( ( PLUS | MINUS ) multiplyingExpression )* ;
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


      # at line 132:7: multiplyingExpression ( ( PLUS | MINUS ) multiplyingExpression )*
      @state.following.push( TOKENS_FOLLOWING_multiplyingExpression_IN_addingExpression_838 )
      multiplyingExpression64 = multiplyingExpression
      @state.following.pop
      @adaptor.add_child( root_0, multiplyingExpression64.tree )

      # at line 132:29: ( ( PLUS | MINUS ) multiplyingExpression )*
      while true # decision 12
        alt_12 = 2
        look_12_0 = @input.peek( 1 )

        if ( look_12_0 == MINUS || look_12_0 == PLUS )
          alt_12 = 1

        end
        case alt_12
        when 1
          # at line 132:30: ( PLUS | MINUS ) multiplyingExpression
          set65 = @input.look

          if @input.peek(1) == MINUS || @input.peek(1) == PLUS
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set65 ) )

            @state.error_recovery = false

          else
            mse = MismatchedSet( nil )
            raise mse

          end


          @state.following.push( TOKENS_FOLLOWING_multiplyingExpression_IN_addingExpression_847 )
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
    # (in Yarpl.g)
    # 135:1: multiplyingExpression : signExpression ( ( TIMES | DIV | 'mod' ) signExpression )* ;
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


      # at line 136:7: signExpression ( ( TIMES | DIV | 'mod' ) signExpression )*
      @state.following.push( TOKENS_FOLLOWING_signExpression_IN_multiplyingExpression_866 )
      signExpression67 = signExpression
      @state.following.pop
      @adaptor.add_child( root_0, signExpression67.tree )

      # at line 136:22: ( ( TIMES | DIV | 'mod' ) signExpression )*
      while true # decision 13
        alt_13 = 2
        look_13_0 = @input.peek( 1 )

        if ( look_13_0 == DIV || look_13_0 == TIMES || look_13_0 == T__76 )
          alt_13 = 1

        end
        case alt_13
        when 1
          # at line 136:23: ( TIMES | DIV | 'mod' ) signExpression
          set68 = @input.look

          if @input.peek(1) == DIV || @input.peek(1) == TIMES || @input.peek(1) == T__76
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set68 ) )

            @state.error_recovery = false

          else
            mse = MismatchedSet( nil )
            raise mse

          end


          @state.following.push( TOKENS_FOLLOWING_signExpression_IN_multiplyingExpression_877 )
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
    # (in Yarpl.g)
    # 139:1: signExpression : ( PLUS | MINUS )* primeExpression ;
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


      # at line 140:7: ( PLUS | MINUS )* primeExpression
      # at line 140:7: ( PLUS | MINUS )*
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

      @state.following.push( TOKENS_FOLLOWING_primeExpression_IN_signExpression_903 )
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
    # (in Yarpl.g)
    # 143:1: primeExpression : ( primary | LPAREN expression RPAREN );
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
      # at line 144:5: ( primary | LPAREN expression RPAREN )
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


        # at line 144:7: primary
        @state.following.push( TOKENS_FOLLOWING_primary_IN_primeExpression_920 )
        primary72 = primary
        @state.following.pop
        @adaptor.add_child( root_0, primary72.tree )


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 145:7: LPAREN expression RPAREN
        __LPAREN73__ = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_primeExpression_928 )
        tree_for_LPAREN73 = @adaptor.create_with_payload( __LPAREN73__ )
        @adaptor.add_child( root_0, tree_for_LPAREN73 )


        @state.following.push( TOKENS_FOLLOWING_expression_IN_primeExpression_930 )
        expression74 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression74.tree )

        __RPAREN75__ = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_primeExpression_934 )
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
    # (in Yarpl.g)
    # 148:1: expressionList : expression ( ',' expression )* ;
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


      # at line 149:9: expression ( ',' expression )*
      @state.following.push( TOKENS_FOLLOWING_expression_IN_expressionList_953 )
      expression76 = expression
      @state.following.pop
      @adaptor.add_child( root_0, expression76.tree )

      # at line 149:20: ( ',' expression )*
      while true # decision 16
        alt_16 = 2
        look_16_0 = @input.peek( 1 )

        if ( look_16_0 == COMMA )
          alt_16 = 1

        end
        case alt_16
        when 1
          # at line 149:21: ',' expression
          char_literal77 = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_expressionList_956 )
          tree_for_char_literal77 = @adaptor.create_with_payload( char_literal77 )
          @adaptor.add_child( root_0, tree_for_char_literal77 )


          @state.following.push( TOKENS_FOLLOWING_expression_IN_expressionList_958 )
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
    # (in Yarpl.g)
    # 152:1: declaration : ( set -> set | primary -> primary );
    #
    def declaration
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )


      return_value = DeclarationReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set79 = nil
      primary80 = nil


      stream_set = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule set" )
      stream_primary = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule primary" )
      begin
      # at line 153:5: ( set -> set | primary -> primary )
      alt_17 = 2
      look_17_0 = @input.peek( 1 )

      if ( look_17_0 == LBRACK )
        alt_17 = 1
      elsif ( look_17_0 == IDENTIFIER || look_17_0 == INTEGERLITERAL || look_17_0 == RANGEINTEGERLITERAL )
        alt_17 = 2
      else
        raise NoViableAlternative( "", 17, 0 )

      end
      case alt_17
      when 1
        # at line 153:7: set
        @state.following.push( TOKENS_FOLLOWING_set_IN_declaration_977 )
        set79 = set
        @state.following.pop
        stream_set.add( set79.tree )

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
        # 153:11: -> set
        @adaptor.add_child( root_0, stream_set.next_tree )




        return_value.tree = root_0



      when 2
        # at line 154:7: primary
        @state.following.push( TOKENS_FOLLOWING_primary_IN_declaration_989 )
        primary80 = primary
        @state.following.pop
        stream_primary.add( primary80.tree )

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
        # 154:15: -> primary
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
    # 157:1: set : '[' setDeclaration ']' -> ^( SET setDeclaration ) ;
    #
    def set
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )


      return_value = SetReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal81 = nil
      char_literal83 = nil
      setDeclaration82 = nil


      tree_for_char_literal81 = nil
      tree_for_char_literal83 = nil
      stream_RBRACK = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token RBRACK" )
      stream_LBRACK = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token LBRACK" )
      stream_setDeclaration = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule setDeclaration" )
      begin
      # at line 158:7: '[' setDeclaration ']'
      char_literal81 = match( LBRACK, TOKENS_FOLLOWING_LBRACK_IN_set_1010 )
      stream_LBRACK.add( char_literal81 )

      @state.following.push( TOKENS_FOLLOWING_setDeclaration_IN_set_1012 )
      setDeclaration82 = setDeclaration
      @state.following.pop
      stream_setDeclaration.add( setDeclaration82.tree )

      char_literal83 = match( RBRACK, TOKENS_FOLLOWING_RBRACK_IN_set_1014 )
      stream_RBRACK.add( char_literal83 )

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
      # 158:30: -> ^( SET setDeclaration )
      # at line 158:33: ^( SET setDeclaration )
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
    # 161:1: setDeclaration : declaration ( COMMA declaration )* -> ( ^( declaration ) )* ;
    #
    def setDeclaration
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )


      return_value = SetDeclarationReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __COMMA85__ = nil
      declaration84 = nil
      declaration86 = nil


      tree_for_COMMA85 = nil
      stream_COMMA = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token COMMA" )
      stream_declaration = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule declaration" )
      begin
      # at line 162:7: declaration ( COMMA declaration )*
      @state.following.push( TOKENS_FOLLOWING_declaration_IN_setDeclaration_1039 )
      declaration84 = declaration
      @state.following.pop
      stream_declaration.add( declaration84.tree )

      # at line 162:19: ( COMMA declaration )*
      while true # decision 18
        alt_18 = 2
        look_18_0 = @input.peek( 1 )

        if ( look_18_0 == COMMA )
          alt_18 = 1

        end
        case alt_18
        when 1
          # at line 162:20: COMMA declaration
          __COMMA85__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_setDeclaration_1042 )
          stream_COMMA.add( __COMMA85__ )

          @state.following.push( TOKENS_FOLLOWING_declaration_IN_setDeclaration_1044 )
          declaration86 = declaration
          @state.following.pop
          stream_declaration.add( declaration86.tree )


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
      # 162:40: -> ( ^( declaration ) )*
      # at line 162:43: ( ^( declaration ) )*
      while stream_declaration.has_next?
        # at line 162:43: ^( declaration )
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
    # 165:1: primary : literal ;
    #
    def primary
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )


      return_value = PrimaryReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      literal87 = nil



      begin
      root_0 = @adaptor.create_flat_list


      # at line 166:7: literal
      @state.following.push( TOKENS_FOLLOWING_literal_IN_primary_1070 )
      literal87 = literal
      @state.following.pop
      @adaptor.add_child( root_0, literal87.tree )


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
    # 169:1: creator : createdName classCreatorRest -> ^( VARIABLE_DECLARATION createdName classCreatorRest ) ;
    #
    def creator
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )


      return_value = CreatorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      createdName88 = nil
      classCreatorRest89 = nil


      stream_createdName = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule createdName" )
      stream_classCreatorRest = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule classCreatorRest" )
      begin
      # at line 170:7: createdName classCreatorRest
      @state.following.push( TOKENS_FOLLOWING_createdName_IN_creator_1084 )
      createdName88 = createdName
      @state.following.pop
      stream_createdName.add( createdName88.tree )

      @state.following.push( TOKENS_FOLLOWING_classCreatorRest_IN_creator_1086 )
      classCreatorRest89 = classCreatorRest
      @state.following.pop
      stream_classCreatorRest.add( classCreatorRest89.tree )

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
      # 170:36: -> ^( VARIABLE_DECLARATION createdName classCreatorRest )
      # at line 170:39: ^( VARIABLE_DECLARATION createdName classCreatorRest )
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
    # 173:1: createdName : ( structType | primitiveType );
    #
    def createdName
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )


      return_value = CreatedNameReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      structType90 = nil
      primitiveType91 = nil



      begin
      # at line 174:5: ( structType | primitiveType )
      alt_19 = 2
      look_19_0 = @input.peek( 1 )

      if ( look_19_0 == IDENTIFIER )
        alt_19 = 1
      elsif ( look_19_0 == T__75 )
        alt_19 = 2
      else
        raise NoViableAlternative( "", 19, 0 )

      end
      case alt_19
      when 1
        root_0 = @adaptor.create_flat_list


        # at line 174:7: structType
        @state.following.push( TOKENS_FOLLOWING_structType_IN_createdName_1114 )
        structType90 = structType
        @state.following.pop
        @adaptor.add_child( root_0, structType90.tree )


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 175:7: primitiveType
        @state.following.push( TOKENS_FOLLOWING_primitiveType_IN_createdName_1122 )
        primitiveType91 = primitiveType
        @state.following.pop
        @adaptor.add_child( root_0, primitiveType91.tree )


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
    # 178:1: classCreatorRest : arguments ( classBody )? ;
    #
    def classCreatorRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )


      return_value = ClassCreatorRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      arguments92 = nil
      classBody93 = nil



      begin
      root_0 = @adaptor.create_flat_list


      # at line 179:7: arguments ( classBody )?
      @state.following.push( TOKENS_FOLLOWING_arguments_IN_classCreatorRest_1139 )
      arguments92 = arguments
      @state.following.pop
      @adaptor.add_child( root_0, arguments92.tree )

      # at line 179:17: ( classBody )?
      alt_20 = 2
      look_20_0 = @input.peek( 1 )

      if ( look_20_0 == LBRACE )
        alt_20 = 1
      end
      case alt_20
      when 1
        # at line 179:17: classBody
        @state.following.push( TOKENS_FOLLOWING_classBody_IN_classCreatorRest_1141 )
        classBody93 = classBody
        @state.following.pop
        @adaptor.add_child( root_0, classBody93.tree )


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
    # 182:1: arguments : '(' ( argumentList )* ')' -> ( argumentList )* ;
    #
    def arguments
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )


      return_value = ArgumentsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal94 = nil
      char_literal96 = nil
      argumentList95 = nil


      tree_for_char_literal94 = nil
      tree_for_char_literal96 = nil
      stream_RPAREN = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token RPAREN" )
      stream_LPAREN = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token LPAREN" )
      stream_argumentList = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule argumentList" )
      begin
      # at line 183:7: '(' ( argumentList )* ')'
      char_literal94 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_arguments_1159 )
      stream_LPAREN.add( char_literal94 )

      # at line 183:11: ( argumentList )*
      while true # decision 21
        alt_21 = 2
        look_21_0 = @input.peek( 1 )

        if ( look_21_0 == IDENTIFIER )
          alt_21 = 1

        end
        case alt_21
        when 1
          # at line 183:11: argumentList
          @state.following.push( TOKENS_FOLLOWING_argumentList_IN_arguments_1161 )
          argumentList95 = argumentList
          @state.following.pop
          stream_argumentList.add( argumentList95.tree )


        else
          break # out of loop for decision 21
        end
      end # loop for decision 21

      char_literal96 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_arguments_1164 )
      stream_RPAREN.add( char_literal96 )

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
      # 183:29: -> ( argumentList )*
      # at line 183:32: ( argumentList )*
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
    # 186:1: argumentList : argument ( ',' argument )* ;
    #
    def argumentList
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 38 )


      return_value = ArgumentListReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal98 = nil
      argument97 = nil
      argument99 = nil


      tree_for_char_literal98 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 187:7: argument ( ',' argument )*
      @state.following.push( TOKENS_FOLLOWING_argument_IN_argumentList_1186 )
      argument97 = argument
      @state.following.pop
      @adaptor.add_child( root_0, argument97.tree )

      # at line 187:16: ( ',' argument )*
      while true # decision 22
        alt_22 = 2
        look_22_0 = @input.peek( 1 )

        if ( look_22_0 == COMMA )
          alt_22 = 1

        end
        case alt_22
        when 1
          # at line 187:17: ',' argument
          char_literal98 = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_argumentList_1189 )
          tree_for_char_literal98 = @adaptor.create_with_payload( char_literal98 )
          @adaptor.add_child( root_0, tree_for_char_literal98 )


          @state.following.push( TOKENS_FOLLOWING_argument_IN_argumentList_1191 )
          argument99 = argument
          @state.following.pop
          @adaptor.add_child( root_0, argument99.tree )


        else
          break # out of loop for decision 22
        end
      end # loop for decision 22


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
    # 191:1: argument : IDENTIFIER '=' declaration -> ^( ATTRIBUTE IDENTIFIER declaration ) ;
    #
    def argument
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 39 )


      return_value = ArgumentReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __IDENTIFIER100__ = nil
      char_literal101 = nil
      declaration102 = nil


      tree_for_IDENTIFIER100 = nil
      tree_for_char_literal101 = nil
      stream_IDENTIFIER = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token IDENTIFIER" )
      stream_ASSIGN = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token ASSIGN" )
      stream_declaration = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule declaration" )
      begin
      # at line 192:8: IDENTIFIER '=' declaration
      __IDENTIFIER100__ = match( IDENTIFIER, TOKENS_FOLLOWING_IDENTIFIER_IN_argument_1212 )
      stream_IDENTIFIER.add( __IDENTIFIER100__ )

      char_literal101 = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_argument_1214 )
      stream_ASSIGN.add( char_literal101 )

      @state.following.push( TOKENS_FOLLOWING_declaration_IN_argument_1216 )
      declaration102 = declaration
      @state.following.pop
      stream_declaration.add( declaration102.tree )

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
      # 192:35: -> ^( ATTRIBUTE IDENTIFIER declaration )
      # at line 192:38: ^( ATTRIBUTE IDENTIFIER declaration )
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
    # 196:1: literal : ( RANGEINTEGERLITERAL | INTEGERLITERAL | IDENTIFIER );
    #
    def literal
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 40 )


      return_value = LiteralReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set103 = nil


      tree_for_set103 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 
      set103 = @input.look

      if @input.peek(1) == IDENTIFIER || @input.peek(1) == INTEGERLITERAL || @input.peek(1) == RANGEINTEGERLITERAL
        @input.consume
        @adaptor.add_child( root_0, @adaptor.create_with_payload( set103 ) )

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
    # 202:1: type : ( structType -> ^( structType ) | primitiveType -> ^( primitiveType ) );
    #
    def type
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 41 )


      return_value = TypeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      structType104 = nil
      primitiveType105 = nil


      stream_primitiveType = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule primitiveType" )
      stream_structType = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule structType" )
      begin
      # at line 203:5: ( structType -> ^( structType ) | primitiveType -> ^( primitiveType ) )
      alt_23 = 2
      look_23_0 = @input.peek( 1 )

      if ( look_23_0 == IDENTIFIER )
        alt_23 = 1
      elsif ( look_23_0 == T__75 )
        alt_23 = 2
      else
        raise NoViableAlternative( "", 23, 0 )

      end
      case alt_23
      when 1
        # at line 203:7: structType
        @state.following.push( TOKENS_FOLLOWING_structType_IN_type_1266 )
        structType104 = structType
        @state.following.pop
        stream_structType.add( structType104.tree )

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
        # 203:18: -> ^( structType )
        # at line 203:21: ^( structType )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( stream_structType.next_node, root_1 )

        @adaptor.add_child( root_0, root_1 )




        return_value.tree = root_0



      when 2
        # at line 204:7: primitiveType
        @state.following.push( TOKENS_FOLLOWING_primitiveType_IN_type_1280 )
        primitiveType105 = primitiveType
        @state.following.pop
        stream_primitiveType.add( primitiveType105.tree )

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
        # 204:21: -> ^( primitiveType )
        # at line 204:24: ^( primitiveType )
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
    # 207:1: structType : IDENTIFIER ;
    #
    def structType
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 42 )


      return_value = StructTypeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __IDENTIFIER106__ = nil


      tree_for_IDENTIFIER106 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 208:7: IDENTIFIER
      __IDENTIFIER106__ = match( IDENTIFIER, TOKENS_FOLLOWING_IDENTIFIER_IN_structType_1303 )
      tree_for_IDENTIFIER106 = @adaptor.create_with_payload( __IDENTIFIER106__ )
      @adaptor.add_child( root_0, tree_for_IDENTIFIER106 )



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
    # 211:1: primitiveType : 'integer' -> ^( INTEGER ) ;
    #
    def primitiveType
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 43 )


      return_value = PrimitiveTypeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal107 = nil


      tree_for_string_literal107 = nil
      stream_T__75 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__75" )

      begin
      # at line 212:7: 'integer'
      string_literal107 = match( T__75, TOKENS_FOLLOWING_T__75_IN_primitiveType_1320 )
      stream_T__75.add( string_literal107 )

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
      # 212:17: -> ^( INTEGER )
      # at line 212:20: ^( INTEGER )
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
    # 215:1: variableType : ( 'var' -> ^( VARIABLE ) | 'const' -> ^( CONSTANT ) );
    #
    def variableType
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 44 )


      return_value = VariableTypeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal108 = nil
      string_literal109 = nil


      tree_for_string_literal108 = nil
      tree_for_string_literal109 = nil
      stream_T__71 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__71" )
      stream_T__80 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__80" )

      begin
      # at line 216:5: ( 'var' -> ^( VARIABLE ) | 'const' -> ^( CONSTANT ) )
      alt_24 = 2
      look_24_0 = @input.peek( 1 )

      if ( look_24_0 == T__80 )
        alt_24 = 1
      elsif ( look_24_0 == T__71 )
        alt_24 = 2
      else
        raise NoViableAlternative( "", 24, 0 )

      end
      case alt_24
      when 1
        # at line 216:7: 'var'
        string_literal108 = match( T__80, TOKENS_FOLLOWING_T__80_IN_variableType_1343 )
        stream_T__80.add( string_literal108 )

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
        # 216:13: -> ^( VARIABLE )
        # at line 216:16: ^( VARIABLE )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( VARIABLE, "VARIABLE" ), root_1 )

        @adaptor.add_child( root_0, root_1 )




        return_value.tree = root_0



      when 2
        # at line 217:7: 'const'
        string_literal109 = match( T__71, TOKENS_FOLLOWING_T__71_IN_variableType_1357 )
        stream_T__71.add( string_literal109 )

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
        # 217:15: -> ^( CONSTANT )
        # at line 217:18: ^( CONSTANT )
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



    TOKENS_FOLLOWING_program_IN_start_138 = Set[ 1, 73, 74 ]
    TOKENS_FOLLOWING_domainDeclaration_IN_program_185 = Set[ 1 ]
    TOKENS_FOLLOWING_initialDeclaration_IN_program_197 = Set[ 1 ]
    TOKENS_FOLLOWING_T__73_IN_domainDeclaration_215 = Set[ 36 ]
    TOKENS_FOLLOWING_domainBody_IN_domainDeclaration_217 = Set[ 1 ]
    TOKENS_FOLLOWING_LBRACE_IN_domainBody_242 = Set[ 52, 70 ]
    TOKENS_FOLLOWING_domainBodyDeclaration_IN_domainBody_244 = Set[ 52, 70 ]
    TOKENS_FOLLOWING_RBRACE_IN_domainBody_247 = Set[ 1 ]
    TOKENS_FOLLOWING_typeDeclaration_IN_domainBodyDeclaration_269 = Set[ 1 ]
    TOKENS_FOLLOWING_T__74_IN_initialDeclaration_287 = Set[ 36 ]
    TOKENS_FOLLOWING_initialBody_IN_initialDeclaration_289 = Set[ 1 ]
    TOKENS_FOLLOWING_LBRACE_IN_initialBody_315 = Set[ 31, 52, 72 ]
    TOKENS_FOLLOWING_initialBodyDeclaration_IN_initialBody_317 = Set[ 31, 52, 72 ]
    TOKENS_FOLLOWING_RBRACE_IN_initialBody_320 = Set[ 1 ]
    TOKENS_FOLLOWING_localVariableDeclaration_IN_initialBodyDeclaration_342 = Set[ 1 ]
    TOKENS_FOLLOWING_constraintDeclaration_IN_initialBodyDeclaration_350 = Set[ 1 ]
    TOKENS_FOLLOWING_classDeclaration_IN_typeDeclaration_367 = Set[ 1 ]
    TOKENS_FOLLOWING_T__70_IN_classDeclaration_392 = Set[ 31 ]
    TOKENS_FOLLOWING_IDENTIFIER_IN_classDeclaration_394 = Set[ 36 ]
    TOKENS_FOLLOWING_classBody_IN_classDeclaration_396 = Set[ 1 ]
    TOKENS_FOLLOWING_LBRACE_IN_classBody_418 = Set[ 52, 71, 79, 80 ]
    TOKENS_FOLLOWING_classBodyDeclaration_IN_classBody_420 = Set[ 52, 71, 79, 80 ]
    TOKENS_FOLLOWING_RBRACE_IN_classBody_423 = Set[ 1 ]
    TOKENS_FOLLOWING_memberDeclaration_IN_classBodyDeclaration_442 = Set[ 1 ]
    TOKENS_FOLLOWING_fieldDeclaration_IN_memberDeclaration_462 = Set[ 1 ]
    TOKENS_FOLLOWING_variableType_IN_fieldDeclaration_484 = Set[ 31, 75 ]
    TOKENS_FOLLOWING_type_IN_fieldDeclaration_486 = Set[ 31 ]
    TOKENS_FOLLOWING_variableDeclaratorId_IN_fieldDeclaration_488 = Set[ 56 ]
    TOKENS_FOLLOWING_SEMI_IN_fieldDeclaration_490 = Set[ 1 ]
    TOKENS_FOLLOWING_T__79_IN_fieldDeclaration_510 = Set[ 40 ]
    TOKENS_FOLLOWING_LPAREN_IN_fieldDeclaration_512 = Set[ 31 ]
    TOKENS_FOLLOWING_IDENTIFIER_IN_fieldDeclaration_514 = Set[ 55 ]
    TOKENS_FOLLOWING_RPAREN_IN_fieldDeclaration_516 = Set[ 31 ]
    TOKENS_FOLLOWING_variableDeclaratorId_IN_fieldDeclaration_518 = Set[ 56 ]
    TOKENS_FOLLOWING_SEMI_IN_fieldDeclaration_520 = Set[ 1 ]
    TOKENS_FOLLOWING_IDENTIFIER_IN_fieldAccessor_547 = Set[ 25 ]
    TOKENS_FOLLOWING_DOT_IN_fieldAccessor_549 = Set[ 31 ]
    TOKENS_FOLLOWING_IDENTIFIER_IN_fieldAccessor_551 = Set[ 1 ]
    TOKENS_FOLLOWING_variableDeclarator_IN_variableDeclarators_578 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_COMMA_IN_variableDeclarators_581 = Set[ 31 ]
    TOKENS_FOLLOWING_variableDeclarator_IN_variableDeclarators_583 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_variableDeclaratorId_IN_variableDeclarator_602 = Set[ 7 ]
    TOKENS_FOLLOWING_ASSIGN_IN_variableDeclarator_604 = Set[ 77 ]
    TOKENS_FOLLOWING_variableInitializer_IN_variableDeclarator_606 = Set[ 1 ]
    TOKENS_FOLLOWING_IDENTIFIER_IN_variableDeclaratorId_633 = Set[ 1 ]
    TOKENS_FOLLOWING_T__77_IN_variableInitializer_650 = Set[ 31, 75 ]
    TOKENS_FOLLOWING_creator_IN_variableInitializer_652 = Set[ 1 ]
    TOKENS_FOLLOWING_variableDeclarators_IN_localVariableDeclaration_673 = Set[ 56 ]
    TOKENS_FOLLOWING_SEMI_IN_localVariableDeclaration_675 = Set[ 1 ]
    TOKENS_FOLLOWING_T__72_IN_constraintDeclaration_696 = Set[ 36 ]
    TOKENS_FOLLOWING_constraintBody_IN_constraintDeclaration_698 = Set[ 1 ]
    TOKENS_FOLLOWING_LBRACE_IN_constraintBody_723 = Set[ 31, 35, 40, 44, 49, 51 ]
    TOKENS_FOLLOWING_expression_IN_constraintBody_725 = Set[ 52 ]
    TOKENS_FOLLOWING_RBRACE_IN_constraintBody_727 = Set[ 1 ]
    TOKENS_FOLLOWING_relationalExpression_IN_expression_752 = Set[ 1, 69, 78 ]
    TOKENS_FOLLOWING_set_IN_expression_755 = Set[ 31, 35, 40, 44, 49, 51 ]
    TOKENS_FOLLOWING_relationalExpression_IN_expression_761 = Set[ 1, 69, 78 ]
    TOKENS_FOLLOWING_fieldAccessor_IN_expression_771 = Set[ 26 ]
    TOKENS_FOLLOWING_EQUALS_IN_expression_773 = Set[ 31 ]
    TOKENS_FOLLOWING_fieldAccessor_IN_expression_775 = Set[ 1 ]
    TOKENS_FOLLOWING_addingExpression_IN_relationalExpression_802 = Set[ 1, 26, 29, 30, 41, 42, 47 ]
    TOKENS_FOLLOWING_set_IN_relationalExpression_805 = Set[ 31, 35, 40, 44, 49, 51 ]
    TOKENS_FOLLOWING_addingExpression_IN_relationalExpression_819 = Set[ 1, 26, 29, 30, 41, 42, 47 ]
    TOKENS_FOLLOWING_multiplyingExpression_IN_addingExpression_838 = Set[ 1, 44, 49 ]
    TOKENS_FOLLOWING_set_IN_addingExpression_841 = Set[ 31, 35, 40, 44, 49, 51 ]
    TOKENS_FOLLOWING_multiplyingExpression_IN_addingExpression_847 = Set[ 1, 44, 49 ]
    TOKENS_FOLLOWING_signExpression_IN_multiplyingExpression_866 = Set[ 1, 21, 60, 76 ]
    TOKENS_FOLLOWING_set_IN_multiplyingExpression_869 = Set[ 31, 35, 40, 44, 49, 51 ]
    TOKENS_FOLLOWING_signExpression_IN_multiplyingExpression_877 = Set[ 1, 21, 60, 76 ]
    TOKENS_FOLLOWING_primeExpression_IN_signExpression_903 = Set[ 1 ]
    TOKENS_FOLLOWING_primary_IN_primeExpression_920 = Set[ 1 ]
    TOKENS_FOLLOWING_LPAREN_IN_primeExpression_928 = Set[ 31, 35, 40, 44, 49, 51 ]
    TOKENS_FOLLOWING_expression_IN_primeExpression_930 = Set[ 55 ]
    TOKENS_FOLLOWING_RPAREN_IN_primeExpression_934 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_expressionList_953 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_COMMA_IN_expressionList_956 = Set[ 31, 35, 40, 44, 49, 51 ]
    TOKENS_FOLLOWING_expression_IN_expressionList_958 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_set_IN_declaration_977 = Set[ 1 ]
    TOKENS_FOLLOWING_primary_IN_declaration_989 = Set[ 1 ]
    TOKENS_FOLLOWING_LBRACK_IN_set_1010 = Set[ 31, 35, 37, 51 ]
    TOKENS_FOLLOWING_setDeclaration_IN_set_1012 = Set[ 53 ]
    TOKENS_FOLLOWING_RBRACK_IN_set_1014 = Set[ 1 ]
    TOKENS_FOLLOWING_declaration_IN_setDeclaration_1039 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_COMMA_IN_setDeclaration_1042 = Set[ 31, 35, 37, 51 ]
    TOKENS_FOLLOWING_declaration_IN_setDeclaration_1044 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_literal_IN_primary_1070 = Set[ 1 ]
    TOKENS_FOLLOWING_createdName_IN_creator_1084 = Set[ 40 ]
    TOKENS_FOLLOWING_classCreatorRest_IN_creator_1086 = Set[ 1 ]
    TOKENS_FOLLOWING_structType_IN_createdName_1114 = Set[ 1 ]
    TOKENS_FOLLOWING_primitiveType_IN_createdName_1122 = Set[ 1 ]
    TOKENS_FOLLOWING_arguments_IN_classCreatorRest_1139 = Set[ 1, 36 ]
    TOKENS_FOLLOWING_classBody_IN_classCreatorRest_1141 = Set[ 1 ]
    TOKENS_FOLLOWING_LPAREN_IN_arguments_1159 = Set[ 31, 55 ]
    TOKENS_FOLLOWING_argumentList_IN_arguments_1161 = Set[ 31, 55 ]
    TOKENS_FOLLOWING_RPAREN_IN_arguments_1164 = Set[ 1 ]
    TOKENS_FOLLOWING_argument_IN_argumentList_1186 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_COMMA_IN_argumentList_1189 = Set[ 31 ]
    TOKENS_FOLLOWING_argument_IN_argumentList_1191 = Set[ 1, 12 ]
    TOKENS_FOLLOWING_IDENTIFIER_IN_argument_1212 = Set[ 7 ]
    TOKENS_FOLLOWING_ASSIGN_IN_argument_1214 = Set[ 31, 35, 37, 51 ]
    TOKENS_FOLLOWING_declaration_IN_argument_1216 = Set[ 1 ]
    TOKENS_FOLLOWING_structType_IN_type_1266 = Set[ 1 ]
    TOKENS_FOLLOWING_primitiveType_IN_type_1280 = Set[ 1 ]
    TOKENS_FOLLOWING_IDENTIFIER_IN_structType_1303 = Set[ 1 ]
    TOKENS_FOLLOWING_T__75_IN_primitiveType_1320 = Set[ 1 ]
    TOKENS_FOLLOWING_T__80_IN_variableType_1343 = Set[ 1 ]
    TOKENS_FOLLOWING_T__71_IN_variableType_1357 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0

end

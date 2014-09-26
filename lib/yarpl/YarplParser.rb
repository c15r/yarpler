#!/usr/bin/env ruby
#
# Yarpl.g
# --
# Generated using ANTLR version: 3.5
# Ruby runtime library version: 1.10.0
# Input grammar file: Yarpl.g
# Generated at: 2014-09-26 10:06:16
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
                   :T__77 => 77, :T__78 => 78, :T__79 => 79, :ALPHABET => 4, 
                   :ALPHANUMERIC => 5, :AND => 6, :ASSIGN => 7, :ATTRIBUTE => 8, 
                   :BANG => 9, :CLASS_BODY => 10, :CLASS_BODY_DECLARATION => 11, 
                   :CLASS_DECLARATION => 12, :COLON => 13, :COMMA => 14, 
                   :COMMENT => 15, :CONSTANT => 16, :DEC => 17, :DIGIT => 18, 
                   :DIGITORUNDERSCORE => 19, :DIGITS => 20, :DIV => 21, 
                   :DOMAIN_BODY => 22, :DOMAIN_BODY_DECLARATION => 23, :DOMAIN_DECLARATION => 24, 
                   :DOT => 25, :EQUALS => 26, :FIELD_DECLARATION => 27, 
                   :GT => 28, :GTE => 29, :IDENTIFIER => 30, :INC => 31, 
                   :INITIAL_BODY => 32, :INITIAL_DECLARATION => 33, :INTEGER => 34, 
                   :INTEGERLITERAL => 35, :LBRACE => 36, :LBRACK => 37, 
                   :LINE_COMMENT => 38, :LOWERCASE => 39, :LPAREN => 40, 
                   :LT => 41, :LTE => 42, :MEMBER_DECLARATION => 43, :MINUS => 44, 
                   :MOD => 45, :NONZERODIGIT => 46, :NOT_EQUALS => 47, :OR => 48, 
                   :PLUS => 49, :PROGRAM => 50, :QUESTION => 51, :RANGEINTEGERLITERAL => 52, 
                   :RBRACE => 53, :RBRACK => 54, :RPAREN => 55, :SEMI => 56, 
                   :SET => 57, :SIGN => 58, :START => 59, :TIMES => 60, 
                   :TYPE_DECLARATION => 61, :UPPERCASE => 62, :VARIABLE => 63, 
                   :VARIABLE_DECLARATION => 64, :VARIABLE_DECLARATOR => 65, 
                   :VARIABLE_TYPE => 66, :WS => 67, :YARPL_LETTER => 68, 
                   :YARPL_LETTERORDIGIT => 69 )


    # register the proper human-readable name or literal value
    # for each token type
    #
    # this is necessary because anonymous tokens, which are
    # created from literal values in the grammar, do not
    # have descriptive names
    register_names( "ALPHABET", "ALPHANUMERIC", "AND", "ASSIGN", "ATTRIBUTE", 
                    "BANG", "CLASS_BODY", "CLASS_BODY_DECLARATION", "CLASS_DECLARATION", 
                    "COLON", "COMMA", "COMMENT", "CONSTANT", "DEC", "DIGIT", 
                    "DIGITORUNDERSCORE", "DIGITS", "DIV", "DOMAIN_BODY", 
                    "DOMAIN_BODY_DECLARATION", "DOMAIN_DECLARATION", "DOT", 
                    "EQUALS", "FIELD_DECLARATION", "GT", "GTE", "IDENTIFIER", 
                    "INC", "INITIAL_BODY", "INITIAL_DECLARATION", "INTEGER", 
                    "INTEGERLITERAL", "LBRACE", "LBRACK", "LINE_COMMENT", 
                    "LOWERCASE", "LPAREN", "LT", "LTE", "MEMBER_DECLARATION", 
                    "MINUS", "MOD", "NONZERODIGIT", "NOT_EQUALS", "OR", 
                    "PLUS", "PROGRAM", "QUESTION", "RANGEINTEGERLITERAL", 
                    "RBRACE", "RBRACK", "RPAREN", "SEMI", "SET", "SIGN", 
                    "START", "TIMES", "TYPE_DECLARATION", "UPPERCASE", "VARIABLE", 
                    "VARIABLE_DECLARATION", "VARIABLE_DECLARATOR", "VARIABLE_TYPE", 
                    "WS", "YARPL_LETTER", "YARPL_LETTERORDIGIT", "'and'", 
                    "'class'", "'const'", "'domain'", "'initial'", "'integer'", 
                    "'mod'", "'new'", "'or'", "'var'" )


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

        if ( look_1_0.between?( T__73, T__74 ) )
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
    # (in Yarpl.g)
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

      if ( look_2_0 == T__73 )
        alt_2 = 1
      elsif ( look_2_0 == T__74 )
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
    # (in Yarpl.g)
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
      stream_T__73 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__73" )
      stream_domainBody = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule domainBody" )
      begin
      # at line 42:7: 'domain' domainBody
      string_literal4 = match( T__73, TOKENS_FOLLOWING_T__73_IN_domainDeclaration_220 )
      stream_T__73.add( string_literal4 )

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
    # (in Yarpl.g)
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
    # (in Yarpl.g)
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
    # (in Yarpl.g)
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
      stream_T__74 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__74" )
      stream_initialBody = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule initialBody" )
      begin
      # at line 54:7: 'initial' initialBody
      string_literal10 = match( T__74, TOKENS_FOLLOWING_T__74_IN_initialDeclaration_292 )
      stream_T__74.add( string_literal10 )

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
    # (in Yarpl.g)
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

        if ( look_4_0 == IDENTIFIER || look_4_0 == SEMI )
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
    # (in Yarpl.g)
    # 61:1: initialBodyDeclaration : statement ;
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


      # at line 62:7: statement
      @state.following.push( TOKENS_FOLLOWING_statement_IN_initialBodyDeclaration_347 )
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

      classDeclaration16 = nil


      stream_classDeclaration = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule classDeclaration" )
      begin
      # at line 66:7: classDeclaration
      @state.following.push( TOKENS_FOLLOWING_classDeclaration_IN_typeDeclaration_364 )
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

      string_literal17 = nil
      __IDENTIFIER18__ = nil
      classBody19 = nil


      tree_for_string_literal17 = nil
      tree_for_IDENTIFIER18 = nil
      stream_T__71 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__71" )
      stream_IDENTIFIER = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token IDENTIFIER" )
      stream_classBody = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule classBody" )
      begin
      # at line 70:7: 'class' IDENTIFIER classBody
      string_literal17 = match( T__71, TOKENS_FOLLOWING_T__71_IN_classDeclaration_389 )
      stream_T__71.add( string_literal17 )

      __IDENTIFIER18__ = match( IDENTIFIER, TOKENS_FOLLOWING_IDENTIFIER_IN_classDeclaration_391 )
      stream_IDENTIFIER.add( __IDENTIFIER18__ )

      @state.following.push( TOKENS_FOLLOWING_classBody_IN_classDeclaration_393 )
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

      char_literal20 = nil
      char_literal22 = nil
      classBodyDeclaration21 = nil


      tree_for_char_literal20 = nil
      tree_for_char_literal22 = nil
      stream_RBRACE = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token RBRACE" )
      stream_LBRACE = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token LBRACE" )
      stream_classBodyDeclaration = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule classBodyDeclaration" )
      begin
      # at line 74:7: '{' ( classBodyDeclaration )* '}'
      char_literal20 = match( LBRACE, TOKENS_FOLLOWING_LBRACE_IN_classBody_415 )
      stream_LBRACE.add( char_literal20 )

      # at line 74:11: ( classBodyDeclaration )*
      while true # decision 5
        alt_5 = 2
        look_5_0 = @input.peek( 1 )

        if ( look_5_0 == T__72 || look_5_0 == T__79 )
          alt_5 = 1

        end
        case alt_5
        when 1
          # at line 74:11: classBodyDeclaration
          @state.following.push( TOKENS_FOLLOWING_classBodyDeclaration_IN_classBody_417 )
          classBodyDeclaration21 = classBodyDeclaration
          @state.following.pop
          stream_classBodyDeclaration.add( classBodyDeclaration21.tree )


        else
          break # out of loop for decision 5
        end
      end # loop for decision 5

      char_literal22 = match( RBRACE, TOKENS_FOLLOWING_RBRACE_IN_classBody_420 )
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

      memberDeclaration23 = nil


      stream_memberDeclaration = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule memberDeclaration" )
      begin
      # at line 78:7: memberDeclaration
      @state.following.push( TOKENS_FOLLOWING_memberDeclaration_IN_classBodyDeclaration_439 )
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

      fieldDeclaration24 = nil


      stream_fieldDeclaration = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule fieldDeclaration" )
      begin
      # at line 82:7: fieldDeclaration
      @state.following.push( TOKENS_FOLLOWING_fieldDeclaration_IN_memberDeclaration_459 )
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
    # 85:1: fieldDeclaration : variableType type variableDeclaratorId ';' -> ^( FIELD_DECLARATION variableType type variableDeclaratorId ) ;
    #
    def fieldDeclaration
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )


      return_value = FieldDeclarationReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal28 = nil
      variableType25 = nil
      type26 = nil
      variableDeclaratorId27 = nil


      tree_for_char_literal28 = nil
      stream_SEMI = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token SEMI" )
      stream_variableType = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule variableType" )
      stream_variableDeclaratorId = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule variableDeclaratorId" )
      stream_type = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule type" )
      begin
      # at line 86:7: variableType type variableDeclaratorId ';'
      @state.following.push( TOKENS_FOLLOWING_variableType_IN_fieldDeclaration_481 )
      variableType25 = variableType
      @state.following.pop
      stream_variableType.add( variableType25.tree )

      @state.following.push( TOKENS_FOLLOWING_type_IN_fieldDeclaration_483 )
      type26 = type
      @state.following.pop
      stream_type.add( type26.tree )

      @state.following.push( TOKENS_FOLLOWING_variableDeclaratorId_IN_fieldDeclaration_485 )
      variableDeclaratorId27 = variableDeclaratorId
      @state.following.pop
      stream_variableDeclaratorId.add( variableDeclaratorId27.tree )

      char_literal28 = match( SEMI, TOKENS_FOLLOWING_SEMI_IN_fieldDeclaration_487 )
      stream_SEMI.add( char_literal28 )

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
      # 86:50: -> ^( FIELD_DECLARATION variableType type variableDeclaratorId )
      # at line 86:53: ^( FIELD_DECLARATION variableType type variableDeclaratorId )
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

    VariableDeclaratorsReturnValue = define_return_scope

    #
    # parser rule variableDeclarators
    #
    # (in Yarpl.g)
    # 89:1: variableDeclarators : variableDeclarator ( ',' variableDeclarator )* ;
    #
    def variableDeclarators
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )


      return_value = VariableDeclaratorsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal30 = nil
      variableDeclarator29 = nil
      variableDeclarator31 = nil


      tree_for_char_literal30 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 90:7: variableDeclarator ( ',' variableDeclarator )*
      @state.following.push( TOKENS_FOLLOWING_variableDeclarator_IN_variableDeclarators_516 )
      variableDeclarator29 = variableDeclarator
      @state.following.pop
      @adaptor.add_child( root_0, variableDeclarator29.tree )

      # at line 90:26: ( ',' variableDeclarator )*
      while true # decision 6
        alt_6 = 2
        look_6_0 = @input.peek( 1 )

        if ( look_6_0 == COMMA )
          alt_6 = 1

        end
        case alt_6
        when 1
          # at line 90:27: ',' variableDeclarator
          char_literal30 = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_variableDeclarators_519 )
          tree_for_char_literal30 = @adaptor.create_with_payload( char_literal30 )
          @adaptor.add_child( root_0, tree_for_char_literal30 )


          @state.following.push( TOKENS_FOLLOWING_variableDeclarator_IN_variableDeclarators_521 )
          variableDeclarator31 = variableDeclarator
          @state.following.pop
          @adaptor.add_child( root_0, variableDeclarator31.tree )


        else
          break # out of loop for decision 6
        end
      end # loop for decision 6


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
    # (in Yarpl.g)
    # 93:1: variableDeclarator : variableDeclaratorId '=' variableInitializer -> ^( VARIABLE_DECLARATOR variableDeclaratorId variableInitializer ) ;
    #
    def variableDeclarator
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )


      return_value = VariableDeclaratorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal33 = nil
      variableDeclaratorId32 = nil
      variableInitializer34 = nil


      tree_for_char_literal33 = nil
      stream_ASSIGN = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token ASSIGN" )
      stream_variableDeclaratorId = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule variableDeclaratorId" )
      stream_variableInitializer = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule variableInitializer" )
      begin
      # at line 94:7: variableDeclaratorId '=' variableInitializer
      @state.following.push( TOKENS_FOLLOWING_variableDeclaratorId_IN_variableDeclarator_540 )
      variableDeclaratorId32 = variableDeclaratorId
      @state.following.pop
      stream_variableDeclaratorId.add( variableDeclaratorId32.tree )

      char_literal33 = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_variableDeclarator_542 )
      stream_ASSIGN.add( char_literal33 )

      @state.following.push( TOKENS_FOLLOWING_variableInitializer_IN_variableDeclarator_544 )
      variableInitializer34 = variableInitializer
      @state.following.pop
      stream_variableInitializer.add( variableInitializer34.tree )

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
      # 94:52: -> ^( VARIABLE_DECLARATOR variableDeclaratorId variableInitializer )
      # at line 94:55: ^( VARIABLE_DECLARATOR variableDeclaratorId variableInitializer )
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
    # (in Yarpl.g)
    # 97:1: variableDeclaratorId : IDENTIFIER ;
    #
    def variableDeclaratorId
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 17 )


      return_value = VariableDeclaratorIdReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __IDENTIFIER35__ = nil


      tree_for_IDENTIFIER35 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 98:7: IDENTIFIER
      __IDENTIFIER35__ = match( IDENTIFIER, TOKENS_FOLLOWING_IDENTIFIER_IN_variableDeclaratorId_571 )
      tree_for_IDENTIFIER35 = @adaptor.create_with_payload( __IDENTIFIER35__ )
      @adaptor.add_child( root_0, tree_for_IDENTIFIER35 )



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
    # (in Yarpl.g)
    # 101:1: variableInitializer : 'new' creator -> creator ;
    #
    def variableInitializer
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )


      return_value = VariableInitializerReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal36 = nil
      creator37 = nil


      tree_for_string_literal36 = nil
      stream_T__77 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__77" )
      stream_creator = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule creator" )
      begin
      # at line 102:7: 'new' creator
      string_literal36 = match( T__77, TOKENS_FOLLOWING_T__77_IN_variableInitializer_588 )
      stream_T__77.add( string_literal36 )

      @state.following.push( TOKENS_FOLLOWING_creator_IN_variableInitializer_590 )
      creator37 = creator
      @state.following.pop
      stream_creator.add( creator37.tree )

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
      # 102:21: -> creator
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
    # (in Yarpl.g)
    # 105:1: localVariableDeclaration : variableDeclarators ';' -> variableDeclarators ;
    #
    def localVariableDeclaration
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )


      return_value = LocalVariableDeclarationReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal39 = nil
      variableDeclarators38 = nil


      tree_for_char_literal39 = nil
      stream_SEMI = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token SEMI" )
      stream_variableDeclarators = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule variableDeclarators" )
      begin
      # at line 106:7: variableDeclarators ';'
      @state.following.push( TOKENS_FOLLOWING_variableDeclarators_IN_localVariableDeclaration_611 )
      variableDeclarators38 = variableDeclarators
      @state.following.pop
      stream_variableDeclarators.add( variableDeclarators38.tree )

      char_literal39 = match( SEMI, TOKENS_FOLLOWING_SEMI_IN_localVariableDeclaration_613 )
      stream_SEMI.add( char_literal39 )

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
      # 106:31: -> variableDeclarators
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
    # (in Yarpl.g)
    # 110:1: statement : ( localVariableDeclaration | ';' );
    #
    def statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )


      return_value = StatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal41 = nil
      localVariableDeclaration40 = nil


      tree_for_char_literal41 = nil

      begin
      # at line 111:5: ( localVariableDeclaration | ';' )
      alt_7 = 2
      look_7_0 = @input.peek( 1 )

      if ( look_7_0 == IDENTIFIER )
        alt_7 = 1
      elsif ( look_7_0 == SEMI )
        alt_7 = 2
      else
        raise NoViableAlternative( "", 7, 0 )

      end
      case alt_7
      when 1
        root_0 = @adaptor.create_flat_list


        # at line 111:7: localVariableDeclaration
        @state.following.push( TOKENS_FOLLOWING_localVariableDeclaration_IN_statement_635 )
        localVariableDeclaration40 = localVariableDeclaration
        @state.following.pop
        @adaptor.add_child( root_0, localVariableDeclaration40.tree )


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 112:7: ';'
        char_literal41 = match( SEMI, TOKENS_FOLLOWING_SEMI_IN_statement_643 )
        tree_for_char_literal41 = @adaptor.create_with_payload( char_literal41 )
        @adaptor.add_child( root_0, tree_for_char_literal41 )



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
    # (in Yarpl.g)
    # 116:1: expression : relationalExpression ( ( 'and' | 'or' ) relationalExpression )* ;
    #
    def expression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )


      return_value = ExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set43 = nil
      relationalExpression42 = nil
      relationalExpression44 = nil


      tree_for_set43 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 117:5: relationalExpression ( ( 'and' | 'or' ) relationalExpression )*
      @state.following.push( TOKENS_FOLLOWING_relationalExpression_IN_expression_661 )
      relationalExpression42 = relationalExpression
      @state.following.pop
      @adaptor.add_child( root_0, relationalExpression42.tree )

      # at line 117:26: ( ( 'and' | 'or' ) relationalExpression )*
      while true # decision 8
        alt_8 = 2
        look_8_0 = @input.peek( 1 )

        if ( look_8_0 == T__70 || look_8_0 == T__78 )
          alt_8 = 1

        end
        case alt_8
        when 1
          # at line 117:27: ( 'and' | 'or' ) relationalExpression
          set43 = @input.look

          if @input.peek(1) == T__70 || @input.peek(1) == T__78
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set43 ) )

            @state.error_recovery = false

          else
            mse = MismatchedSet( nil )
            raise mse

          end


          @state.following.push( TOKENS_FOLLOWING_relationalExpression_IN_expression_670 )
          relationalExpression44 = relationalExpression
          @state.following.pop
          @adaptor.add_child( root_0, relationalExpression44.tree )


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
        # trace_out( __method__, 21 )


      end

      return return_value
    end

    RelationalExpressionReturnValue = define_return_scope

    #
    # parser rule relationalExpression
    #
    # (in Yarpl.g)
    # 120:1: relationalExpression : addingExpression ( ( EQUALS | NOT_EQUALS | GT | GTE | LT | LTE ) addingExpression )* ;
    #
    def relationalExpression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )


      return_value = RelationalExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set46 = nil
      addingExpression45 = nil
      addingExpression47 = nil


      tree_for_set46 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 121:7: addingExpression ( ( EQUALS | NOT_EQUALS | GT | GTE | LT | LTE ) addingExpression )*
      @state.following.push( TOKENS_FOLLOWING_addingExpression_IN_relationalExpression_689 )
      addingExpression45 = addingExpression
      @state.following.pop
      @adaptor.add_child( root_0, addingExpression45.tree )

      # at line 121:24: ( ( EQUALS | NOT_EQUALS | GT | GTE | LT | LTE ) addingExpression )*
      while true # decision 9
        alt_9 = 2
        look_9_0 = @input.peek( 1 )

        if ( look_9_0 == EQUALS || look_9_0.between?( GT, GTE ) || look_9_0.between?( LT, LTE ) || look_9_0 == NOT_EQUALS )
          alt_9 = 1

        end
        case alt_9
        when 1
          # at line 121:25: ( EQUALS | NOT_EQUALS | GT | GTE | LT | LTE ) addingExpression
          set46 = @input.look

          if @input.peek(1) == EQUALS || @input.peek( 1 ).between?( GT, GTE ) || @input.peek( 1 ).between?( LT, LTE ) || @input.peek(1) == NOT_EQUALS
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set46 ) )

            @state.error_recovery = false

          else
            mse = MismatchedSet( nil )
            raise mse

          end


          @state.following.push( TOKENS_FOLLOWING_addingExpression_IN_relationalExpression_706 )
          addingExpression47 = addingExpression
          @state.following.pop
          @adaptor.add_child( root_0, addingExpression47.tree )


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
        # trace_out( __method__, 22 )


      end

      return return_value
    end

    AddingExpressionReturnValue = define_return_scope

    #
    # parser rule addingExpression
    #
    # (in Yarpl.g)
    # 124:1: addingExpression : multiplyingExpression ( ( PLUS | MINUS ) multiplyingExpression )* ;
    #
    def addingExpression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )


      return_value = AddingExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set49 = nil
      multiplyingExpression48 = nil
      multiplyingExpression50 = nil


      tree_for_set49 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 125:7: multiplyingExpression ( ( PLUS | MINUS ) multiplyingExpression )*
      @state.following.push( TOKENS_FOLLOWING_multiplyingExpression_IN_addingExpression_725 )
      multiplyingExpression48 = multiplyingExpression
      @state.following.pop
      @adaptor.add_child( root_0, multiplyingExpression48.tree )

      # at line 125:29: ( ( PLUS | MINUS ) multiplyingExpression )*
      while true # decision 10
        alt_10 = 2
        look_10_0 = @input.peek( 1 )

        if ( look_10_0 == MINUS || look_10_0 == PLUS )
          alt_10 = 1

        end
        case alt_10
        when 1
          # at line 125:30: ( PLUS | MINUS ) multiplyingExpression
          set49 = @input.look

          if @input.peek(1) == MINUS || @input.peek(1) == PLUS
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set49 ) )

            @state.error_recovery = false

          else
            mse = MismatchedSet( nil )
            raise mse

          end


          @state.following.push( TOKENS_FOLLOWING_multiplyingExpression_IN_addingExpression_734 )
          multiplyingExpression50 = multiplyingExpression
          @state.following.pop
          @adaptor.add_child( root_0, multiplyingExpression50.tree )


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
        # trace_out( __method__, 23 )


      end

      return return_value
    end

    MultiplyingExpressionReturnValue = define_return_scope

    #
    # parser rule multiplyingExpression
    #
    # (in Yarpl.g)
    # 128:1: multiplyingExpression : signExpression ( ( TIMES | DIV | 'mod' ) signExpression )* ;
    #
    def multiplyingExpression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )


      return_value = MultiplyingExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set52 = nil
      signExpression51 = nil
      signExpression53 = nil


      tree_for_set52 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 129:7: signExpression ( ( TIMES | DIV | 'mod' ) signExpression )*
      @state.following.push( TOKENS_FOLLOWING_signExpression_IN_multiplyingExpression_753 )
      signExpression51 = signExpression
      @state.following.pop
      @adaptor.add_child( root_0, signExpression51.tree )

      # at line 129:22: ( ( TIMES | DIV | 'mod' ) signExpression )*
      while true # decision 11
        alt_11 = 2
        look_11_0 = @input.peek( 1 )

        if ( look_11_0 == DIV || look_11_0 == TIMES || look_11_0 == T__76 )
          alt_11 = 1

        end
        case alt_11
        when 1
          # at line 129:23: ( TIMES | DIV | 'mod' ) signExpression
          set52 = @input.look

          if @input.peek(1) == DIV || @input.peek(1) == TIMES || @input.peek(1) == T__76
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set52 ) )

            @state.error_recovery = false

          else
            mse = MismatchedSet( nil )
            raise mse

          end


          @state.following.push( TOKENS_FOLLOWING_signExpression_IN_multiplyingExpression_764 )
          signExpression53 = signExpression
          @state.following.pop
          @adaptor.add_child( root_0, signExpression53.tree )


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

    SignExpressionReturnValue = define_return_scope

    #
    # parser rule signExpression
    #
    # (in Yarpl.g)
    # 132:1: signExpression : ( PLUS | MINUS )* primeExpression ;
    #
    def signExpression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )


      return_value = SignExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set54 = nil
      primeExpression55 = nil


      tree_for_set54 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 133:7: ( PLUS | MINUS )* primeExpression
      # at line 133:7: ( PLUS | MINUS )*
      while true # decision 12
        alt_12 = 2
        look_12_0 = @input.peek( 1 )

        if ( look_12_0 == MINUS || look_12_0 == PLUS )
          alt_12 = 1

        end
        case alt_12
        when 1
          # at line 
          set54 = @input.look

          if @input.peek(1) == MINUS || @input.peek(1) == PLUS
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set54 ) )

            @state.error_recovery = false

          else
            mse = MismatchedSet( nil )
            raise mse

          end



        else
          break # out of loop for decision 12
        end
      end # loop for decision 12

      @state.following.push( TOKENS_FOLLOWING_primeExpression_IN_signExpression_790 )
      primeExpression55 = primeExpression
      @state.following.pop
      @adaptor.add_child( root_0, primeExpression55.tree )


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
    # (in Yarpl.g)
    # 136:1: primeExpression : ( primary | LPAREN expression RPAREN );
    #
    def primeExpression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )


      return_value = PrimeExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __LPAREN57__ = nil
      __RPAREN59__ = nil
      primary56 = nil
      expression58 = nil


      tree_for_LPAREN57 = nil
      tree_for_RPAREN59 = nil

      begin
      # at line 137:5: ( primary | LPAREN expression RPAREN )
      alt_13 = 2
      look_13_0 = @input.peek( 1 )

      if ( look_13_0 == IDENTIFIER || look_13_0 == INTEGERLITERAL || look_13_0 == RANGEINTEGERLITERAL )
        alt_13 = 1
      elsif ( look_13_0 == LPAREN )
        alt_13 = 2
      else
        raise NoViableAlternative( "", 13, 0 )

      end
      case alt_13
      when 1
        root_0 = @adaptor.create_flat_list


        # at line 137:7: primary
        @state.following.push( TOKENS_FOLLOWING_primary_IN_primeExpression_807 )
        primary56 = primary
        @state.following.pop
        @adaptor.add_child( root_0, primary56.tree )


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 138:7: LPAREN expression RPAREN
        __LPAREN57__ = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_primeExpression_815 )
        tree_for_LPAREN57 = @adaptor.create_with_payload( __LPAREN57__ )
        @adaptor.add_child( root_0, tree_for_LPAREN57 )


        @state.following.push( TOKENS_FOLLOWING_expression_IN_primeExpression_817 )
        expression58 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression58.tree )

        __RPAREN59__ = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_primeExpression_821 )
        tree_for_RPAREN59 = @adaptor.create_with_payload( __RPAREN59__ )
        @adaptor.add_child( root_0, tree_for_RPAREN59 )



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
    # (in Yarpl.g)
    # 141:1: expressionList : expression ( ',' expression )* ;
    #
    def expressionList
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )


      return_value = ExpressionListReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal61 = nil
      expression60 = nil
      expression62 = nil


      tree_for_char_literal61 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 142:9: expression ( ',' expression )*
      @state.following.push( TOKENS_FOLLOWING_expression_IN_expressionList_840 )
      expression60 = expression
      @state.following.pop
      @adaptor.add_child( root_0, expression60.tree )

      # at line 142:20: ( ',' expression )*
      while true # decision 14
        alt_14 = 2
        look_14_0 = @input.peek( 1 )

        if ( look_14_0 == COMMA )
          alt_14 = 1

        end
        case alt_14
        when 1
          # at line 142:21: ',' expression
          char_literal61 = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_expressionList_843 )
          tree_for_char_literal61 = @adaptor.create_with_payload( char_literal61 )
          @adaptor.add_child( root_0, tree_for_char_literal61 )


          @state.following.push( TOKENS_FOLLOWING_expression_IN_expressionList_845 )
          expression62 = expression
          @state.following.pop
          @adaptor.add_child( root_0, expression62.tree )


        else
          break # out of loop for decision 14
        end
      end # loop for decision 14


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
    # (in Yarpl.g)
    # 145:1: declaration : ( set -> set | primary -> primary );
    #
    def declaration
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )


      return_value = DeclarationReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set63 = nil
      primary64 = nil


      stream_set = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule set" )
      stream_primary = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule primary" )
      begin
      # at line 146:5: ( set -> set | primary -> primary )
      alt_15 = 2
      look_15_0 = @input.peek( 1 )

      if ( look_15_0 == LBRACK )
        alt_15 = 1
      elsif ( look_15_0 == IDENTIFIER || look_15_0 == INTEGERLITERAL || look_15_0 == RANGEINTEGERLITERAL )
        alt_15 = 2
      else
        raise NoViableAlternative( "", 15, 0 )

      end
      case alt_15
      when 1
        # at line 146:7: set
        @state.following.push( TOKENS_FOLLOWING_set_IN_declaration_864 )
        set63 = set
        @state.following.pop
        stream_set.add( set63.tree )

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
        # 146:11: -> set
        @adaptor.add_child( root_0, stream_set.next_tree )




        return_value.tree = root_0



      when 2
        # at line 147:7: primary
        @state.following.push( TOKENS_FOLLOWING_primary_IN_declaration_876 )
        primary64 = primary
        @state.following.pop
        stream_primary.add( primary64.tree )

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
        # 147:15: -> primary
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
    # (in Yarpl.g)
    # 150:1: set : '[' setDeclaration ']' -> ^( SET setDeclaration ) ;
    #
    def set
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )


      return_value = SetReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal65 = nil
      char_literal67 = nil
      setDeclaration66 = nil


      tree_for_char_literal65 = nil
      tree_for_char_literal67 = nil
      stream_RBRACK = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token RBRACK" )
      stream_LBRACK = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token LBRACK" )
      stream_setDeclaration = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule setDeclaration" )
      begin
      # at line 151:7: '[' setDeclaration ']'
      char_literal65 = match( LBRACK, TOKENS_FOLLOWING_LBRACK_IN_set_897 )
      stream_LBRACK.add( char_literal65 )

      @state.following.push( TOKENS_FOLLOWING_setDeclaration_IN_set_899 )
      setDeclaration66 = setDeclaration
      @state.following.pop
      stream_setDeclaration.add( setDeclaration66.tree )

      char_literal67 = match( RBRACK, TOKENS_FOLLOWING_RBRACK_IN_set_901 )
      stream_RBRACK.add( char_literal67 )

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
      # 151:30: -> ^( SET setDeclaration )
      # at line 151:33: ^( SET setDeclaration )
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
    # (in Yarpl.g)
    # 154:1: setDeclaration : declaration ( COMMA declaration )* -> ( ^( declaration ) )* ;
    #
    def setDeclaration
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )


      return_value = SetDeclarationReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __COMMA69__ = nil
      declaration68 = nil
      declaration70 = nil


      tree_for_COMMA69 = nil
      stream_COMMA = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token COMMA" )
      stream_declaration = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule declaration" )
      begin
      # at line 155:7: declaration ( COMMA declaration )*
      @state.following.push( TOKENS_FOLLOWING_declaration_IN_setDeclaration_926 )
      declaration68 = declaration
      @state.following.pop
      stream_declaration.add( declaration68.tree )

      # at line 155:19: ( COMMA declaration )*
      while true # decision 16
        alt_16 = 2
        look_16_0 = @input.peek( 1 )

        if ( look_16_0 == COMMA )
          alt_16 = 1

        end
        case alt_16
        when 1
          # at line 155:20: COMMA declaration
          __COMMA69__ = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_setDeclaration_929 )
          stream_COMMA.add( __COMMA69__ )

          @state.following.push( TOKENS_FOLLOWING_declaration_IN_setDeclaration_931 )
          declaration70 = declaration
          @state.following.pop
          stream_declaration.add( declaration70.tree )


        else
          break # out of loop for decision 16
        end
      end # loop for decision 16

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
      # 155:40: -> ( ^( declaration ) )*
      # at line 155:43: ( ^( declaration ) )*
      while stream_declaration.has_next?
        # at line 155:43: ^( declaration )
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
    # (in Yarpl.g)
    # 158:1: primary : literal ;
    #
    def primary
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )


      return_value = PrimaryReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      literal71 = nil



      begin
      root_0 = @adaptor.create_flat_list


      # at line 159:7: literal
      @state.following.push( TOKENS_FOLLOWING_literal_IN_primary_957 )
      literal71 = literal
      @state.following.pop
      @adaptor.add_child( root_0, literal71.tree )


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
    # (in Yarpl.g)
    # 162:1: creator : createdName classCreatorRest -> ^( VARIABLE_DECLARATION createdName classCreatorRest ) ;
    #
    def creator
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )


      return_value = CreatorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      createdName72 = nil
      classCreatorRest73 = nil


      stream_createdName = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule createdName" )
      stream_classCreatorRest = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule classCreatorRest" )
      begin
      # at line 163:7: createdName classCreatorRest
      @state.following.push( TOKENS_FOLLOWING_createdName_IN_creator_971 )
      createdName72 = createdName
      @state.following.pop
      stream_createdName.add( createdName72.tree )

      @state.following.push( TOKENS_FOLLOWING_classCreatorRest_IN_creator_973 )
      classCreatorRest73 = classCreatorRest
      @state.following.pop
      stream_classCreatorRest.add( classCreatorRest73.tree )

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
      # 163:36: -> ^( VARIABLE_DECLARATION createdName classCreatorRest )
      # at line 163:39: ^( VARIABLE_DECLARATION createdName classCreatorRest )
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
    # (in Yarpl.g)
    # 166:1: createdName : ( structType | primitiveType );
    #
    def createdName
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )


      return_value = CreatedNameReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      structType74 = nil
      primitiveType75 = nil



      begin
      # at line 167:5: ( structType | primitiveType )
      alt_17 = 2
      look_17_0 = @input.peek( 1 )

      if ( look_17_0 == IDENTIFIER )
        alt_17 = 1
      elsif ( look_17_0 == T__75 )
        alt_17 = 2
      else
        raise NoViableAlternative( "", 17, 0 )

      end
      case alt_17
      when 1
        root_0 = @adaptor.create_flat_list


        # at line 167:7: structType
        @state.following.push( TOKENS_FOLLOWING_structType_IN_createdName_1001 )
        structType74 = structType
        @state.following.pop
        @adaptor.add_child( root_0, structType74.tree )


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 168:7: primitiveType
        @state.following.push( TOKENS_FOLLOWING_primitiveType_IN_createdName_1009 )
        primitiveType75 = primitiveType
        @state.following.pop
        @adaptor.add_child( root_0, primitiveType75.tree )


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
    # (in Yarpl.g)
    # 171:1: classCreatorRest : arguments ( classBody )? ;
    #
    def classCreatorRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )


      return_value = ClassCreatorRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      arguments76 = nil
      classBody77 = nil



      begin
      root_0 = @adaptor.create_flat_list


      # at line 172:7: arguments ( classBody )?
      @state.following.push( TOKENS_FOLLOWING_arguments_IN_classCreatorRest_1026 )
      arguments76 = arguments
      @state.following.pop
      @adaptor.add_child( root_0, arguments76.tree )

      # at line 172:17: ( classBody )?
      alt_18 = 2
      look_18_0 = @input.peek( 1 )

      if ( look_18_0 == LBRACE )
        alt_18 = 1
      end
      case alt_18
      when 1
        # at line 172:17: classBody
        @state.following.push( TOKENS_FOLLOWING_classBody_IN_classCreatorRest_1028 )
        classBody77 = classBody
        @state.following.pop
        @adaptor.add_child( root_0, classBody77.tree )


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
    # (in Yarpl.g)
    # 175:1: arguments : '(' ( argumentList )* ')' -> ( argumentList )* ;
    #
    def arguments
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )


      return_value = ArgumentsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal78 = nil
      char_literal80 = nil
      argumentList79 = nil


      tree_for_char_literal78 = nil
      tree_for_char_literal80 = nil
      stream_RPAREN = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token RPAREN" )
      stream_LPAREN = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token LPAREN" )
      stream_argumentList = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule argumentList" )
      begin
      # at line 176:7: '(' ( argumentList )* ')'
      char_literal78 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_arguments_1046 )
      stream_LPAREN.add( char_literal78 )

      # at line 176:11: ( argumentList )*
      while true # decision 19
        alt_19 = 2
        look_19_0 = @input.peek( 1 )

        if ( look_19_0 == IDENTIFIER )
          alt_19 = 1

        end
        case alt_19
        when 1
          # at line 176:11: argumentList
          @state.following.push( TOKENS_FOLLOWING_argumentList_IN_arguments_1048 )
          argumentList79 = argumentList
          @state.following.pop
          stream_argumentList.add( argumentList79.tree )


        else
          break # out of loop for decision 19
        end
      end # loop for decision 19

      char_literal80 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_arguments_1051 )
      stream_RPAREN.add( char_literal80 )

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
      # 176:29: -> ( argumentList )*
      # at line 176:32: ( argumentList )*
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
    # (in Yarpl.g)
    # 179:1: argumentList : argument ( ',' argument )* ;
    #
    def argumentList
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )


      return_value = ArgumentListReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal82 = nil
      argument81 = nil
      argument83 = nil


      tree_for_char_literal82 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 180:7: argument ( ',' argument )*
      @state.following.push( TOKENS_FOLLOWING_argument_IN_argumentList_1073 )
      argument81 = argument
      @state.following.pop
      @adaptor.add_child( root_0, argument81.tree )

      # at line 180:16: ( ',' argument )*
      while true # decision 20
        alt_20 = 2
        look_20_0 = @input.peek( 1 )

        if ( look_20_0 == COMMA )
          alt_20 = 1

        end
        case alt_20
        when 1
          # at line 180:17: ',' argument
          char_literal82 = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_argumentList_1076 )
          tree_for_char_literal82 = @adaptor.create_with_payload( char_literal82 )
          @adaptor.add_child( root_0, tree_for_char_literal82 )


          @state.following.push( TOKENS_FOLLOWING_argument_IN_argumentList_1078 )
          argument83 = argument
          @state.following.pop
          @adaptor.add_child( root_0, argument83.tree )


        else
          break # out of loop for decision 20
        end
      end # loop for decision 20


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
    # (in Yarpl.g)
    # 184:1: argument : IDENTIFIER '=' declaration -> ^( ATTRIBUTE IDENTIFIER declaration ) ;
    #
    def argument
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )


      return_value = ArgumentReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __IDENTIFIER84__ = nil
      char_literal85 = nil
      declaration86 = nil


      tree_for_IDENTIFIER84 = nil
      tree_for_char_literal85 = nil
      stream_IDENTIFIER = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token IDENTIFIER" )
      stream_ASSIGN = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token ASSIGN" )
      stream_declaration = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule declaration" )
      begin
      # at line 185:8: IDENTIFIER '=' declaration
      __IDENTIFIER84__ = match( IDENTIFIER, TOKENS_FOLLOWING_IDENTIFIER_IN_argument_1099 )
      stream_IDENTIFIER.add( __IDENTIFIER84__ )

      char_literal85 = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_argument_1101 )
      stream_ASSIGN.add( char_literal85 )

      @state.following.push( TOKENS_FOLLOWING_declaration_IN_argument_1103 )
      declaration86 = declaration
      @state.following.pop
      stream_declaration.add( declaration86.tree )

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
      # 185:35: -> ^( ATTRIBUTE IDENTIFIER declaration )
      # at line 185:38: ^( ATTRIBUTE IDENTIFIER declaration )
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
    # (in Yarpl.g)
    # 189:1: literal : ( RANGEINTEGERLITERAL | INTEGERLITERAL | IDENTIFIER );
    #
    def literal
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 38 )


      return_value = LiteralReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set87 = nil


      tree_for_set87 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 
      set87 = @input.look

      if @input.peek(1) == IDENTIFIER || @input.peek(1) == INTEGERLITERAL || @input.peek(1) == RANGEINTEGERLITERAL
        @input.consume
        @adaptor.add_child( root_0, @adaptor.create_with_payload( set87 ) )

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
    # (in Yarpl.g)
    # 195:1: type : ( structType -> ^( structType ) | primitiveType -> ^( primitiveType ) );
    #
    def type
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 39 )


      return_value = TypeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      structType88 = nil
      primitiveType89 = nil


      stream_primitiveType = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule primitiveType" )
      stream_structType = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule structType" )
      begin
      # at line 196:5: ( structType -> ^( structType ) | primitiveType -> ^( primitiveType ) )
      alt_21 = 2
      look_21_0 = @input.peek( 1 )

      if ( look_21_0 == IDENTIFIER )
        alt_21 = 1
      elsif ( look_21_0 == T__75 )
        alt_21 = 2
      else
        raise NoViableAlternative( "", 21, 0 )

      end
      case alt_21
      when 1
        # at line 196:7: structType
        @state.following.push( TOKENS_FOLLOWING_structType_IN_type_1153 )
        structType88 = structType
        @state.following.pop
        stream_structType.add( structType88.tree )

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
        # 196:18: -> ^( structType )
        # at line 196:21: ^( structType )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( stream_structType.next_node, root_1 )

        @adaptor.add_child( root_0, root_1 )




        return_value.tree = root_0



      when 2
        # at line 197:7: primitiveType
        @state.following.push( TOKENS_FOLLOWING_primitiveType_IN_type_1167 )
        primitiveType89 = primitiveType
        @state.following.pop
        stream_primitiveType.add( primitiveType89.tree )

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
        # 197:21: -> ^( primitiveType )
        # at line 197:24: ^( primitiveType )
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
    # (in Yarpl.g)
    # 200:1: structType : IDENTIFIER ;
    #
    def structType
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 40 )


      return_value = StructTypeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __IDENTIFIER90__ = nil


      tree_for_IDENTIFIER90 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 201:7: IDENTIFIER
      __IDENTIFIER90__ = match( IDENTIFIER, TOKENS_FOLLOWING_IDENTIFIER_IN_structType_1190 )
      tree_for_IDENTIFIER90 = @adaptor.create_with_payload( __IDENTIFIER90__ )
      @adaptor.add_child( root_0, tree_for_IDENTIFIER90 )



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
    # (in Yarpl.g)
    # 204:1: primitiveType : 'integer' -> ^( INTEGER ) ;
    #
    def primitiveType
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 41 )


      return_value = PrimitiveTypeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal91 = nil


      tree_for_string_literal91 = nil
      stream_T__75 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__75" )

      begin
      # at line 205:7: 'integer'
      string_literal91 = match( T__75, TOKENS_FOLLOWING_T__75_IN_primitiveType_1207 )
      stream_T__75.add( string_literal91 )

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
      # 205:17: -> ^( INTEGER )
      # at line 205:20: ^( INTEGER )
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
    # (in Yarpl.g)
    # 208:1: variableType : ( 'var' -> ^( VARIABLE ) | 'const' -> ^( CONSTANT ) );
    #
    def variableType
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 42 )


      return_value = VariableTypeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal92 = nil
      string_literal93 = nil


      tree_for_string_literal92 = nil
      tree_for_string_literal93 = nil
      stream_T__72 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__72" )
      stream_T__79 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__79" )

      begin
      # at line 209:5: ( 'var' -> ^( VARIABLE ) | 'const' -> ^( CONSTANT ) )
      alt_22 = 2
      look_22_0 = @input.peek( 1 )

      if ( look_22_0 == T__79 )
        alt_22 = 1
      elsif ( look_22_0 == T__72 )
        alt_22 = 2
      else
        raise NoViableAlternative( "", 22, 0 )

      end
      case alt_22
      when 1
        # at line 209:7: 'var'
        string_literal92 = match( T__79, TOKENS_FOLLOWING_T__79_IN_variableType_1230 )
        stream_T__79.add( string_literal92 )

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
        # 209:13: -> ^( VARIABLE )
        # at line 209:16: ^( VARIABLE )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( VARIABLE, "VARIABLE" ), root_1 )

        @adaptor.add_child( root_0, root_1 )




        return_value.tree = root_0



      when 2
        # at line 210:7: 'const'
        string_literal93 = match( T__72, TOKENS_FOLLOWING_T__72_IN_variableType_1244 )
        stream_T__72.add( string_literal93 )

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
        # 210:15: -> ^( CONSTANT )
        # at line 210:18: ^( CONSTANT )
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



    TOKENS_FOLLOWING_program_IN_start_143 = Set[ 1, 73, 74 ]
    TOKENS_FOLLOWING_domainDeclaration_IN_program_190 = Set[ 1 ]
    TOKENS_FOLLOWING_initialDeclaration_IN_program_202 = Set[ 1 ]
    TOKENS_FOLLOWING_T__73_IN_domainDeclaration_220 = Set[ 36 ]
    TOKENS_FOLLOWING_domainBody_IN_domainDeclaration_222 = Set[ 1 ]
    TOKENS_FOLLOWING_LBRACE_IN_domainBody_247 = Set[ 53, 71 ]
    TOKENS_FOLLOWING_domainBodyDeclaration_IN_domainBody_249 = Set[ 53, 71 ]
    TOKENS_FOLLOWING_RBRACE_IN_domainBody_252 = Set[ 1 ]
    TOKENS_FOLLOWING_typeDeclaration_IN_domainBodyDeclaration_274 = Set[ 1 ]
    TOKENS_FOLLOWING_T__74_IN_initialDeclaration_292 = Set[ 36 ]
    TOKENS_FOLLOWING_initialBody_IN_initialDeclaration_294 = Set[ 1 ]
    TOKENS_FOLLOWING_LBRACE_IN_initialBody_320 = Set[ 30, 53, 56 ]
    TOKENS_FOLLOWING_initialBodyDeclaration_IN_initialBody_322 = Set[ 30, 53, 56 ]
    TOKENS_FOLLOWING_RBRACE_IN_initialBody_325 = Set[ 1 ]
    TOKENS_FOLLOWING_statement_IN_initialBodyDeclaration_347 = Set[ 1 ]
    TOKENS_FOLLOWING_classDeclaration_IN_typeDeclaration_364 = Set[ 1 ]
    TOKENS_FOLLOWING_T__71_IN_classDeclaration_389 = Set[ 30 ]
    TOKENS_FOLLOWING_IDENTIFIER_IN_classDeclaration_391 = Set[ 36 ]
    TOKENS_FOLLOWING_classBody_IN_classDeclaration_393 = Set[ 1 ]
    TOKENS_FOLLOWING_LBRACE_IN_classBody_415 = Set[ 53, 72, 79 ]
    TOKENS_FOLLOWING_classBodyDeclaration_IN_classBody_417 = Set[ 53, 72, 79 ]
    TOKENS_FOLLOWING_RBRACE_IN_classBody_420 = Set[ 1 ]
    TOKENS_FOLLOWING_memberDeclaration_IN_classBodyDeclaration_439 = Set[ 1 ]
    TOKENS_FOLLOWING_fieldDeclaration_IN_memberDeclaration_459 = Set[ 1 ]
    TOKENS_FOLLOWING_variableType_IN_fieldDeclaration_481 = Set[ 30, 75 ]
    TOKENS_FOLLOWING_type_IN_fieldDeclaration_483 = Set[ 30 ]
    TOKENS_FOLLOWING_variableDeclaratorId_IN_fieldDeclaration_485 = Set[ 56 ]
    TOKENS_FOLLOWING_SEMI_IN_fieldDeclaration_487 = Set[ 1 ]
    TOKENS_FOLLOWING_variableDeclarator_IN_variableDeclarators_516 = Set[ 1, 14 ]
    TOKENS_FOLLOWING_COMMA_IN_variableDeclarators_519 = Set[ 30 ]
    TOKENS_FOLLOWING_variableDeclarator_IN_variableDeclarators_521 = Set[ 1, 14 ]
    TOKENS_FOLLOWING_variableDeclaratorId_IN_variableDeclarator_540 = Set[ 7 ]
    TOKENS_FOLLOWING_ASSIGN_IN_variableDeclarator_542 = Set[ 77 ]
    TOKENS_FOLLOWING_variableInitializer_IN_variableDeclarator_544 = Set[ 1 ]
    TOKENS_FOLLOWING_IDENTIFIER_IN_variableDeclaratorId_571 = Set[ 1 ]
    TOKENS_FOLLOWING_T__77_IN_variableInitializer_588 = Set[ 30, 75 ]
    TOKENS_FOLLOWING_creator_IN_variableInitializer_590 = Set[ 1 ]
    TOKENS_FOLLOWING_variableDeclarators_IN_localVariableDeclaration_611 = Set[ 56 ]
    TOKENS_FOLLOWING_SEMI_IN_localVariableDeclaration_613 = Set[ 1 ]
    TOKENS_FOLLOWING_localVariableDeclaration_IN_statement_635 = Set[ 1 ]
    TOKENS_FOLLOWING_SEMI_IN_statement_643 = Set[ 1 ]
    TOKENS_FOLLOWING_relationalExpression_IN_expression_661 = Set[ 1, 70, 78 ]
    TOKENS_FOLLOWING_set_IN_expression_664 = Set[ 30, 35, 40, 44, 49, 52 ]
    TOKENS_FOLLOWING_relationalExpression_IN_expression_670 = Set[ 1, 70, 78 ]
    TOKENS_FOLLOWING_addingExpression_IN_relationalExpression_689 = Set[ 1, 26, 28, 29, 41, 42, 47 ]
    TOKENS_FOLLOWING_set_IN_relationalExpression_692 = Set[ 30, 35, 40, 44, 49, 52 ]
    TOKENS_FOLLOWING_addingExpression_IN_relationalExpression_706 = Set[ 1, 26, 28, 29, 41, 42, 47 ]
    TOKENS_FOLLOWING_multiplyingExpression_IN_addingExpression_725 = Set[ 1, 44, 49 ]
    TOKENS_FOLLOWING_set_IN_addingExpression_728 = Set[ 30, 35, 40, 44, 49, 52 ]
    TOKENS_FOLLOWING_multiplyingExpression_IN_addingExpression_734 = Set[ 1, 44, 49 ]
    TOKENS_FOLLOWING_signExpression_IN_multiplyingExpression_753 = Set[ 1, 21, 60, 76 ]
    TOKENS_FOLLOWING_set_IN_multiplyingExpression_756 = Set[ 30, 35, 40, 44, 49, 52 ]
    TOKENS_FOLLOWING_signExpression_IN_multiplyingExpression_764 = Set[ 1, 21, 60, 76 ]
    TOKENS_FOLLOWING_primeExpression_IN_signExpression_790 = Set[ 1 ]
    TOKENS_FOLLOWING_primary_IN_primeExpression_807 = Set[ 1 ]
    TOKENS_FOLLOWING_LPAREN_IN_primeExpression_815 = Set[ 30, 35, 40, 44, 49, 52 ]
    TOKENS_FOLLOWING_expression_IN_primeExpression_817 = Set[ 55 ]
    TOKENS_FOLLOWING_RPAREN_IN_primeExpression_821 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_expressionList_840 = Set[ 1, 14 ]
    TOKENS_FOLLOWING_COMMA_IN_expressionList_843 = Set[ 30, 35, 40, 44, 49, 52 ]
    TOKENS_FOLLOWING_expression_IN_expressionList_845 = Set[ 1, 14 ]
    TOKENS_FOLLOWING_set_IN_declaration_864 = Set[ 1 ]
    TOKENS_FOLLOWING_primary_IN_declaration_876 = Set[ 1 ]
    TOKENS_FOLLOWING_LBRACK_IN_set_897 = Set[ 30, 35, 37, 52 ]
    TOKENS_FOLLOWING_setDeclaration_IN_set_899 = Set[ 54 ]
    TOKENS_FOLLOWING_RBRACK_IN_set_901 = Set[ 1 ]
    TOKENS_FOLLOWING_declaration_IN_setDeclaration_926 = Set[ 1, 14 ]
    TOKENS_FOLLOWING_COMMA_IN_setDeclaration_929 = Set[ 30, 35, 37, 52 ]
    TOKENS_FOLLOWING_declaration_IN_setDeclaration_931 = Set[ 1, 14 ]
    TOKENS_FOLLOWING_literal_IN_primary_957 = Set[ 1 ]
    TOKENS_FOLLOWING_createdName_IN_creator_971 = Set[ 40 ]
    TOKENS_FOLLOWING_classCreatorRest_IN_creator_973 = Set[ 1 ]
    TOKENS_FOLLOWING_structType_IN_createdName_1001 = Set[ 1 ]
    TOKENS_FOLLOWING_primitiveType_IN_createdName_1009 = Set[ 1 ]
    TOKENS_FOLLOWING_arguments_IN_classCreatorRest_1026 = Set[ 1, 36 ]
    TOKENS_FOLLOWING_classBody_IN_classCreatorRest_1028 = Set[ 1 ]
    TOKENS_FOLLOWING_LPAREN_IN_arguments_1046 = Set[ 30, 55 ]
    TOKENS_FOLLOWING_argumentList_IN_arguments_1048 = Set[ 30, 55 ]
    TOKENS_FOLLOWING_RPAREN_IN_arguments_1051 = Set[ 1 ]
    TOKENS_FOLLOWING_argument_IN_argumentList_1073 = Set[ 1, 14 ]
    TOKENS_FOLLOWING_COMMA_IN_argumentList_1076 = Set[ 30 ]
    TOKENS_FOLLOWING_argument_IN_argumentList_1078 = Set[ 1, 14 ]
    TOKENS_FOLLOWING_IDENTIFIER_IN_argument_1099 = Set[ 7 ]
    TOKENS_FOLLOWING_ASSIGN_IN_argument_1101 = Set[ 30, 35, 37, 52 ]
    TOKENS_FOLLOWING_declaration_IN_argument_1103 = Set[ 1 ]
    TOKENS_FOLLOWING_structType_IN_type_1153 = Set[ 1 ]
    TOKENS_FOLLOWING_primitiveType_IN_type_1167 = Set[ 1 ]
    TOKENS_FOLLOWING_IDENTIFIER_IN_structType_1190 = Set[ 1 ]
    TOKENS_FOLLOWING_T__75_IN_primitiveType_1207 = Set[ 1 ]
    TOKENS_FOLLOWING_T__79_IN_variableType_1230 = Set[ 1 ]
    TOKENS_FOLLOWING_T__72_IN_variableType_1244 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0

end

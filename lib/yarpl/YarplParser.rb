#!/usr/bin/env ruby
#
# /home/nino/github/yarpler/lib/yarpl/Yarpl.g
# --
# Generated using ANTLR version: 3.5
# Ruby runtime library version: 1.10.0
# Input grammar file: /home/nino/github/yarpler/lib/yarpl/Yarpl.g
# Generated at: 2014-09-23 15:05:31
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
    define_tokens( :EOF => -1, :T__67 => 67, :T__68 => 68, :T__69 => 69, 
                   :T__70 => 70, :T__71 => 71, :T__72 => 72, :T__73 => 73, 
                   :T__74 => 74, :T__75 => 75, :T__76 => 76, :T__77 => 77, 
                   :T__78 => 78, :T__79 => 79, :T__80 => 80, :T__81 => 81, 
                   :T__82 => 82, :T__83 => 83, :T__84 => 84, :T__85 => 85, 
                   :ALPHABET => 4, :ALPHANUMERIC => 5, :AND => 6, :ASSIGN => 7, 
                   :ATTRIBUTE => 8, :BANG => 9, :CLASS_BODY => 10, :CLASS_BODY_DECLARATION => 11, 
                   :CLASS_DECLARATION => 12, :COLON => 13, :COMMA => 14, 
                   :COMMENT => 15, :DEC => 16, :DIGIT => 17, :DIGITORUNDERSCORE => 18, 
                   :DIGITS => 19, :DIV => 20, :DOMAIN_BODY => 21, :DOMAIN_BODY_DECLARATION => 22, 
                   :DOMAIN_DECLARATION => 23, :DOT => 24, :EQUALS => 25, 
                   :FIELD_DECLARATION => 26, :GT => 27, :GTE => 28, :IDENTIFIER => 29, 
                   :INC => 30, :INITIAL_BODY => 31, :INITIAL_DECLARATION => 32, 
                   :INTEGER => 33, :INTEGERLITERAL => 34, :LBRACE => 35, 
                   :LBRACK => 36, :LINE_COMMENT => 37, :LOWERCASE => 38, 
                   :LPAREN => 39, :LT => 40, :LTE => 41, :MEMBER_DECLARATION => 42, 
                   :MINUS => 43, :MOD => 44, :NONZERODIGIT => 45, :NOT_EQUALS => 46, 
                   :OR => 47, :PLUS => 48, :PROGRAM => 49, :QUESTION => 50, 
                   :RANGEINTEGERLITERAL => 51, :RBRACE => 52, :RBRACK => 53, 
                   :RPAREN => 54, :SEMI => 55, :SIGN => 56, :START => 57, 
                   :TIMES => 58, :TYPE_DECLARATION => 59, :UPPERCASE => 60, 
                   :VARIABLE_DECLARATION => 61, :VARIABLE_DECLARATOR => 62, 
                   :VARIABLE_TYPE => 63, :WS => 64, :YARPL_LETTER => 65, 
                   :YARPL_LETTERORDIGIT => 66 )


    # register the proper human-readable name or literal value
    # for each token type
    #
    # this is necessary because anonymous tokens, which are
    # created from literal values in the grammar, do not
    # have descriptive names
    register_names( "ALPHABET", "ALPHANUMERIC", "AND", "ASSIGN", "ATTRIBUTE", 
                    "BANG", "CLASS_BODY", "CLASS_BODY_DECLARATION", "CLASS_DECLARATION", 
                    "COLON", "COMMA", "COMMENT", "DEC", "DIGIT", "DIGITORUNDERSCORE", 
                    "DIGITS", "DIV", "DOMAIN_BODY", "DOMAIN_BODY_DECLARATION", 
                    "DOMAIN_DECLARATION", "DOT", "EQUALS", "FIELD_DECLARATION", 
                    "GT", "GTE", "IDENTIFIER", "INC", "INITIAL_BODY", "INITIAL_DECLARATION", 
                    "INTEGER", "INTEGERLITERAL", "LBRACE", "LBRACK", "LINE_COMMENT", 
                    "LOWERCASE", "LPAREN", "LT", "LTE", "MEMBER_DECLARATION", 
                    "MINUS", "MOD", "NONZERODIGIT", "NOT_EQUALS", "OR", 
                    "PLUS", "PROGRAM", "QUESTION", "RANGEINTEGERLITERAL", 
                    "RBRACE", "RBRACK", "RPAREN", "SEMI", "SIGN", "START", 
                    "TIMES", "TYPE_DECLARATION", "UPPERCASE", "VARIABLE_DECLARATION", 
                    "VARIABLE_DECLARATOR", "VARIABLE_TYPE", "WS", "YARPL_LETTER", 
                    "YARPL_LETTERORDIGIT", "'and'", "'boolean'", "'class'", 
                    "'const'", "'datetime'", "'decimal'", "'domain'", "'float'", 
                    "'initial'", "'integer'", "'mod'", "'new'", "'nullableboolean'", 
                    "'object'", "'or'", "'set'", "'string'", "'time'", "'var'" )


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
                     :expressionList, :primary, :creator, :createdName, 
                     :classCreatorRest, :arguments, :argumentList, :argument, 
                     :literal, :type, :structType, :primitiveType, :variableType ].freeze

    include TokenData

    begin
      generated_using( "/home/nino/github/yarpler/lib/yarpl/Yarpl.g", "3.5", "1.10.0" )
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
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    # 29:1: start : ( program )* -> ^( START ( program )* ) ;
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
      # at line 30:7: ( program )*
      # at line 30:7: ( program )*
      while true # decision 1
        alt_1 = 2
        look_1_0 = @input.peek( 1 )

        if ( look_1_0 == T__73 || look_1_0 == T__75 )
          alt_1 = 1

        end
        case alt_1
        when 1
          # at line 30:7: program
          @state.following.push( TOKENS_FOLLOWING_program_IN_start_128 )
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
      # 30:16: -> ^( START ( program )* )
      # at line 30:19: ^( START ( program )* )
      root_1 = @adaptor.create_flat_list
      root_1 = @adaptor.become_root( @adaptor.create_from_type( START, "START" ), root_1 )

      # at line 30:27: ( program )*
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
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    # 33:1: program : ( domainDeclaration -> domainDeclaration | initialDeclaration -> initialDeclaration );
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
      # at line 34:5: ( domainDeclaration -> domainDeclaration | initialDeclaration -> initialDeclaration )
      alt_2 = 2
      look_2_0 = @input.peek( 1 )

      if ( look_2_0 == T__73 )
        alt_2 = 1
      elsif ( look_2_0 == T__75 )
        alt_2 = 2
      else
        raise NoViableAlternative( "", 2, 0 )

      end
      case alt_2
      when 1
        # at line 34:7: domainDeclaration
        @state.following.push( TOKENS_FOLLOWING_domainDeclaration_IN_program_175 )
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
        # 34:25: -> domainDeclaration
        @adaptor.add_child( root_0, stream_domainDeclaration.next_tree )




        return_value.tree = root_0



      when 2
        # at line 35:7: initialDeclaration
        @state.following.push( TOKENS_FOLLOWING_initialDeclaration_IN_program_187 )
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
        # 35:26: -> initialDeclaration
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
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    # 38:1: domainDeclaration : 'domain' domainBody -> ^( DOMAIN_DECLARATION domainBody ) ;
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
      # at line 39:7: 'domain' domainBody
      string_literal4 = match( T__73, TOKENS_FOLLOWING_T__73_IN_domainDeclaration_205 )
      stream_T__73.add( string_literal4 )

      @state.following.push( TOKENS_FOLLOWING_domainBody_IN_domainDeclaration_207 )
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
      # 39:27: -> ^( DOMAIN_DECLARATION domainBody )
      # at line 39:30: ^( DOMAIN_DECLARATION domainBody )
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
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    # 42:1: domainBody : '{' ( domainBodyDeclaration )* '}' -> ( domainBodyDeclaration )* ;
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
      # at line 43:7: '{' ( domainBodyDeclaration )* '}'
      char_literal6 = match( LBRACE, TOKENS_FOLLOWING_LBRACE_IN_domainBody_232 )
      stream_LBRACE.add( char_literal6 )

      # at line 43:11: ( domainBodyDeclaration )*
      while true # decision 3
        alt_3 = 2
        look_3_0 = @input.peek( 1 )

        if ( look_3_0 == T__69 )
          alt_3 = 1

        end
        case alt_3
        when 1
          # at line 43:11: domainBodyDeclaration
          @state.following.push( TOKENS_FOLLOWING_domainBodyDeclaration_IN_domainBody_234 )
          domainBodyDeclaration7 = domainBodyDeclaration
          @state.following.pop
          stream_domainBodyDeclaration.add( domainBodyDeclaration7.tree )


        else
          break # out of loop for decision 3
        end
      end # loop for decision 3

      char_literal8 = match( RBRACE, TOKENS_FOLLOWING_RBRACE_IN_domainBody_237 )
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
      # 43:38: -> ( domainBodyDeclaration )*
      # at line 43:41: ( domainBodyDeclaration )*
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
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    # 46:1: domainBodyDeclaration : typeDeclaration -> typeDeclaration ;
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
      # at line 47:7: typeDeclaration
      @state.following.push( TOKENS_FOLLOWING_typeDeclaration_IN_domainBodyDeclaration_259 )
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
      # 47:23: -> typeDeclaration
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
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    # 50:1: initialDeclaration : 'initial' initialBody -> ^( INITIAL_DECLARATION initialBody ) ;
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
      # at line 51:7: 'initial' initialBody
      string_literal10 = match( T__75, TOKENS_FOLLOWING_T__75_IN_initialDeclaration_277 )
      stream_T__75.add( string_literal10 )

      @state.following.push( TOKENS_FOLLOWING_initialBody_IN_initialDeclaration_279 )
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
      # 51:30: -> ^( INITIAL_DECLARATION initialBody )
      # at line 51:33: ^( INITIAL_DECLARATION initialBody )
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
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    # 54:1: initialBody : '{' ( initialBodyDeclaration )* '}' -> ( initialBodyDeclaration )* ;
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
      # at line 55:7: '{' ( initialBodyDeclaration )* '}'
      char_literal12 = match( LBRACE, TOKENS_FOLLOWING_LBRACE_IN_initialBody_305 )
      stream_LBRACE.add( char_literal12 )

      # at line 55:11: ( initialBodyDeclaration )*
      while true # decision 4
        alt_4 = 2
        look_4_0 = @input.peek( 1 )

        if ( look_4_0 == IDENTIFIER || look_4_0 == SEMI )
          alt_4 = 1

        end
        case alt_4
        when 1
          # at line 55:11: initialBodyDeclaration
          @state.following.push( TOKENS_FOLLOWING_initialBodyDeclaration_IN_initialBody_307 )
          initialBodyDeclaration13 = initialBodyDeclaration
          @state.following.pop
          stream_initialBodyDeclaration.add( initialBodyDeclaration13.tree )


        else
          break # out of loop for decision 4
        end
      end # loop for decision 4

      char_literal14 = match( RBRACE, TOKENS_FOLLOWING_RBRACE_IN_initialBody_310 )
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
      # 55:39: -> ( initialBodyDeclaration )*
      # at line 55:42: ( initialBodyDeclaration )*
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
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    # 58:1: initialBodyDeclaration : statement ;
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


      # at line 59:7: statement
      @state.following.push( TOKENS_FOLLOWING_statement_IN_initialBodyDeclaration_332 )
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
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    # 62:1: typeDeclaration : classDeclaration -> ^( CLASS_DECLARATION classDeclaration ) ;
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
      # at line 63:7: classDeclaration
      @state.following.push( TOKENS_FOLLOWING_classDeclaration_IN_typeDeclaration_349 )
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
      # 63:24: -> ^( CLASS_DECLARATION classDeclaration )
      # at line 63:27: ^( CLASS_DECLARATION classDeclaration )
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
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    # 66:1: classDeclaration : 'class' IDENTIFIER classBody -> ^( IDENTIFIER classBody ) ;
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
      stream_T__69 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__69" )
      stream_IDENTIFIER = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token IDENTIFIER" )
      stream_classBody = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule classBody" )
      begin
      # at line 67:7: 'class' IDENTIFIER classBody
      string_literal17 = match( T__69, TOKENS_FOLLOWING_T__69_IN_classDeclaration_374 )
      stream_T__69.add( string_literal17 )

      __IDENTIFIER18__ = match( IDENTIFIER, TOKENS_FOLLOWING_IDENTIFIER_IN_classDeclaration_376 )
      stream_IDENTIFIER.add( __IDENTIFIER18__ )

      @state.following.push( TOKENS_FOLLOWING_classBody_IN_classDeclaration_378 )
      classBody19 = classBody
      @state.following.pop
      stream_classBody.add( classBody19.tree )

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
      # 67:36: -> ^( IDENTIFIER classBody )
      # at line 67:39: ^( IDENTIFIER classBody )
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
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    # 70:1: classBody : '{' ( classBodyDeclaration )* '}' -> ( classBodyDeclaration )* ;
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
      # at line 71:7: '{' ( classBodyDeclaration )* '}'
      char_literal20 = match( LBRACE, TOKENS_FOLLOWING_LBRACE_IN_classBody_400 )
      stream_LBRACE.add( char_literal20 )

      # at line 71:11: ( classBodyDeclaration )*
      while true # decision 5
        alt_5 = 2
        look_5_0 = @input.peek( 1 )

        if ( look_5_0 == T__70 || look_5_0 == T__80 || look_5_0 == T__82 || look_5_0 == T__85 )
          alt_5 = 1

        end
        case alt_5
        when 1
          # at line 71:11: classBodyDeclaration
          @state.following.push( TOKENS_FOLLOWING_classBodyDeclaration_IN_classBody_402 )
          classBodyDeclaration21 = classBodyDeclaration
          @state.following.pop
          stream_classBodyDeclaration.add( classBodyDeclaration21.tree )


        else
          break # out of loop for decision 5
        end
      end # loop for decision 5

      char_literal22 = match( RBRACE, TOKENS_FOLLOWING_RBRACE_IN_classBody_405 )
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
      # 71:37: -> ( classBodyDeclaration )*
      # at line 71:40: ( classBodyDeclaration )*
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
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    # 74:1: classBodyDeclaration : memberDeclaration -> ^( memberDeclaration ) ;
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
      # at line 75:7: memberDeclaration
      @state.following.push( TOKENS_FOLLOWING_memberDeclaration_IN_classBodyDeclaration_424 )
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
      # 75:25: -> ^( memberDeclaration )
      # at line 75:28: ^( memberDeclaration )
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
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    # 78:1: memberDeclaration : fieldDeclaration -> fieldDeclaration ;
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
      # at line 79:7: fieldDeclaration
      @state.following.push( TOKENS_FOLLOWING_fieldDeclaration_IN_memberDeclaration_444 )
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
      # 79:24: -> fieldDeclaration
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
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    # 82:1: fieldDeclaration : variableType type variableDeclaratorId ';' -> ^( FIELD_DECLARATION type variableDeclaratorId ) ;
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
      # at line 83:7: variableType type variableDeclaratorId ';'
      @state.following.push( TOKENS_FOLLOWING_variableType_IN_fieldDeclaration_466 )
      variableType25 = variableType
      @state.following.pop
      stream_variableType.add( variableType25.tree )

      @state.following.push( TOKENS_FOLLOWING_type_IN_fieldDeclaration_468 )
      type26 = type
      @state.following.pop
      stream_type.add( type26.tree )

      @state.following.push( TOKENS_FOLLOWING_variableDeclaratorId_IN_fieldDeclaration_470 )
      variableDeclaratorId27 = variableDeclaratorId
      @state.following.pop
      stream_variableDeclaratorId.add( variableDeclaratorId27.tree )

      char_literal28 = match( SEMI, TOKENS_FOLLOWING_SEMI_IN_fieldDeclaration_472 )
      stream_SEMI.add( char_literal28 )

      # AST Rewrite
      # elements: type, variableDeclaratorId
      # token labels: 
      # rule labels: return_value
      # token list labels: 
      # rule list labels: 
      # wildcard labels: 
      return_value.tree = root_0
      stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

      root_0 = @adaptor.create_flat_list
      # 83:50: -> ^( FIELD_DECLARATION type variableDeclaratorId )
      # at line 83:53: ^( FIELD_DECLARATION type variableDeclaratorId )
      root_1 = @adaptor.create_flat_list
      root_1 = @adaptor.become_root( @adaptor.create_from_type( FIELD_DECLARATION, "FIELD_DECLARATION" ), root_1 )

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
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    # 86:1: variableDeclarators : variableDeclarator ( ',' variableDeclarator )* ;
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


      # at line 87:7: variableDeclarator ( ',' variableDeclarator )*
      @state.following.push( TOKENS_FOLLOWING_variableDeclarator_IN_variableDeclarators_499 )
      variableDeclarator29 = variableDeclarator
      @state.following.pop
      @adaptor.add_child( root_0, variableDeclarator29.tree )

      # at line 87:26: ( ',' variableDeclarator )*
      while true # decision 6
        alt_6 = 2
        look_6_0 = @input.peek( 1 )

        if ( look_6_0 == COMMA )
          alt_6 = 1

        end
        case alt_6
        when 1
          # at line 87:27: ',' variableDeclarator
          char_literal30 = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_variableDeclarators_502 )
          tree_for_char_literal30 = @adaptor.create_with_payload( char_literal30 )
          @adaptor.add_child( root_0, tree_for_char_literal30 )


          @state.following.push( TOKENS_FOLLOWING_variableDeclarator_IN_variableDeclarators_504 )
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
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    # 90:1: variableDeclarator : variableDeclaratorId '=' variableInitializer -> ^( VARIABLE_DECLARATOR variableDeclaratorId variableInitializer ) ;
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
      # at line 91:7: variableDeclaratorId '=' variableInitializer
      @state.following.push( TOKENS_FOLLOWING_variableDeclaratorId_IN_variableDeclarator_523 )
      variableDeclaratorId32 = variableDeclaratorId
      @state.following.pop
      stream_variableDeclaratorId.add( variableDeclaratorId32.tree )

      char_literal33 = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_variableDeclarator_525 )
      stream_ASSIGN.add( char_literal33 )

      @state.following.push( TOKENS_FOLLOWING_variableInitializer_IN_variableDeclarator_527 )
      variableInitializer34 = variableInitializer
      @state.following.pop
      stream_variableInitializer.add( variableInitializer34.tree )

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
      # 91:52: -> ^( VARIABLE_DECLARATOR variableDeclaratorId variableInitializer )
      # at line 91:55: ^( VARIABLE_DECLARATOR variableDeclaratorId variableInitializer )
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
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    # 94:1: variableDeclaratorId : IDENTIFIER ;
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


      # at line 95:7: IDENTIFIER
      __IDENTIFIER35__ = match( IDENTIFIER, TOKENS_FOLLOWING_IDENTIFIER_IN_variableDeclaratorId_554 )
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
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    # 98:1: variableInitializer : 'new' creator -> creator ;
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
      stream_T__78 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__78" )
      stream_creator = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule creator" )
      begin
      # at line 99:7: 'new' creator
      string_literal36 = match( T__78, TOKENS_FOLLOWING_T__78_IN_variableInitializer_571 )
      stream_T__78.add( string_literal36 )

      @state.following.push( TOKENS_FOLLOWING_creator_IN_variableInitializer_573 )
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
      # 99:21: -> creator
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
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    # 102:1: localVariableDeclaration : variableDeclarators ';' -> variableDeclarators ;
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
      # at line 103:7: variableDeclarators ';'
      @state.following.push( TOKENS_FOLLOWING_variableDeclarators_IN_localVariableDeclaration_594 )
      variableDeclarators38 = variableDeclarators
      @state.following.pop
      stream_variableDeclarators.add( variableDeclarators38.tree )

      char_literal39 = match( SEMI, TOKENS_FOLLOWING_SEMI_IN_localVariableDeclaration_596 )
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
      # 103:31: -> variableDeclarators
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
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    # 107:1: statement : ( localVariableDeclaration | ';' );
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
      # at line 108:5: ( localVariableDeclaration | ';' )
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


        # at line 108:7: localVariableDeclaration
        @state.following.push( TOKENS_FOLLOWING_localVariableDeclaration_IN_statement_618 )
        localVariableDeclaration40 = localVariableDeclaration
        @state.following.pop
        @adaptor.add_child( root_0, localVariableDeclaration40.tree )


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 109:7: ';'
        char_literal41 = match( SEMI, TOKENS_FOLLOWING_SEMI_IN_statement_626 )
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
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    # 113:1: expression : relationalExpression ( ( 'and' | 'or' ) relationalExpression )* ;
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


      # at line 114:5: relationalExpression ( ( 'and' | 'or' ) relationalExpression )*
      @state.following.push( TOKENS_FOLLOWING_relationalExpression_IN_expression_644 )
      relationalExpression42 = relationalExpression
      @state.following.pop
      @adaptor.add_child( root_0, relationalExpression42.tree )

      # at line 114:26: ( ( 'and' | 'or' ) relationalExpression )*
      while true # decision 8
        alt_8 = 2
        look_8_0 = @input.peek( 1 )

        if ( look_8_0 == T__67 || look_8_0 == T__81 )
          alt_8 = 1

        end
        case alt_8
        when 1
          # at line 114:27: ( 'and' | 'or' ) relationalExpression
          set43 = @input.look

          if @input.peek(1) == T__67 || @input.peek(1) == T__81
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set43 ) )

            @state.error_recovery = false

          else
            mse = MismatchedSet( nil )
            raise mse

          end


          @state.following.push( TOKENS_FOLLOWING_relationalExpression_IN_expression_653 )
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
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    # 117:1: relationalExpression : addingExpression ( ( EQUALS | NOT_EQUALS | GT | GTE | LT | LTE ) addingExpression )* ;
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


      # at line 118:7: addingExpression ( ( EQUALS | NOT_EQUALS | GT | GTE | LT | LTE ) addingExpression )*
      @state.following.push( TOKENS_FOLLOWING_addingExpression_IN_relationalExpression_672 )
      addingExpression45 = addingExpression
      @state.following.pop
      @adaptor.add_child( root_0, addingExpression45.tree )

      # at line 118:24: ( ( EQUALS | NOT_EQUALS | GT | GTE | LT | LTE ) addingExpression )*
      while true # decision 9
        alt_9 = 2
        look_9_0 = @input.peek( 1 )

        if ( look_9_0 == EQUALS || look_9_0.between?( GT, GTE ) || look_9_0.between?( LT, LTE ) || look_9_0 == NOT_EQUALS )
          alt_9 = 1

        end
        case alt_9
        when 1
          # at line 118:25: ( EQUALS | NOT_EQUALS | GT | GTE | LT | LTE ) addingExpression
          set46 = @input.look

          if @input.peek(1) == EQUALS || @input.peek( 1 ).between?( GT, GTE ) || @input.peek( 1 ).between?( LT, LTE ) || @input.peek(1) == NOT_EQUALS
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set46 ) )

            @state.error_recovery = false

          else
            mse = MismatchedSet( nil )
            raise mse

          end


          @state.following.push( TOKENS_FOLLOWING_addingExpression_IN_relationalExpression_689 )
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
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    # 121:1: addingExpression : multiplyingExpression ( ( PLUS | MINUS ) multiplyingExpression )* ;
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


      # at line 122:7: multiplyingExpression ( ( PLUS | MINUS ) multiplyingExpression )*
      @state.following.push( TOKENS_FOLLOWING_multiplyingExpression_IN_addingExpression_708 )
      multiplyingExpression48 = multiplyingExpression
      @state.following.pop
      @adaptor.add_child( root_0, multiplyingExpression48.tree )

      # at line 122:29: ( ( PLUS | MINUS ) multiplyingExpression )*
      while true # decision 10
        alt_10 = 2
        look_10_0 = @input.peek( 1 )

        if ( look_10_0 == MINUS || look_10_0 == PLUS )
          alt_10 = 1

        end
        case alt_10
        when 1
          # at line 122:30: ( PLUS | MINUS ) multiplyingExpression
          set49 = @input.look

          if @input.peek(1) == MINUS || @input.peek(1) == PLUS
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set49 ) )

            @state.error_recovery = false

          else
            mse = MismatchedSet( nil )
            raise mse

          end


          @state.following.push( TOKENS_FOLLOWING_multiplyingExpression_IN_addingExpression_717 )
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
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    # 125:1: multiplyingExpression : signExpression ( ( TIMES | DIV | 'mod' ) signExpression )* ;
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


      # at line 126:7: signExpression ( ( TIMES | DIV | 'mod' ) signExpression )*
      @state.following.push( TOKENS_FOLLOWING_signExpression_IN_multiplyingExpression_736 )
      signExpression51 = signExpression
      @state.following.pop
      @adaptor.add_child( root_0, signExpression51.tree )

      # at line 126:22: ( ( TIMES | DIV | 'mod' ) signExpression )*
      while true # decision 11
        alt_11 = 2
        look_11_0 = @input.peek( 1 )

        if ( look_11_0 == DIV || look_11_0 == TIMES || look_11_0 == T__77 )
          alt_11 = 1

        end
        case alt_11
        when 1
          # at line 126:23: ( TIMES | DIV | 'mod' ) signExpression
          set52 = @input.look

          if @input.peek(1) == DIV || @input.peek(1) == TIMES || @input.peek(1) == T__77
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set52 ) )

            @state.error_recovery = false

          else
            mse = MismatchedSet( nil )
            raise mse

          end


          @state.following.push( TOKENS_FOLLOWING_signExpression_IN_multiplyingExpression_747 )
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
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    # 129:1: signExpression : ( PLUS | MINUS )* primeExpression ;
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


      # at line 130:7: ( PLUS | MINUS )* primeExpression
      # at line 130:7: ( PLUS | MINUS )*
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

      @state.following.push( TOKENS_FOLLOWING_primeExpression_IN_signExpression_773 )
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
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    # 133:1: primeExpression : ( primary | LPAREN expression RPAREN );
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
      # at line 134:5: ( primary | LPAREN expression RPAREN )
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


        # at line 134:7: primary
        @state.following.push( TOKENS_FOLLOWING_primary_IN_primeExpression_790 )
        primary56 = primary
        @state.following.pop
        @adaptor.add_child( root_0, primary56.tree )


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 135:7: LPAREN expression RPAREN
        __LPAREN57__ = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_primeExpression_798 )
        tree_for_LPAREN57 = @adaptor.create_with_payload( __LPAREN57__ )
        @adaptor.add_child( root_0, tree_for_LPAREN57 )


        @state.following.push( TOKENS_FOLLOWING_expression_IN_primeExpression_800 )
        expression58 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression58.tree )

        __RPAREN59__ = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_primeExpression_804 )
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
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    # 138:1: expressionList : expression ( ',' expression )* ;
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


      # at line 139:9: expression ( ',' expression )*
      @state.following.push( TOKENS_FOLLOWING_expression_IN_expressionList_823 )
      expression60 = expression
      @state.following.pop
      @adaptor.add_child( root_0, expression60.tree )

      # at line 139:20: ( ',' expression )*
      while true # decision 14
        alt_14 = 2
        look_14_0 = @input.peek( 1 )

        if ( look_14_0 == COMMA )
          alt_14 = 1

        end
        case alt_14
        when 1
          # at line 139:21: ',' expression
          char_literal61 = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_expressionList_826 )
          tree_for_char_literal61 = @adaptor.create_with_payload( char_literal61 )
          @adaptor.add_child( root_0, tree_for_char_literal61 )


          @state.following.push( TOKENS_FOLLOWING_expression_IN_expressionList_828 )
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

    PrimaryReturnValue = define_return_scope

    #
    # parser rule primary
    #
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    # 142:1: primary : literal ;
    #
    def primary
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )


      return_value = PrimaryReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      literal63 = nil



      begin
      root_0 = @adaptor.create_flat_list


      # at line 143:7: literal
      @state.following.push( TOKENS_FOLLOWING_literal_IN_primary_847 )
      literal63 = literal
      @state.following.pop
      @adaptor.add_child( root_0, literal63.tree )


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

    CreatorReturnValue = define_return_scope

    #
    # parser rule creator
    #
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    # 146:1: creator : createdName classCreatorRest -> ^( VARIABLE_DECLARATION createdName classCreatorRest ) ;
    #
    def creator
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )


      return_value = CreatorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      createdName64 = nil
      classCreatorRest65 = nil


      stream_createdName = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule createdName" )
      stream_classCreatorRest = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule classCreatorRest" )
      begin
      # at line 147:7: createdName classCreatorRest
      @state.following.push( TOKENS_FOLLOWING_createdName_IN_creator_861 )
      createdName64 = createdName
      @state.following.pop
      stream_createdName.add( createdName64.tree )

      @state.following.push( TOKENS_FOLLOWING_classCreatorRest_IN_creator_863 )
      classCreatorRest65 = classCreatorRest
      @state.following.pop
      stream_classCreatorRest.add( classCreatorRest65.tree )

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
      # 147:36: -> ^( VARIABLE_DECLARATION createdName classCreatorRest )
      # at line 147:39: ^( VARIABLE_DECLARATION createdName classCreatorRest )
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
        # trace_out( __method__, 29 )


      end

      return return_value
    end

    CreatedNameReturnValue = define_return_scope

    #
    # parser rule createdName
    #
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    # 150:1: createdName : ( structType | primitiveType );
    #
    def createdName
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )


      return_value = CreatedNameReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      structType66 = nil
      primitiveType67 = nil



      begin
      # at line 151:5: ( structType | primitiveType )
      alt_15 = 2
      look_15_0 = @input.peek( 1 )

      if ( look_15_0 == IDENTIFIER )
        alt_15 = 1
      elsif ( look_15_0 == T__68 || look_15_0.between?( T__71, T__72 ) || look_15_0 == T__74 || look_15_0 == T__76 || look_15_0 == T__79 || look_15_0.between?( T__83, T__84 ) )
        alt_15 = 2
      else
        raise NoViableAlternative( "", 15, 0 )

      end
      case alt_15
      when 1
        root_0 = @adaptor.create_flat_list


        # at line 151:7: structType
        @state.following.push( TOKENS_FOLLOWING_structType_IN_createdName_891 )
        structType66 = structType
        @state.following.pop
        @adaptor.add_child( root_0, structType66.tree )


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 152:7: primitiveType
        @state.following.push( TOKENS_FOLLOWING_primitiveType_IN_createdName_899 )
        primitiveType67 = primitiveType
        @state.following.pop
        @adaptor.add_child( root_0, primitiveType67.tree )


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

    ClassCreatorRestReturnValue = define_return_scope

    #
    # parser rule classCreatorRest
    #
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    # 155:1: classCreatorRest : arguments ( classBody )? ;
    #
    def classCreatorRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )


      return_value = ClassCreatorRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      arguments68 = nil
      classBody69 = nil



      begin
      root_0 = @adaptor.create_flat_list


      # at line 156:7: arguments ( classBody )?
      @state.following.push( TOKENS_FOLLOWING_arguments_IN_classCreatorRest_916 )
      arguments68 = arguments
      @state.following.pop
      @adaptor.add_child( root_0, arguments68.tree )

      # at line 156:17: ( classBody )?
      alt_16 = 2
      look_16_0 = @input.peek( 1 )

      if ( look_16_0 == LBRACE )
        alt_16 = 1
      end
      case alt_16
      when 1
        # at line 156:17: classBody
        @state.following.push( TOKENS_FOLLOWING_classBody_IN_classCreatorRest_918 )
        classBody69 = classBody
        @state.following.pop
        @adaptor.add_child( root_0, classBody69.tree )


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
        # trace_out( __method__, 31 )


      end

      return return_value
    end

    ArgumentsReturnValue = define_return_scope

    #
    # parser rule arguments
    #
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    # 159:1: arguments : '(' ( argumentList )* ')' -> ( argumentList )* ;
    #
    def arguments
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )


      return_value = ArgumentsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal70 = nil
      char_literal72 = nil
      argumentList71 = nil


      tree_for_char_literal70 = nil
      tree_for_char_literal72 = nil
      stream_RPAREN = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token RPAREN" )
      stream_LPAREN = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token LPAREN" )
      stream_argumentList = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule argumentList" )
      begin
      # at line 160:7: '(' ( argumentList )* ')'
      char_literal70 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_arguments_936 )
      stream_LPAREN.add( char_literal70 )

      # at line 160:11: ( argumentList )*
      while true # decision 17
        alt_17 = 2
        look_17_0 = @input.peek( 1 )

        if ( look_17_0 == IDENTIFIER )
          alt_17 = 1

        end
        case alt_17
        when 1
          # at line 160:11: argumentList
          @state.following.push( TOKENS_FOLLOWING_argumentList_IN_arguments_938 )
          argumentList71 = argumentList
          @state.following.pop
          stream_argumentList.add( argumentList71.tree )


        else
          break # out of loop for decision 17
        end
      end # loop for decision 17

      char_literal72 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_arguments_941 )
      stream_RPAREN.add( char_literal72 )

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
      # 160:29: -> ( argumentList )*
      # at line 160:32: ( argumentList )*
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
        # trace_out( __method__, 32 )


      end

      return return_value
    end

    ArgumentListReturnValue = define_return_scope

    #
    # parser rule argumentList
    #
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    # 163:1: argumentList : argument ( ',' argument )* ;
    #
    def argumentList
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )


      return_value = ArgumentListReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal74 = nil
      argument73 = nil
      argument75 = nil


      tree_for_char_literal74 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 164:7: argument ( ',' argument )*
      @state.following.push( TOKENS_FOLLOWING_argument_IN_argumentList_963 )
      argument73 = argument
      @state.following.pop
      @adaptor.add_child( root_0, argument73.tree )

      # at line 164:16: ( ',' argument )*
      while true # decision 18
        alt_18 = 2
        look_18_0 = @input.peek( 1 )

        if ( look_18_0 == COMMA )
          alt_18 = 1

        end
        case alt_18
        when 1
          # at line 164:17: ',' argument
          char_literal74 = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_argumentList_966 )
          tree_for_char_literal74 = @adaptor.create_with_payload( char_literal74 )
          @adaptor.add_child( root_0, tree_for_char_literal74 )


          @state.following.push( TOKENS_FOLLOWING_argument_IN_argumentList_968 )
          argument75 = argument
          @state.following.pop
          @adaptor.add_child( root_0, argument75.tree )


        else
          break # out of loop for decision 18
        end
      end # loop for decision 18


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

    ArgumentReturnValue = define_return_scope

    #
    # parser rule argument
    #
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    # 168:1: argument : IDENTIFIER '=' primary -> ^( ATTRIBUTE IDENTIFIER primary ) ;
    #
    def argument
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )


      return_value = ArgumentReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __IDENTIFIER76__ = nil
      char_literal77 = nil
      primary78 = nil


      tree_for_IDENTIFIER76 = nil
      tree_for_char_literal77 = nil
      stream_IDENTIFIER = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token IDENTIFIER" )
      stream_ASSIGN = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token ASSIGN" )
      stream_primary = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule primary" )
      begin
      # at line 169:8: IDENTIFIER '=' primary
      __IDENTIFIER76__ = match( IDENTIFIER, TOKENS_FOLLOWING_IDENTIFIER_IN_argument_989 )
      stream_IDENTIFIER.add( __IDENTIFIER76__ )

      char_literal77 = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_argument_991 )
      stream_ASSIGN.add( char_literal77 )

      @state.following.push( TOKENS_FOLLOWING_primary_IN_argument_993 )
      primary78 = primary
      @state.following.pop
      stream_primary.add( primary78.tree )

      # AST Rewrite
      # elements: primary, IDENTIFIER
      # token labels: 
      # rule labels: return_value
      # token list labels: 
      # rule list labels: 
      # wildcard labels: 
      return_value.tree = root_0
      stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

      root_0 = @adaptor.create_flat_list
      # 169:31: -> ^( ATTRIBUTE IDENTIFIER primary )
      # at line 169:34: ^( ATTRIBUTE IDENTIFIER primary )
      root_1 = @adaptor.create_flat_list
      root_1 = @adaptor.become_root( @adaptor.create_from_type( ATTRIBUTE, "ATTRIBUTE" ), root_1 )

      @adaptor.add_child( root_1, stream_IDENTIFIER.next_node )

      @adaptor.add_child( root_1, stream_primary.next_tree )

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

    LiteralReturnValue = define_return_scope

    #
    # parser rule literal
    #
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    # 173:1: literal : ( RANGEINTEGERLITERAL | INTEGERLITERAL | IDENTIFIER );
    #
    def literal
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )


      return_value = LiteralReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set79 = nil


      tree_for_set79 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 
      set79 = @input.look

      if @input.peek(1) == IDENTIFIER || @input.peek(1) == INTEGERLITERAL || @input.peek(1) == RANGEINTEGERLITERAL
        @input.consume
        @adaptor.add_child( root_0, @adaptor.create_with_payload( set79 ) )

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
        # trace_out( __method__, 35 )


      end

      return return_value
    end

    TypeReturnValue = define_return_scope

    #
    # parser rule type
    #
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    # 179:1: type : ( structType -> ^( VARIABLE_TYPE structType ) | primitiveType -> ^( VARIABLE_TYPE primitiveType ) );
    #
    def type
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )


      return_value = TypeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      structType80 = nil
      primitiveType81 = nil


      stream_primitiveType = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule primitiveType" )
      stream_structType = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule structType" )
      begin
      # at line 180:5: ( structType -> ^( VARIABLE_TYPE structType ) | primitiveType -> ^( VARIABLE_TYPE primitiveType ) )
      alt_19 = 2
      look_19_0 = @input.peek( 1 )

      if ( look_19_0 == IDENTIFIER )
        alt_19 = 1
      elsif ( look_19_0 == T__68 || look_19_0.between?( T__71, T__72 ) || look_19_0 == T__74 || look_19_0 == T__76 || look_19_0 == T__79 || look_19_0.between?( T__83, T__84 ) )
        alt_19 = 2
      else
        raise NoViableAlternative( "", 19, 0 )

      end
      case alt_19
      when 1
        # at line 180:7: structType
        @state.following.push( TOKENS_FOLLOWING_structType_IN_type_1043 )
        structType80 = structType
        @state.following.pop
        stream_structType.add( structType80.tree )

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
        # 180:18: -> ^( VARIABLE_TYPE structType )
        # at line 180:21: ^( VARIABLE_TYPE structType )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( VARIABLE_TYPE, "VARIABLE_TYPE" ), root_1 )

        @adaptor.add_child( root_1, stream_structType.next_tree )

        @adaptor.add_child( root_0, root_1 )




        return_value.tree = root_0



      when 2
        # at line 181:7: primitiveType
        @state.following.push( TOKENS_FOLLOWING_primitiveType_IN_type_1059 )
        primitiveType81 = primitiveType
        @state.following.pop
        stream_primitiveType.add( primitiveType81.tree )

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
        # 181:21: -> ^( VARIABLE_TYPE primitiveType )
        # at line 181:24: ^( VARIABLE_TYPE primitiveType )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( VARIABLE_TYPE, "VARIABLE_TYPE" ), root_1 )

        @adaptor.add_child( root_1, stream_primitiveType.next_tree )

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
        # trace_out( __method__, 36 )


      end

      return return_value
    end

    StructTypeReturnValue = define_return_scope

    #
    # parser rule structType
    #
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    # 184:1: structType : IDENTIFIER ;
    #
    def structType
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )


      return_value = StructTypeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __IDENTIFIER82__ = nil


      tree_for_IDENTIFIER82 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 185:7: IDENTIFIER
      __IDENTIFIER82__ = match( IDENTIFIER, TOKENS_FOLLOWING_IDENTIFIER_IN_structType_1084 )
      tree_for_IDENTIFIER82 = @adaptor.create_with_payload( __IDENTIFIER82__ )
      @adaptor.add_child( root_0, tree_for_IDENTIFIER82 )



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

    PrimitiveTypeReturnValue = define_return_scope

    #
    # parser rule primitiveType
    #
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    # 188:1: primitiveType : ( 'boolean' | 'nullableboolean' | 'float' | 'integer' -> ^( INTEGER ) | 'string' | 'decimal' | 'datetime' | 'time' );
    #
    def primitiveType
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 38 )


      return_value = PrimitiveTypeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal83 = nil
      string_literal84 = nil
      string_literal85 = nil
      string_literal86 = nil
      string_literal87 = nil
      string_literal88 = nil
      string_literal89 = nil
      string_literal90 = nil


      tree_for_string_literal83 = nil
      tree_for_string_literal84 = nil
      tree_for_string_literal85 = nil
      tree_for_string_literal86 = nil
      tree_for_string_literal87 = nil
      tree_for_string_literal88 = nil
      tree_for_string_literal89 = nil
      tree_for_string_literal90 = nil
      stream_T__76 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__76" )

      begin
      # at line 189:5: ( 'boolean' | 'nullableboolean' | 'float' | 'integer' -> ^( INTEGER ) | 'string' | 'decimal' | 'datetime' | 'time' )
      alt_20 = 8
      case look_20 = @input.peek( 1 )
      when T__68 then alt_20 = 1
      when T__79 then alt_20 = 2
      when T__74 then alt_20 = 3
      when T__76 then alt_20 = 4
      when T__83 then alt_20 = 5
      when T__72 then alt_20 = 6
      when T__71 then alt_20 = 7
      when T__84 then alt_20 = 8
      else
        raise NoViableAlternative( "", 20, 0 )

      end
      case alt_20
      when 1
        root_0 = @adaptor.create_flat_list


        # at line 189:7: 'boolean'
        string_literal83 = match( T__68, TOKENS_FOLLOWING_T__68_IN_primitiveType_1101 )
        tree_for_string_literal83 = @adaptor.create_with_payload( string_literal83 )
        @adaptor.add_child( root_0, tree_for_string_literal83 )



      when 2
        root_0 = @adaptor.create_flat_list


        # at line 190:7: 'nullableboolean'
        string_literal84 = match( T__79, TOKENS_FOLLOWING_T__79_IN_primitiveType_1109 )
        tree_for_string_literal84 = @adaptor.create_with_payload( string_literal84 )
        @adaptor.add_child( root_0, tree_for_string_literal84 )



      when 3
        root_0 = @adaptor.create_flat_list


        # at line 191:7: 'float'
        string_literal85 = match( T__74, TOKENS_FOLLOWING_T__74_IN_primitiveType_1117 )
        tree_for_string_literal85 = @adaptor.create_with_payload( string_literal85 )
        @adaptor.add_child( root_0, tree_for_string_literal85 )



      when 4
        # at line 192:7: 'integer'
        string_literal86 = match( T__76, TOKENS_FOLLOWING_T__76_IN_primitiveType_1125 )
        stream_T__76.add( string_literal86 )

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
        # 192:17: -> ^( INTEGER )
        # at line 192:20: ^( INTEGER )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( INTEGER, "INTEGER" ), root_1 )

        @adaptor.add_child( root_0, root_1 )




        return_value.tree = root_0



      when 5
        root_0 = @adaptor.create_flat_list


        # at line 193:7: 'string'
        string_literal87 = match( T__83, TOKENS_FOLLOWING_T__83_IN_primitiveType_1139 )
        tree_for_string_literal87 = @adaptor.create_with_payload( string_literal87 )
        @adaptor.add_child( root_0, tree_for_string_literal87 )



      when 6
        root_0 = @adaptor.create_flat_list


        # at line 194:7: 'decimal'
        string_literal88 = match( T__72, TOKENS_FOLLOWING_T__72_IN_primitiveType_1147 )
        tree_for_string_literal88 = @adaptor.create_with_payload( string_literal88 )
        @adaptor.add_child( root_0, tree_for_string_literal88 )



      when 7
        root_0 = @adaptor.create_flat_list


        # at line 195:7: 'datetime'
        string_literal89 = match( T__71, TOKENS_FOLLOWING_T__71_IN_primitiveType_1155 )
        tree_for_string_literal89 = @adaptor.create_with_payload( string_literal89 )
        @adaptor.add_child( root_0, tree_for_string_literal89 )



      when 8
        root_0 = @adaptor.create_flat_list


        # at line 196:7: 'time'
        string_literal90 = match( T__84, TOKENS_FOLLOWING_T__84_IN_primitiveType_1163 )
        tree_for_string_literal90 = @adaptor.create_with_payload( string_literal90 )
        @adaptor.add_child( root_0, tree_for_string_literal90 )



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

    VariableTypeReturnValue = define_return_scope

    #
    # parser rule variableType
    #
    # (in /home/nino/github/yarpler/lib/yarpl/Yarpl.g)
    # 199:1: variableType : ( 'object' | 'var' | 'const' | 'set' );
    #
    def variableType
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 39 )


      return_value = VariableTypeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set91 = nil


      tree_for_set91 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 
      set91 = @input.look

      if @input.peek(1) == T__70 || @input.peek(1) == T__80 || @input.peek(1) == T__82 || @input.peek(1) == T__85
        @input.consume
        @adaptor.add_child( root_0, @adaptor.create_with_payload( set91 ) )

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
        # trace_out( __method__, 39 )


      end

      return return_value
    end



    TOKENS_FOLLOWING_program_IN_start_128 = Set[ 1, 73, 75 ]
    TOKENS_FOLLOWING_domainDeclaration_IN_program_175 = Set[ 1 ]
    TOKENS_FOLLOWING_initialDeclaration_IN_program_187 = Set[ 1 ]
    TOKENS_FOLLOWING_T__73_IN_domainDeclaration_205 = Set[ 35 ]
    TOKENS_FOLLOWING_domainBody_IN_domainDeclaration_207 = Set[ 1 ]
    TOKENS_FOLLOWING_LBRACE_IN_domainBody_232 = Set[ 52, 69 ]
    TOKENS_FOLLOWING_domainBodyDeclaration_IN_domainBody_234 = Set[ 52, 69 ]
    TOKENS_FOLLOWING_RBRACE_IN_domainBody_237 = Set[ 1 ]
    TOKENS_FOLLOWING_typeDeclaration_IN_domainBodyDeclaration_259 = Set[ 1 ]
    TOKENS_FOLLOWING_T__75_IN_initialDeclaration_277 = Set[ 35 ]
    TOKENS_FOLLOWING_initialBody_IN_initialDeclaration_279 = Set[ 1 ]
    TOKENS_FOLLOWING_LBRACE_IN_initialBody_305 = Set[ 29, 52, 55 ]
    TOKENS_FOLLOWING_initialBodyDeclaration_IN_initialBody_307 = Set[ 29, 52, 55 ]
    TOKENS_FOLLOWING_RBRACE_IN_initialBody_310 = Set[ 1 ]
    TOKENS_FOLLOWING_statement_IN_initialBodyDeclaration_332 = Set[ 1 ]
    TOKENS_FOLLOWING_classDeclaration_IN_typeDeclaration_349 = Set[ 1 ]
    TOKENS_FOLLOWING_T__69_IN_classDeclaration_374 = Set[ 29 ]
    TOKENS_FOLLOWING_IDENTIFIER_IN_classDeclaration_376 = Set[ 35 ]
    TOKENS_FOLLOWING_classBody_IN_classDeclaration_378 = Set[ 1 ]
    TOKENS_FOLLOWING_LBRACE_IN_classBody_400 = Set[ 52, 70, 80, 82, 85 ]
    TOKENS_FOLLOWING_classBodyDeclaration_IN_classBody_402 = Set[ 52, 70, 80, 82, 85 ]
    TOKENS_FOLLOWING_RBRACE_IN_classBody_405 = Set[ 1 ]
    TOKENS_FOLLOWING_memberDeclaration_IN_classBodyDeclaration_424 = Set[ 1 ]
    TOKENS_FOLLOWING_fieldDeclaration_IN_memberDeclaration_444 = Set[ 1 ]
    TOKENS_FOLLOWING_variableType_IN_fieldDeclaration_466 = Set[ 29, 68, 71, 72, 74, 76, 79, 83, 84 ]
    TOKENS_FOLLOWING_type_IN_fieldDeclaration_468 = Set[ 29 ]
    TOKENS_FOLLOWING_variableDeclaratorId_IN_fieldDeclaration_470 = Set[ 55 ]
    TOKENS_FOLLOWING_SEMI_IN_fieldDeclaration_472 = Set[ 1 ]
    TOKENS_FOLLOWING_variableDeclarator_IN_variableDeclarators_499 = Set[ 1, 14 ]
    TOKENS_FOLLOWING_COMMA_IN_variableDeclarators_502 = Set[ 29 ]
    TOKENS_FOLLOWING_variableDeclarator_IN_variableDeclarators_504 = Set[ 1, 14 ]
    TOKENS_FOLLOWING_variableDeclaratorId_IN_variableDeclarator_523 = Set[ 7 ]
    TOKENS_FOLLOWING_ASSIGN_IN_variableDeclarator_525 = Set[ 78 ]
    TOKENS_FOLLOWING_variableInitializer_IN_variableDeclarator_527 = Set[ 1 ]
    TOKENS_FOLLOWING_IDENTIFIER_IN_variableDeclaratorId_554 = Set[ 1 ]
    TOKENS_FOLLOWING_T__78_IN_variableInitializer_571 = Set[ 29, 68, 71, 72, 74, 76, 79, 83, 84 ]
    TOKENS_FOLLOWING_creator_IN_variableInitializer_573 = Set[ 1 ]
    TOKENS_FOLLOWING_variableDeclarators_IN_localVariableDeclaration_594 = Set[ 55 ]
    TOKENS_FOLLOWING_SEMI_IN_localVariableDeclaration_596 = Set[ 1 ]
    TOKENS_FOLLOWING_localVariableDeclaration_IN_statement_618 = Set[ 1 ]
    TOKENS_FOLLOWING_SEMI_IN_statement_626 = Set[ 1 ]
    TOKENS_FOLLOWING_relationalExpression_IN_expression_644 = Set[ 1, 67, 81 ]
    TOKENS_FOLLOWING_set_IN_expression_647 = Set[ 29, 34, 39, 43, 48, 51 ]
    TOKENS_FOLLOWING_relationalExpression_IN_expression_653 = Set[ 1, 67, 81 ]
    TOKENS_FOLLOWING_addingExpression_IN_relationalExpression_672 = Set[ 1, 25, 27, 28, 40, 41, 46 ]
    TOKENS_FOLLOWING_set_IN_relationalExpression_675 = Set[ 29, 34, 39, 43, 48, 51 ]
    TOKENS_FOLLOWING_addingExpression_IN_relationalExpression_689 = Set[ 1, 25, 27, 28, 40, 41, 46 ]
    TOKENS_FOLLOWING_multiplyingExpression_IN_addingExpression_708 = Set[ 1, 43, 48 ]
    TOKENS_FOLLOWING_set_IN_addingExpression_711 = Set[ 29, 34, 39, 43, 48, 51 ]
    TOKENS_FOLLOWING_multiplyingExpression_IN_addingExpression_717 = Set[ 1, 43, 48 ]
    TOKENS_FOLLOWING_signExpression_IN_multiplyingExpression_736 = Set[ 1, 20, 58, 77 ]
    TOKENS_FOLLOWING_set_IN_multiplyingExpression_739 = Set[ 29, 34, 39, 43, 48, 51 ]
    TOKENS_FOLLOWING_signExpression_IN_multiplyingExpression_747 = Set[ 1, 20, 58, 77 ]
    TOKENS_FOLLOWING_primeExpression_IN_signExpression_773 = Set[ 1 ]
    TOKENS_FOLLOWING_primary_IN_primeExpression_790 = Set[ 1 ]
    TOKENS_FOLLOWING_LPAREN_IN_primeExpression_798 = Set[ 29, 34, 39, 43, 48, 51 ]
    TOKENS_FOLLOWING_expression_IN_primeExpression_800 = Set[ 54 ]
    TOKENS_FOLLOWING_RPAREN_IN_primeExpression_804 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_expressionList_823 = Set[ 1, 14 ]
    TOKENS_FOLLOWING_COMMA_IN_expressionList_826 = Set[ 29, 34, 39, 43, 48, 51 ]
    TOKENS_FOLLOWING_expression_IN_expressionList_828 = Set[ 1, 14 ]
    TOKENS_FOLLOWING_literal_IN_primary_847 = Set[ 1 ]
    TOKENS_FOLLOWING_createdName_IN_creator_861 = Set[ 39 ]
    TOKENS_FOLLOWING_classCreatorRest_IN_creator_863 = Set[ 1 ]
    TOKENS_FOLLOWING_structType_IN_createdName_891 = Set[ 1 ]
    TOKENS_FOLLOWING_primitiveType_IN_createdName_899 = Set[ 1 ]
    TOKENS_FOLLOWING_arguments_IN_classCreatorRest_916 = Set[ 1, 35 ]
    TOKENS_FOLLOWING_classBody_IN_classCreatorRest_918 = Set[ 1 ]
    TOKENS_FOLLOWING_LPAREN_IN_arguments_936 = Set[ 29, 54 ]
    TOKENS_FOLLOWING_argumentList_IN_arguments_938 = Set[ 29, 54 ]
    TOKENS_FOLLOWING_RPAREN_IN_arguments_941 = Set[ 1 ]
    TOKENS_FOLLOWING_argument_IN_argumentList_963 = Set[ 1, 14 ]
    TOKENS_FOLLOWING_COMMA_IN_argumentList_966 = Set[ 29 ]
    TOKENS_FOLLOWING_argument_IN_argumentList_968 = Set[ 1, 14 ]
    TOKENS_FOLLOWING_IDENTIFIER_IN_argument_989 = Set[ 7 ]
    TOKENS_FOLLOWING_ASSIGN_IN_argument_991 = Set[ 29, 34, 51 ]
    TOKENS_FOLLOWING_primary_IN_argument_993 = Set[ 1 ]
    TOKENS_FOLLOWING_structType_IN_type_1043 = Set[ 1 ]
    TOKENS_FOLLOWING_primitiveType_IN_type_1059 = Set[ 1 ]
    TOKENS_FOLLOWING_IDENTIFIER_IN_structType_1084 = Set[ 1 ]
    TOKENS_FOLLOWING_T__68_IN_primitiveType_1101 = Set[ 1 ]
    TOKENS_FOLLOWING_T__79_IN_primitiveType_1109 = Set[ 1 ]
    TOKENS_FOLLOWING_T__74_IN_primitiveType_1117 = Set[ 1 ]
    TOKENS_FOLLOWING_T__76_IN_primitiveType_1125 = Set[ 1 ]
    TOKENS_FOLLOWING_T__83_IN_primitiveType_1139 = Set[ 1 ]
    TOKENS_FOLLOWING_T__72_IN_primitiveType_1147 = Set[ 1 ]
    TOKENS_FOLLOWING_T__71_IN_primitiveType_1155 = Set[ 1 ]
    TOKENS_FOLLOWING_T__84_IN_primitiveType_1163 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0

end

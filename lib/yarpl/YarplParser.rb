#!/usr/bin/env ruby
#
# Yarpl.g
# --
# Generated using ANTLR version: 3.5
# Ruby runtime library version: 1.10.0
# Input grammar file: Yarpl.g
# Generated at: 2014-09-22 22:16:07
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
                   :T__80 => 80, :T__81 => 81, :T__82 => 82, :ALPHABET => 4, 
                   :ALPHANUMERIC => 5, :AND => 6, :ASSIGN => 7, :BANG => 8, 
                   :CLASS_BODY => 9, :CLASS_BODY_DECLARATION => 10, :CLASS_DECLARATION => 11, 
                   :COLON => 12, :COMMA => 13, :COMMENT => 14, :DEC => 15, 
                   :DECIMALNUMBER => 16, :DIGIT => 17, :DIGITORUNDERSCORE => 18, 
                   :DIGITS => 19, :DIV => 20, :DOMAIN_BODY => 21, :DOMAIN_BODY_DECLARATION => 22, 
                   :DOMAIN_DECLARATION => 23, :DOT => 24, :EQUALS => 25, 
                   :FIELD_DECLARATION => 26, :GT => 27, :GTE => 28, :IDENTIFIER => 29, 
                   :INC => 30, :INITIAL_BODY => 31, :INITIAL_DECLARATION => 32, 
                   :INTEGER => 33, :LBRACE => 34, :LBRACK => 35, :LINE_COMMENT => 36, 
                   :LOWERCASE => 37, :LPAREN => 38, :LT => 39, :LTE => 40, 
                   :MEMBER_DECLARATION => 41, :MINUS => 42, :MOD => 43, 
                   :NONZERODIGIT => 44, :NOT_EQUALS => 45, :OR => 46, :PLUS => 47, 
                   :PROGRAM => 48, :QUESTION => 49, :RANGEINTEGERLITERAL => 50, 
                   :RBRACE => 51, :RBRACK => 52, :RPAREN => 53, :SEMI => 54, 
                   :SIGN => 55, :START => 56, :TIMES => 57, :TYPE_DECLARATION => 58, 
                   :UPPERCASE => 59, :VARIABLE_DECLARATOR => 60, :VARIABLE_TYPE => 61, 
                   :WS => 62, :YARPL_LETTER => 63, :YARPL_LETTERORDIGIT => 64 )


    # register the proper human-readable name or literal value
    # for each token type
    #
    # this is necessary because anonymous tokens, which are
    # created from literal values in the grammar, do not
    # have descriptive names
    register_names( "ALPHABET", "ALPHANUMERIC", "AND", "ASSIGN", "BANG", 
                    "CLASS_BODY", "CLASS_BODY_DECLARATION", "CLASS_DECLARATION", 
                    "COLON", "COMMA", "COMMENT", "DEC", "DECIMALNUMBER", 
                    "DIGIT", "DIGITORUNDERSCORE", "DIGITS", "DIV", "DOMAIN_BODY", 
                    "DOMAIN_BODY_DECLARATION", "DOMAIN_DECLARATION", "DOT", 
                    "EQUALS", "FIELD_DECLARATION", "GT", "GTE", "IDENTIFIER", 
                    "INC", "INITIAL_BODY", "INITIAL_DECLARATION", "INTEGER", 
                    "LBRACE", "LBRACK", "LINE_COMMENT", "LOWERCASE", "LPAREN", 
                    "LT", "LTE", "MEMBER_DECLARATION", "MINUS", "MOD", "NONZERODIGIT", 
                    "NOT_EQUALS", "OR", "PLUS", "PROGRAM", "QUESTION", "RANGEINTEGERLITERAL", 
                    "RBRACE", "RBRACK", "RPAREN", "SEMI", "SIGN", "START", 
                    "TIMES", "TYPE_DECLARATION", "UPPERCASE", "VARIABLE_DECLARATOR", 
                    "VARIABLE_TYPE", "WS", "YARPL_LETTER", "YARPL_LETTERORDIGIT", 
                    "'and'", "'boolean'", "'class'", "'datetime'", "'decimal'", 
                    "'domain'", "'float'", "'initial'", "'integer'", "'mod'", 
                    "'new'", "'nullableboolean'", "'object'", "'or'", "'set'", 
                    "'string'", "'time'", "'var'" )


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
                     :classCreatorRest, :arguments, :literal, :type, :structType, 
                     :primitiveType, :variableType ].freeze

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
    # 27:1: start : ( program )* -> ^( START ( program )* ) ;
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
      # at line 28:7: ( program )*
      # at line 28:7: ( program )*
      while true # decision 1
        alt_1 = 2
        look_1_0 = @input.peek( 1 )

        if ( look_1_0 == T__70 || look_1_0 == T__72 )
          alt_1 = 1

        end
        case alt_1
        when 1
          # at line 28:7: program
          @state.following.push( TOKENS_FOLLOWING_program_IN_start_118 )
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
      # 28:16: -> ^( START ( program )* )
      # at line 28:19: ^( START ( program )* )
      root_1 = @adaptor.create_flat_list
      root_1 = @adaptor.become_root( @adaptor.create_from_type( START, "START" ), root_1 )

      # at line 28:27: ( program )*
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
    # 31:1: program : ( domainDeclaration -> ^( PROGRAM domainDeclaration ) | initialDeclaration -> ^( PROGRAM initialDeclaration ) );
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
      # at line 32:5: ( domainDeclaration -> ^( PROGRAM domainDeclaration ) | initialDeclaration -> ^( PROGRAM initialDeclaration ) )
      alt_2 = 2
      look_2_0 = @input.peek( 1 )

      if ( look_2_0 == T__70 )
        alt_2 = 1
      elsif ( look_2_0 == T__72 )
        alt_2 = 2
      else
        raise NoViableAlternative( "", 2, 0 )

      end
      case alt_2
      when 1
        # at line 32:7: domainDeclaration
        @state.following.push( TOKENS_FOLLOWING_domainDeclaration_IN_program_165 )
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
        # 32:25: -> ^( PROGRAM domainDeclaration )
        # at line 32:28: ^( PROGRAM domainDeclaration )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( PROGRAM, "PROGRAM" ), root_1 )

        @adaptor.add_child( root_1, stream_domainDeclaration.next_tree )

        @adaptor.add_child( root_0, root_1 )




        return_value.tree = root_0



      when 2
        # at line 33:7: initialDeclaration
        @state.following.push( TOKENS_FOLLOWING_initialDeclaration_IN_program_181 )
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
        # 33:26: -> ^( PROGRAM initialDeclaration )
        # at line 33:29: ^( PROGRAM initialDeclaration )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( PROGRAM, "PROGRAM" ), root_1 )

        @adaptor.add_child( root_1, stream_initialDeclaration.next_tree )

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
        # trace_out( __method__, 2 )


      end

      return return_value
    end

    DomainDeclarationReturnValue = define_return_scope

    #
    # parser rule domainDeclaration
    #
    # (in Yarpl.g)
    # 36:1: domainDeclaration : 'domain' domainBody -> ^( DOMAIN_DECLARATION domainBody ) ;
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
      stream_T__70 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__70" )
      stream_domainBody = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule domainBody" )
      begin
      # at line 37:7: 'domain' domainBody
      string_literal4 = match( T__70, TOKENS_FOLLOWING_T__70_IN_domainDeclaration_203 )
      stream_T__70.add( string_literal4 )

      @state.following.push( TOKENS_FOLLOWING_domainBody_IN_domainDeclaration_205 )
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
      # 37:27: -> ^( DOMAIN_DECLARATION domainBody )
      # at line 37:30: ^( DOMAIN_DECLARATION domainBody )
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
    # 40:1: domainBody : '{' ( domainBodyDeclaration )* '}' -> ^( DOMAIN_BODY ( domainBodyDeclaration )* ) ;
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
      # at line 41:7: '{' ( domainBodyDeclaration )* '}'
      char_literal6 = match( LBRACE, TOKENS_FOLLOWING_LBRACE_IN_domainBody_230 )
      stream_LBRACE.add( char_literal6 )

      # at line 41:11: ( domainBodyDeclaration )*
      while true # decision 3
        alt_3 = 2
        look_3_0 = @input.peek( 1 )

        if ( look_3_0 == T__67 )
          alt_3 = 1

        end
        case alt_3
        when 1
          # at line 41:11: domainBodyDeclaration
          @state.following.push( TOKENS_FOLLOWING_domainBodyDeclaration_IN_domainBody_232 )
          domainBodyDeclaration7 = domainBodyDeclaration
          @state.following.pop
          stream_domainBodyDeclaration.add( domainBodyDeclaration7.tree )


        else
          break # out of loop for decision 3
        end
      end # loop for decision 3

      char_literal8 = match( RBRACE, TOKENS_FOLLOWING_RBRACE_IN_domainBody_235 )
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
      # 41:38: -> ^( DOMAIN_BODY ( domainBodyDeclaration )* )
      # at line 41:41: ^( DOMAIN_BODY ( domainBodyDeclaration )* )
      root_1 = @adaptor.create_flat_list
      root_1 = @adaptor.become_root( @adaptor.create_from_type( DOMAIN_BODY, "DOMAIN_BODY" ), root_1 )

      # at line 41:55: ( domainBodyDeclaration )*
      while stream_domainBodyDeclaration.has_next?
        @adaptor.add_child( root_1, stream_domainBodyDeclaration.next_tree )

      end

      stream_domainBodyDeclaration.reset();

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
        # trace_out( __method__, 4 )


      end

      return return_value
    end

    DomainBodyDeclarationReturnValue = define_return_scope

    #
    # parser rule domainBodyDeclaration
    #
    # (in Yarpl.g)
    # 44:1: domainBodyDeclaration : typeDeclaration -> ^( TYPE_DECLARATION typeDeclaration ) ;
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
      # at line 45:7: typeDeclaration
      @state.following.push( TOKENS_FOLLOWING_typeDeclaration_IN_domainBodyDeclaration_261 )
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
      # 45:23: -> ^( TYPE_DECLARATION typeDeclaration )
      # at line 45:26: ^( TYPE_DECLARATION typeDeclaration )
      root_1 = @adaptor.create_flat_list
      root_1 = @adaptor.become_root( @adaptor.create_from_type( TYPE_DECLARATION, "TYPE_DECLARATION" ), root_1 )

      @adaptor.add_child( root_1, stream_typeDeclaration.next_tree )

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
        # trace_out( __method__, 5 )


      end

      return return_value
    end

    InitialDeclarationReturnValue = define_return_scope

    #
    # parser rule initialDeclaration
    #
    # (in Yarpl.g)
    # 48:1: initialDeclaration : 'initial' initialBody -> ^( INITIAL_DECLARATION initialBody ) ;
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
      stream_T__72 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__72" )
      stream_initialBody = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule initialBody" )
      begin
      # at line 49:7: 'initial' initialBody
      string_literal10 = match( T__72, TOKENS_FOLLOWING_T__72_IN_initialDeclaration_283 )
      stream_T__72.add( string_literal10 )

      @state.following.push( TOKENS_FOLLOWING_initialBody_IN_initialDeclaration_285 )
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
      # 49:30: -> ^( INITIAL_DECLARATION initialBody )
      # at line 49:33: ^( INITIAL_DECLARATION initialBody )
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
    # 52:1: initialBody : '{' ( initialBodyDeclaration )* '}' -> ^( INITIAL_BODY ( initialBodyDeclaration )* ) ;
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
      # at line 53:7: '{' ( initialBodyDeclaration )* '}'
      char_literal12 = match( LBRACE, TOKENS_FOLLOWING_LBRACE_IN_initialBody_311 )
      stream_LBRACE.add( char_literal12 )

      # at line 53:11: ( initialBodyDeclaration )*
      while true # decision 4
        alt_4 = 2
        look_4_0 = @input.peek( 1 )

        if ( look_4_0 == SEMI || look_4_0 == T__77 || look_4_0 == T__79 || look_4_0 == T__82 )
          alt_4 = 1

        end
        case alt_4
        when 1
          # at line 53:11: initialBodyDeclaration
          @state.following.push( TOKENS_FOLLOWING_initialBodyDeclaration_IN_initialBody_313 )
          initialBodyDeclaration13 = initialBodyDeclaration
          @state.following.pop
          stream_initialBodyDeclaration.add( initialBodyDeclaration13.tree )


        else
          break # out of loop for decision 4
        end
      end # loop for decision 4

      char_literal14 = match( RBRACE, TOKENS_FOLLOWING_RBRACE_IN_initialBody_316 )
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
      # 53:39: -> ^( INITIAL_BODY ( initialBodyDeclaration )* )
      # at line 53:42: ^( INITIAL_BODY ( initialBodyDeclaration )* )
      root_1 = @adaptor.create_flat_list
      root_1 = @adaptor.become_root( @adaptor.create_from_type( INITIAL_BODY, "INITIAL_BODY" ), root_1 )

      # at line 53:57: ( initialBodyDeclaration )*
      while stream_initialBodyDeclaration.has_next?
        @adaptor.add_child( root_1, stream_initialBodyDeclaration.next_tree )

      end

      stream_initialBodyDeclaration.reset();

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
        # trace_out( __method__, 7 )


      end

      return return_value
    end

    InitialBodyDeclarationReturnValue = define_return_scope

    #
    # parser rule initialBodyDeclaration
    #
    # (in Yarpl.g)
    # 56:1: initialBodyDeclaration : statement ;
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


      # at line 57:7: statement
      @state.following.push( TOKENS_FOLLOWING_statement_IN_initialBodyDeclaration_342 )
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
    # 60:1: typeDeclaration : classDeclaration -> ^( CLASS_DECLARATION classDeclaration ) ;
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
      # at line 61:7: classDeclaration
      @state.following.push( TOKENS_FOLLOWING_classDeclaration_IN_typeDeclaration_359 )
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
      # 61:24: -> ^( CLASS_DECLARATION classDeclaration )
      # at line 61:27: ^( CLASS_DECLARATION classDeclaration )
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
    # 64:1: classDeclaration : 'class' IDENTIFIER classBody -> ^( IDENTIFIER classBody ) ;
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
      stream_T__67 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__67" )
      stream_IDENTIFIER = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token IDENTIFIER" )
      stream_classBody = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule classBody" )
      begin
      # at line 65:7: 'class' IDENTIFIER classBody
      string_literal17 = match( T__67, TOKENS_FOLLOWING_T__67_IN_classDeclaration_384 )
      stream_T__67.add( string_literal17 )

      __IDENTIFIER18__ = match( IDENTIFIER, TOKENS_FOLLOWING_IDENTIFIER_IN_classDeclaration_386 )
      stream_IDENTIFIER.add( __IDENTIFIER18__ )

      @state.following.push( TOKENS_FOLLOWING_classBody_IN_classDeclaration_388 )
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
      # 65:36: -> ^( IDENTIFIER classBody )
      # at line 65:39: ^( IDENTIFIER classBody )
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
    # 68:1: classBody : '{' ( classBodyDeclaration )* '}' -> ^( CLASS_BODY ( classBodyDeclaration )* ) ;
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
      # at line 69:7: '{' ( classBodyDeclaration )* '}'
      char_literal20 = match( LBRACE, TOKENS_FOLLOWING_LBRACE_IN_classBody_410 )
      stream_LBRACE.add( char_literal20 )

      # at line 69:11: ( classBodyDeclaration )*
      while true # decision 5
        alt_5 = 2
        look_5_0 = @input.peek( 1 )

        if ( look_5_0 == T__77 || look_5_0 == T__79 || look_5_0 == T__82 )
          alt_5 = 1

        end
        case alt_5
        when 1
          # at line 69:11: classBodyDeclaration
          @state.following.push( TOKENS_FOLLOWING_classBodyDeclaration_IN_classBody_412 )
          classBodyDeclaration21 = classBodyDeclaration
          @state.following.pop
          stream_classBodyDeclaration.add( classBodyDeclaration21.tree )


        else
          break # out of loop for decision 5
        end
      end # loop for decision 5

      char_literal22 = match( RBRACE, TOKENS_FOLLOWING_RBRACE_IN_classBody_415 )
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
      # 69:37: -> ^( CLASS_BODY ( classBodyDeclaration )* )
      # at line 69:40: ^( CLASS_BODY ( classBodyDeclaration )* )
      root_1 = @adaptor.create_flat_list
      root_1 = @adaptor.become_root( @adaptor.create_from_type( CLASS_BODY, "CLASS_BODY" ), root_1 )

      # at line 69:53: ( classBodyDeclaration )*
      while stream_classBodyDeclaration.has_next?
        @adaptor.add_child( root_1, stream_classBodyDeclaration.next_tree )

      end

      stream_classBodyDeclaration.reset();

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
        # trace_out( __method__, 11 )


      end

      return return_value
    end

    ClassBodyDeclarationReturnValue = define_return_scope

    #
    # parser rule classBodyDeclaration
    #
    # (in Yarpl.g)
    # 72:1: classBodyDeclaration : memberDeclaration -> ^( CLASS_BODY_DECLARATION memberDeclaration ) ;
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
      # at line 73:7: memberDeclaration
      @state.following.push( TOKENS_FOLLOWING_memberDeclaration_IN_classBodyDeclaration_438 )
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
      # 73:25: -> ^( CLASS_BODY_DECLARATION memberDeclaration )
      # at line 73:28: ^( CLASS_BODY_DECLARATION memberDeclaration )
      root_1 = @adaptor.create_flat_list
      root_1 = @adaptor.become_root( @adaptor.create_from_type( CLASS_BODY_DECLARATION, "CLASS_BODY_DECLARATION" ), root_1 )

      @adaptor.add_child( root_1, stream_memberDeclaration.next_tree )

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
    # 76:1: memberDeclaration : fieldDeclaration -> ^( MEMBER_DECLARATION fieldDeclaration ) ;
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
      # at line 77:7: fieldDeclaration
      @state.following.push( TOKENS_FOLLOWING_fieldDeclaration_IN_memberDeclaration_460 )
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
      # 77:24: -> ^( MEMBER_DECLARATION fieldDeclaration )
      # at line 77:27: ^( MEMBER_DECLARATION fieldDeclaration )
      root_1 = @adaptor.create_flat_list
      root_1 = @adaptor.become_root( @adaptor.create_from_type( MEMBER_DECLARATION, "MEMBER_DECLARATION" ), root_1 )

      @adaptor.add_child( root_1, stream_fieldDeclaration.next_tree )

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
        # trace_out( __method__, 13 )


      end

      return return_value
    end

    FieldDeclarationReturnValue = define_return_scope

    #
    # parser rule fieldDeclaration
    #
    # (in Yarpl.g)
    # 80:1: fieldDeclaration : variableType type variableDeclarators ';' -> ^( FIELD_DECLARATION type variableDeclarators ) ;
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
      variableDeclarators27 = nil


      tree_for_char_literal28 = nil
      stream_SEMI = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token SEMI" )
      stream_variableType = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule variableType" )
      stream_variableDeclarators = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule variableDeclarators" )
      stream_type = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule type" )
      begin
      # at line 81:7: variableType type variableDeclarators ';'
      @state.following.push( TOKENS_FOLLOWING_variableType_IN_fieldDeclaration_485 )
      variableType25 = variableType
      @state.following.pop
      stream_variableType.add( variableType25.tree )

      @state.following.push( TOKENS_FOLLOWING_type_IN_fieldDeclaration_487 )
      type26 = type
      @state.following.pop
      stream_type.add( type26.tree )

      @state.following.push( TOKENS_FOLLOWING_variableDeclarators_IN_fieldDeclaration_489 )
      variableDeclarators27 = variableDeclarators
      @state.following.pop
      stream_variableDeclarators.add( variableDeclarators27.tree )

      char_literal28 = match( SEMI, TOKENS_FOLLOWING_SEMI_IN_fieldDeclaration_491 )
      stream_SEMI.add( char_literal28 )

      # AST Rewrite
      # elements: variableDeclarators, type
      # token labels: 
      # rule labels: return_value
      # token list labels: 
      # rule list labels: 
      # wildcard labels: 
      return_value.tree = root_0
      stream_return_value = return_value ? subtree_stream( "rule return_value", return_value.tree ) : subtree_stream( "token return_value" )

      root_0 = @adaptor.create_flat_list
      # 81:49: -> ^( FIELD_DECLARATION type variableDeclarators )
      # at line 81:52: ^( FIELD_DECLARATION type variableDeclarators )
      root_1 = @adaptor.create_flat_list
      root_1 = @adaptor.become_root( @adaptor.create_from_type( FIELD_DECLARATION, "FIELD_DECLARATION" ), root_1 )

      @adaptor.add_child( root_1, stream_type.next_tree )

      @adaptor.add_child( root_1, stream_variableDeclarators.next_tree )

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
    # 84:1: variableDeclarators : variableDeclarator ( ',' variableDeclarator )* ;
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


      # at line 85:7: variableDeclarator ( ',' variableDeclarator )*
      @state.following.push( TOKENS_FOLLOWING_variableDeclarator_IN_variableDeclarators_518 )
      variableDeclarator29 = variableDeclarator
      @state.following.pop
      @adaptor.add_child( root_0, variableDeclarator29.tree )

      # at line 85:26: ( ',' variableDeclarator )*
      while true # decision 6
        alt_6 = 2
        look_6_0 = @input.peek( 1 )

        if ( look_6_0 == COMMA )
          alt_6 = 1

        end
        case alt_6
        when 1
          # at line 85:27: ',' variableDeclarator
          char_literal30 = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_variableDeclarators_521 )
          tree_for_char_literal30 = @adaptor.create_with_payload( char_literal30 )
          @adaptor.add_child( root_0, tree_for_char_literal30 )


          @state.following.push( TOKENS_FOLLOWING_variableDeclarator_IN_variableDeclarators_523 )
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
    # 88:1: variableDeclarator : variableDeclaratorId '=' variableInitializer -> ^( VARIABLE_DECLARATOR variableDeclaratorId variableInitializer ) ;
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
      # at line 89:7: variableDeclaratorId '=' variableInitializer
      @state.following.push( TOKENS_FOLLOWING_variableDeclaratorId_IN_variableDeclarator_542 )
      variableDeclaratorId32 = variableDeclaratorId
      @state.following.pop
      stream_variableDeclaratorId.add( variableDeclaratorId32.tree )

      char_literal33 = match( ASSIGN, TOKENS_FOLLOWING_ASSIGN_IN_variableDeclarator_544 )
      stream_ASSIGN.add( char_literal33 )

      @state.following.push( TOKENS_FOLLOWING_variableInitializer_IN_variableDeclarator_546 )
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
    # (in Yarpl.g)
    # 92:1: variableDeclaratorId : IDENTIFIER ;
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


      # at line 93:7: IDENTIFIER
      __IDENTIFIER35__ = match( IDENTIFIER, TOKENS_FOLLOWING_IDENTIFIER_IN_variableDeclaratorId_573 )
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
    # 96:1: variableInitializer : expression ;
    #
    def variableInitializer
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 18 )


      return_value = VariableInitializerReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      expression36 = nil



      begin
      root_0 = @adaptor.create_flat_list


      # at line 97:7: expression
      @state.following.push( TOKENS_FOLLOWING_expression_IN_variableInitializer_590 )
      expression36 = expression
      @state.following.pop
      @adaptor.add_child( root_0, expression36.tree )


      # - - - - - - - rule clean up - - - - - - - -
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
    # 100:1: localVariableDeclaration : variableType type variableDeclarators ';' ;
    #
    def localVariableDeclaration
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 19 )


      return_value = LocalVariableDeclarationReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal40 = nil
      variableType37 = nil
      type38 = nil
      variableDeclarators39 = nil


      tree_for_char_literal40 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 101:7: variableType type variableDeclarators ';'
      @state.following.push( TOKENS_FOLLOWING_variableType_IN_localVariableDeclaration_607 )
      variableType37 = variableType
      @state.following.pop
      @adaptor.add_child( root_0, variableType37.tree )

      @state.following.push( TOKENS_FOLLOWING_type_IN_localVariableDeclaration_609 )
      type38 = type
      @state.following.pop
      @adaptor.add_child( root_0, type38.tree )

      @state.following.push( TOKENS_FOLLOWING_variableDeclarators_IN_localVariableDeclaration_611 )
      variableDeclarators39 = variableDeclarators
      @state.following.pop
      @adaptor.add_child( root_0, variableDeclarators39.tree )

      char_literal40 = match( SEMI, TOKENS_FOLLOWING_SEMI_IN_localVariableDeclaration_613 )
      tree_for_char_literal40 = @adaptor.create_with_payload( char_literal40 )
      @adaptor.add_child( root_0, tree_for_char_literal40 )



      # - - - - - - - rule clean up - - - - - - - -
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
    # 105:1: statement : ( localVariableDeclaration | ';' );
    #
    def statement
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 20 )


      return_value = StatementReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal42 = nil
      localVariableDeclaration41 = nil


      tree_for_char_literal42 = nil

      begin
      # at line 106:5: ( localVariableDeclaration | ';' )
      alt_7 = 2
      look_7_0 = @input.peek( 1 )

      if ( look_7_0 == T__77 || look_7_0 == T__79 || look_7_0 == T__82 )
        alt_7 = 1
      elsif ( look_7_0 == SEMI )
        alt_7 = 2
      else
        raise NoViableAlternative( "", 7, 0 )

      end
      case alt_7
      when 1
        root_0 = @adaptor.create_flat_list


        # at line 106:7: localVariableDeclaration
        @state.following.push( TOKENS_FOLLOWING_localVariableDeclaration_IN_statement_631 )
        localVariableDeclaration41 = localVariableDeclaration
        @state.following.pop
        @adaptor.add_child( root_0, localVariableDeclaration41.tree )


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 107:7: ';'
        char_literal42 = match( SEMI, TOKENS_FOLLOWING_SEMI_IN_statement_639 )
        tree_for_char_literal42 = @adaptor.create_with_payload( char_literal42 )
        @adaptor.add_child( root_0, tree_for_char_literal42 )



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
    # 111:1: expression : relationalExpression ( ( 'and' | 'or' ) relationalExpression )* ;
    #
    def expression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 21 )


      return_value = ExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set44 = nil
      relationalExpression43 = nil
      relationalExpression45 = nil


      tree_for_set44 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 112:5: relationalExpression ( ( 'and' | 'or' ) relationalExpression )*
      @state.following.push( TOKENS_FOLLOWING_relationalExpression_IN_expression_657 )
      relationalExpression43 = relationalExpression
      @state.following.pop
      @adaptor.add_child( root_0, relationalExpression43.tree )

      # at line 112:26: ( ( 'and' | 'or' ) relationalExpression )*
      while true # decision 8
        alt_8 = 2
        look_8_0 = @input.peek( 1 )

        if ( look_8_0 == T__65 || look_8_0 == T__78 )
          alt_8 = 1

        end
        case alt_8
        when 1
          # at line 112:27: ( 'and' | 'or' ) relationalExpression
          set44 = @input.look

          if @input.peek(1) == T__65 || @input.peek(1) == T__78
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set44 ) )

            @state.error_recovery = false

          else
            mse = MismatchedSet( nil )
            raise mse

          end


          @state.following.push( TOKENS_FOLLOWING_relationalExpression_IN_expression_666 )
          relationalExpression45 = relationalExpression
          @state.following.pop
          @adaptor.add_child( root_0, relationalExpression45.tree )


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
    # 115:1: relationalExpression : addingExpression ( ( EQUALS | NOT_EQUALS | GT | GTE | LT | LTE ) addingExpression )* ;
    #
    def relationalExpression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 22 )


      return_value = RelationalExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set47 = nil
      addingExpression46 = nil
      addingExpression48 = nil


      tree_for_set47 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 116:7: addingExpression ( ( EQUALS | NOT_EQUALS | GT | GTE | LT | LTE ) addingExpression )*
      @state.following.push( TOKENS_FOLLOWING_addingExpression_IN_relationalExpression_685 )
      addingExpression46 = addingExpression
      @state.following.pop
      @adaptor.add_child( root_0, addingExpression46.tree )

      # at line 116:24: ( ( EQUALS | NOT_EQUALS | GT | GTE | LT | LTE ) addingExpression )*
      while true # decision 9
        alt_9 = 2
        look_9_0 = @input.peek( 1 )

        if ( look_9_0 == EQUALS || look_9_0.between?( GT, GTE ) || look_9_0.between?( LT, LTE ) || look_9_0 == NOT_EQUALS )
          alt_9 = 1

        end
        case alt_9
        when 1
          # at line 116:25: ( EQUALS | NOT_EQUALS | GT | GTE | LT | LTE ) addingExpression
          set47 = @input.look

          if @input.peek(1) == EQUALS || @input.peek( 1 ).between?( GT, GTE ) || @input.peek( 1 ).between?( LT, LTE ) || @input.peek(1) == NOT_EQUALS
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set47 ) )

            @state.error_recovery = false

          else
            mse = MismatchedSet( nil )
            raise mse

          end


          @state.following.push( TOKENS_FOLLOWING_addingExpression_IN_relationalExpression_702 )
          addingExpression48 = addingExpression
          @state.following.pop
          @adaptor.add_child( root_0, addingExpression48.tree )


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
    # 119:1: addingExpression : multiplyingExpression ( ( PLUS | MINUS ) multiplyingExpression )* ;
    #
    def addingExpression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 23 )


      return_value = AddingExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set50 = nil
      multiplyingExpression49 = nil
      multiplyingExpression51 = nil


      tree_for_set50 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 120:7: multiplyingExpression ( ( PLUS | MINUS ) multiplyingExpression )*
      @state.following.push( TOKENS_FOLLOWING_multiplyingExpression_IN_addingExpression_721 )
      multiplyingExpression49 = multiplyingExpression
      @state.following.pop
      @adaptor.add_child( root_0, multiplyingExpression49.tree )

      # at line 120:29: ( ( PLUS | MINUS ) multiplyingExpression )*
      while true # decision 10
        alt_10 = 2
        look_10_0 = @input.peek( 1 )

        if ( look_10_0 == MINUS || look_10_0 == PLUS )
          alt_10 = 1

        end
        case alt_10
        when 1
          # at line 120:30: ( PLUS | MINUS ) multiplyingExpression
          set50 = @input.look

          if @input.peek(1) == MINUS || @input.peek(1) == PLUS
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set50 ) )

            @state.error_recovery = false

          else
            mse = MismatchedSet( nil )
            raise mse

          end


          @state.following.push( TOKENS_FOLLOWING_multiplyingExpression_IN_addingExpression_730 )
          multiplyingExpression51 = multiplyingExpression
          @state.following.pop
          @adaptor.add_child( root_0, multiplyingExpression51.tree )


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
    # 123:1: multiplyingExpression : signExpression ( ( TIMES | DIV | 'mod' ) signExpression )* ;
    #
    def multiplyingExpression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 24 )


      return_value = MultiplyingExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set53 = nil
      signExpression52 = nil
      signExpression54 = nil


      tree_for_set53 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 124:7: signExpression ( ( TIMES | DIV | 'mod' ) signExpression )*
      @state.following.push( TOKENS_FOLLOWING_signExpression_IN_multiplyingExpression_749 )
      signExpression52 = signExpression
      @state.following.pop
      @adaptor.add_child( root_0, signExpression52.tree )

      # at line 124:22: ( ( TIMES | DIV | 'mod' ) signExpression )*
      while true # decision 11
        alt_11 = 2
        look_11_0 = @input.peek( 1 )

        if ( look_11_0 == DIV || look_11_0 == TIMES || look_11_0 == T__74 )
          alt_11 = 1

        end
        case alt_11
        when 1
          # at line 124:23: ( TIMES | DIV | 'mod' ) signExpression
          set53 = @input.look

          if @input.peek(1) == DIV || @input.peek(1) == TIMES || @input.peek(1) == T__74
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set53 ) )

            @state.error_recovery = false

          else
            mse = MismatchedSet( nil )
            raise mse

          end


          @state.following.push( TOKENS_FOLLOWING_signExpression_IN_multiplyingExpression_760 )
          signExpression54 = signExpression
          @state.following.pop
          @adaptor.add_child( root_0, signExpression54.tree )


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
    # 127:1: signExpression : ( PLUS | MINUS )* primeExpression ;
    #
    def signExpression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 25 )


      return_value = SignExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set55 = nil
      primeExpression56 = nil


      tree_for_set55 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 128:7: ( PLUS | MINUS )* primeExpression
      # at line 128:7: ( PLUS | MINUS )*
      while true # decision 12
        alt_12 = 2
        look_12_0 = @input.peek( 1 )

        if ( look_12_0 == MINUS || look_12_0 == PLUS )
          alt_12 = 1

        end
        case alt_12
        when 1
          # at line 
          set55 = @input.look

          if @input.peek(1) == MINUS || @input.peek(1) == PLUS
            @input.consume
            @adaptor.add_child( root_0, @adaptor.create_with_payload( set55 ) )

            @state.error_recovery = false

          else
            mse = MismatchedSet( nil )
            raise mse

          end



        else
          break # out of loop for decision 12
        end
      end # loop for decision 12

      @state.following.push( TOKENS_FOLLOWING_primeExpression_IN_signExpression_786 )
      primeExpression56 = primeExpression
      @state.following.pop
      @adaptor.add_child( root_0, primeExpression56.tree )


      # - - - - - - - rule clean up - - - - - - - -
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
    # 131:1: primeExpression : ( primary | LPAREN expression RPAREN );
    #
    def primeExpression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 26 )


      return_value = PrimeExpressionReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __LPAREN58__ = nil
      __RPAREN60__ = nil
      primary57 = nil
      expression59 = nil


      tree_for_LPAREN58 = nil
      tree_for_RPAREN60 = nil

      begin
      # at line 132:5: ( primary | LPAREN expression RPAREN )
      alt_13 = 2
      look_13_0 = @input.peek( 1 )

      if ( look_13_0 == RANGEINTEGERLITERAL || look_13_0 == T__75 )
        alt_13 = 1
      elsif ( look_13_0 == LPAREN )
        alt_13 = 2
      else
        raise NoViableAlternative( "", 13, 0 )

      end
      case alt_13
      when 1
        root_0 = @adaptor.create_flat_list


        # at line 132:7: primary
        @state.following.push( TOKENS_FOLLOWING_primary_IN_primeExpression_803 )
        primary57 = primary
        @state.following.pop
        @adaptor.add_child( root_0, primary57.tree )


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 133:7: LPAREN expression RPAREN
        __LPAREN58__ = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_primeExpression_811 )
        tree_for_LPAREN58 = @adaptor.create_with_payload( __LPAREN58__ )
        @adaptor.add_child( root_0, tree_for_LPAREN58 )


        @state.following.push( TOKENS_FOLLOWING_expression_IN_primeExpression_813 )
        expression59 = expression
        @state.following.pop
        @adaptor.add_child( root_0, expression59.tree )

        __RPAREN60__ = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_primeExpression_817 )
        tree_for_RPAREN60 = @adaptor.create_with_payload( __RPAREN60__ )
        @adaptor.add_child( root_0, tree_for_RPAREN60 )



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
    # 136:1: expressionList : expression ( ',' expression )* ;
    #
    def expressionList
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 27 )


      return_value = ExpressionListReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal62 = nil
      expression61 = nil
      expression63 = nil


      tree_for_char_literal62 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 137:9: expression ( ',' expression )*
      @state.following.push( TOKENS_FOLLOWING_expression_IN_expressionList_836 )
      expression61 = expression
      @state.following.pop
      @adaptor.add_child( root_0, expression61.tree )

      # at line 137:20: ( ',' expression )*
      while true # decision 14
        alt_14 = 2
        look_14_0 = @input.peek( 1 )

        if ( look_14_0 == COMMA )
          alt_14 = 1

        end
        case alt_14
        when 1
          # at line 137:21: ',' expression
          char_literal62 = match( COMMA, TOKENS_FOLLOWING_COMMA_IN_expressionList_839 )
          tree_for_char_literal62 = @adaptor.create_with_payload( char_literal62 )
          @adaptor.add_child( root_0, tree_for_char_literal62 )


          @state.following.push( TOKENS_FOLLOWING_expression_IN_expressionList_841 )
          expression63 = expression
          @state.following.pop
          @adaptor.add_child( root_0, expression63.tree )


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
    # (in Yarpl.g)
    # 140:1: primary : ( 'new' creator | literal );
    #
    def primary
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 28 )


      return_value = PrimaryReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal64 = nil
      creator65 = nil
      literal66 = nil


      tree_for_string_literal64 = nil

      begin
      # at line 141:2: ( 'new' creator | literal )
      alt_15 = 2
      look_15_0 = @input.peek( 1 )

      if ( look_15_0 == T__75 )
        alt_15 = 1
      elsif ( look_15_0 == RANGEINTEGERLITERAL )
        alt_15 = 2
      else
        raise NoViableAlternative( "", 15, 0 )

      end
      case alt_15
      when 1
        root_0 = @adaptor.create_flat_list


        # at line 141:4: 'new' creator
        string_literal64 = match( T__75, TOKENS_FOLLOWING_T__75_IN_primary_857 )
        tree_for_string_literal64 = @adaptor.create_with_payload( string_literal64 )
        @adaptor.add_child( root_0, tree_for_string_literal64 )


        @state.following.push( TOKENS_FOLLOWING_creator_IN_primary_859 )
        creator65 = creator
        @state.following.pop
        @adaptor.add_child( root_0, creator65.tree )


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 142:7: literal
        @state.following.push( TOKENS_FOLLOWING_literal_IN_primary_867 )
        literal66 = literal
        @state.following.pop
        @adaptor.add_child( root_0, literal66.tree )


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

    CreatorReturnValue = define_return_scope

    #
    # parser rule creator
    #
    # (in Yarpl.g)
    # 145:1: creator : createdName classCreatorRest ;
    #
    def creator
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 29 )


      return_value = CreatorReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      createdName67 = nil
      classCreatorRest68 = nil



      begin
      root_0 = @adaptor.create_flat_list


      # at line 146:7: createdName classCreatorRest
      @state.following.push( TOKENS_FOLLOWING_createdName_IN_creator_881 )
      createdName67 = createdName
      @state.following.pop
      @adaptor.add_child( root_0, createdName67.tree )

      @state.following.push( TOKENS_FOLLOWING_classCreatorRest_IN_creator_883 )
      classCreatorRest68 = classCreatorRest
      @state.following.pop
      @adaptor.add_child( root_0, classCreatorRest68.tree )


      # - - - - - - - rule clean up - - - - - - - -
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
    # (in Yarpl.g)
    # 149:1: createdName : ( structType | primitiveType );
    #
    def createdName
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 30 )


      return_value = CreatedNameReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      structType69 = nil
      primitiveType70 = nil



      begin
      # at line 150:5: ( structType | primitiveType )
      alt_16 = 2
      look_16_0 = @input.peek( 1 )

      if ( look_16_0 == IDENTIFIER )
        alt_16 = 1
      elsif ( look_16_0 == T__66 || look_16_0.between?( T__68, T__69 ) || look_16_0 == T__71 || look_16_0 == T__73 || look_16_0 == T__76 || look_16_0.between?( T__80, T__81 ) )
        alt_16 = 2
      else
        raise NoViableAlternative( "", 16, 0 )

      end
      case alt_16
      when 1
        root_0 = @adaptor.create_flat_list


        # at line 150:7: structType
        @state.following.push( TOKENS_FOLLOWING_structType_IN_createdName_900 )
        structType69 = structType
        @state.following.pop
        @adaptor.add_child( root_0, structType69.tree )


      when 2
        root_0 = @adaptor.create_flat_list


        # at line 151:7: primitiveType
        @state.following.push( TOKENS_FOLLOWING_primitiveType_IN_createdName_908 )
        primitiveType70 = primitiveType
        @state.following.pop
        @adaptor.add_child( root_0, primitiveType70.tree )


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
    # (in Yarpl.g)
    # 154:1: classCreatorRest : arguments ( classBody )? ;
    #
    def classCreatorRest
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 31 )


      return_value = ClassCreatorRestReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      arguments71 = nil
      classBody72 = nil



      begin
      root_0 = @adaptor.create_flat_list


      # at line 155:7: arguments ( classBody )?
      @state.following.push( TOKENS_FOLLOWING_arguments_IN_classCreatorRest_925 )
      arguments71 = arguments
      @state.following.pop
      @adaptor.add_child( root_0, arguments71.tree )

      # at line 155:17: ( classBody )?
      alt_17 = 2
      look_17_0 = @input.peek( 1 )

      if ( look_17_0 == LBRACE )
        alt_17 = 1
      end
      case alt_17
      when 1
        # at line 155:17: classBody
        @state.following.push( TOKENS_FOLLOWING_classBody_IN_classCreatorRest_927 )
        classBody72 = classBody
        @state.following.pop
        @adaptor.add_child( root_0, classBody72.tree )


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
    # (in Yarpl.g)
    # 158:1: arguments : '(' ( expressionList )? ')' ;
    #
    def arguments
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 32 )


      return_value = ArgumentsReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      char_literal73 = nil
      char_literal75 = nil
      expressionList74 = nil


      tree_for_char_literal73 = nil
      tree_for_char_literal75 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 159:7: '(' ( expressionList )? ')'
      char_literal73 = match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_arguments_945 )
      tree_for_char_literal73 = @adaptor.create_with_payload( char_literal73 )
      @adaptor.add_child( root_0, tree_for_char_literal73 )


      # at line 159:11: ( expressionList )?
      alt_18 = 2
      look_18_0 = @input.peek( 1 )

      if ( look_18_0 == LPAREN || look_18_0 == MINUS || look_18_0 == PLUS || look_18_0 == RANGEINTEGERLITERAL || look_18_0 == T__75 )
        alt_18 = 1
      end
      case alt_18
      when 1
        # at line 159:11: expressionList
        @state.following.push( TOKENS_FOLLOWING_expressionList_IN_arguments_947 )
        expressionList74 = expressionList
        @state.following.pop
        @adaptor.add_child( root_0, expressionList74.tree )


      end
      char_literal75 = match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_arguments_950 )
      tree_for_char_literal75 = @adaptor.create_with_payload( char_literal75 )
      @adaptor.add_child( root_0, tree_for_char_literal75 )



      # - - - - - - - rule clean up - - - - - - - -
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

    LiteralReturnValue = define_return_scope

    #
    # parser rule literal
    #
    # (in Yarpl.g)
    # 162:1: literal : RANGEINTEGERLITERAL ;
    #
    def literal
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 33 )


      return_value = LiteralReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __RANGEINTEGERLITERAL76__ = nil


      tree_for_RANGEINTEGERLITERAL76 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 163:4: RANGEINTEGERLITERAL
      __RANGEINTEGERLITERAL76__ = match( RANGEINTEGERLITERAL, TOKENS_FOLLOWING_RANGEINTEGERLITERAL_IN_literal_964 )
      tree_for_RANGEINTEGERLITERAL76 = @adaptor.create_with_payload( __RANGEINTEGERLITERAL76__ )
      @adaptor.add_child( root_0, tree_for_RANGEINTEGERLITERAL76 )



      # - - - - - - - rule clean up - - - - - - - -
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

    TypeReturnValue = define_return_scope

    #
    # parser rule type
    #
    # (in Yarpl.g)
    # 166:1: type : ( structType -> ^( VARIABLE_TYPE structType ) | primitiveType -> ^( VARIABLE_TYPE primitiveType ) );
    #
    def type
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 34 )


      return_value = TypeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      structType77 = nil
      primitiveType78 = nil


      stream_primitiveType = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule primitiveType" )
      stream_structType = ANTLR3::AST::RewriteRuleSubtreeStream.new( @adaptor, "rule structType" )
      begin
      # at line 167:5: ( structType -> ^( VARIABLE_TYPE structType ) | primitiveType -> ^( VARIABLE_TYPE primitiveType ) )
      alt_19 = 2
      look_19_0 = @input.peek( 1 )

      if ( look_19_0 == IDENTIFIER )
        alt_19 = 1
      elsif ( look_19_0 == T__66 || look_19_0.between?( T__68, T__69 ) || look_19_0 == T__71 || look_19_0 == T__73 || look_19_0 == T__76 || look_19_0.between?( T__80, T__81 ) )
        alt_19 = 2
      else
        raise NoViableAlternative( "", 19, 0 )

      end
      case alt_19
      when 1
        # at line 167:7: structType
        @state.following.push( TOKENS_FOLLOWING_structType_IN_type_978 )
        structType77 = structType
        @state.following.pop
        stream_structType.add( structType77.tree )

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
        # 167:18: -> ^( VARIABLE_TYPE structType )
        # at line 167:21: ^( VARIABLE_TYPE structType )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( VARIABLE_TYPE, "VARIABLE_TYPE" ), root_1 )

        @adaptor.add_child( root_1, stream_structType.next_tree )

        @adaptor.add_child( root_0, root_1 )




        return_value.tree = root_0



      when 2
        # at line 168:7: primitiveType
        @state.following.push( TOKENS_FOLLOWING_primitiveType_IN_type_994 )
        primitiveType78 = primitiveType
        @state.following.pop
        stream_primitiveType.add( primitiveType78.tree )

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
        # 168:21: -> ^( VARIABLE_TYPE primitiveType )
        # at line 168:24: ^( VARIABLE_TYPE primitiveType )
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
        # trace_out( __method__, 34 )


      end

      return return_value
    end

    StructTypeReturnValue = define_return_scope

    #
    # parser rule structType
    #
    # (in Yarpl.g)
    # 171:1: structType : IDENTIFIER ;
    #
    def structType
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 35 )


      return_value = StructTypeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      __IDENTIFIER79__ = nil


      tree_for_IDENTIFIER79 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 172:7: IDENTIFIER
      __IDENTIFIER79__ = match( IDENTIFIER, TOKENS_FOLLOWING_IDENTIFIER_IN_structType_1019 )
      tree_for_IDENTIFIER79 = @adaptor.create_with_payload( __IDENTIFIER79__ )
      @adaptor.add_child( root_0, tree_for_IDENTIFIER79 )



      # - - - - - - - rule clean up - - - - - - - -
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

    PrimitiveTypeReturnValue = define_return_scope

    #
    # parser rule primitiveType
    #
    # (in Yarpl.g)
    # 175:1: primitiveType : ( 'boolean' | 'nullableboolean' | 'float' | 'integer' -> ^( INTEGER ) | 'string' | 'decimal' | 'datetime' | 'time' );
    #
    def primitiveType
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 36 )


      return_value = PrimitiveTypeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      string_literal80 = nil
      string_literal81 = nil
      string_literal82 = nil
      string_literal83 = nil
      string_literal84 = nil
      string_literal85 = nil
      string_literal86 = nil
      string_literal87 = nil


      tree_for_string_literal80 = nil
      tree_for_string_literal81 = nil
      tree_for_string_literal82 = nil
      tree_for_string_literal83 = nil
      tree_for_string_literal84 = nil
      tree_for_string_literal85 = nil
      tree_for_string_literal86 = nil
      tree_for_string_literal87 = nil
      stream_T__73 = ANTLR3::AST::RewriteRuleTokenStream.new( @adaptor, "token T__73" )

      begin
      # at line 176:5: ( 'boolean' | 'nullableboolean' | 'float' | 'integer' -> ^( INTEGER ) | 'string' | 'decimal' | 'datetime' | 'time' )
      alt_20 = 8
      case look_20 = @input.peek( 1 )
      when T__66 then alt_20 = 1
      when T__76 then alt_20 = 2
      when T__71 then alt_20 = 3
      when T__73 then alt_20 = 4
      when T__80 then alt_20 = 5
      when T__69 then alt_20 = 6
      when T__68 then alt_20 = 7
      when T__81 then alt_20 = 8
      else
        raise NoViableAlternative( "", 20, 0 )

      end
      case alt_20
      when 1
        root_0 = @adaptor.create_flat_list


        # at line 176:7: 'boolean'
        string_literal80 = match( T__66, TOKENS_FOLLOWING_T__66_IN_primitiveType_1036 )
        tree_for_string_literal80 = @adaptor.create_with_payload( string_literal80 )
        @adaptor.add_child( root_0, tree_for_string_literal80 )



      when 2
        root_0 = @adaptor.create_flat_list


        # at line 177:7: 'nullableboolean'
        string_literal81 = match( T__76, TOKENS_FOLLOWING_T__76_IN_primitiveType_1044 )
        tree_for_string_literal81 = @adaptor.create_with_payload( string_literal81 )
        @adaptor.add_child( root_0, tree_for_string_literal81 )



      when 3
        root_0 = @adaptor.create_flat_list


        # at line 178:7: 'float'
        string_literal82 = match( T__71, TOKENS_FOLLOWING_T__71_IN_primitiveType_1052 )
        tree_for_string_literal82 = @adaptor.create_with_payload( string_literal82 )
        @adaptor.add_child( root_0, tree_for_string_literal82 )



      when 4
        # at line 179:7: 'integer'
        string_literal83 = match( T__73, TOKENS_FOLLOWING_T__73_IN_primitiveType_1060 )
        stream_T__73.add( string_literal83 )

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
        # 179:17: -> ^( INTEGER )
        # at line 179:20: ^( INTEGER )
        root_1 = @adaptor.create_flat_list
        root_1 = @adaptor.become_root( @adaptor.create_from_type( INTEGER, "INTEGER" ), root_1 )

        @adaptor.add_child( root_0, root_1 )




        return_value.tree = root_0



      when 5
        root_0 = @adaptor.create_flat_list


        # at line 180:7: 'string'
        string_literal84 = match( T__80, TOKENS_FOLLOWING_T__80_IN_primitiveType_1074 )
        tree_for_string_literal84 = @adaptor.create_with_payload( string_literal84 )
        @adaptor.add_child( root_0, tree_for_string_literal84 )



      when 6
        root_0 = @adaptor.create_flat_list


        # at line 181:7: 'decimal'
        string_literal85 = match( T__69, TOKENS_FOLLOWING_T__69_IN_primitiveType_1082 )
        tree_for_string_literal85 = @adaptor.create_with_payload( string_literal85 )
        @adaptor.add_child( root_0, tree_for_string_literal85 )



      when 7
        root_0 = @adaptor.create_flat_list


        # at line 182:7: 'datetime'
        string_literal86 = match( T__68, TOKENS_FOLLOWING_T__68_IN_primitiveType_1090 )
        tree_for_string_literal86 = @adaptor.create_with_payload( string_literal86 )
        @adaptor.add_child( root_0, tree_for_string_literal86 )



      when 8
        root_0 = @adaptor.create_flat_list


        # at line 183:7: 'time'
        string_literal87 = match( T__81, TOKENS_FOLLOWING_T__81_IN_primitiveType_1098 )
        tree_for_string_literal87 = @adaptor.create_with_payload( string_literal87 )
        @adaptor.add_child( root_0, tree_for_string_literal87 )



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

    VariableTypeReturnValue = define_return_scope

    #
    # parser rule variableType
    #
    # (in Yarpl.g)
    # 186:1: variableType : ( 'object' | 'var' | 'set' );
    #
    def variableType
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 37 )


      return_value = VariableTypeReturnValue.new

      # $rule.start = the first token seen before matching
      return_value.start = @input.look


      root_0 = nil

      set88 = nil


      tree_for_set88 = nil

      begin
      root_0 = @adaptor.create_flat_list


      # at line 
      set88 = @input.look

      if @input.peek(1) == T__77 || @input.peek(1) == T__79 || @input.peek(1) == T__82
        @input.consume
        @adaptor.add_child( root_0, @adaptor.create_with_payload( set88 ) )

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
        # trace_out( __method__, 37 )


      end

      return return_value
    end



    TOKENS_FOLLOWING_program_IN_start_118 = Set[ 1, 70, 72 ]
    TOKENS_FOLLOWING_domainDeclaration_IN_program_165 = Set[ 1 ]
    TOKENS_FOLLOWING_initialDeclaration_IN_program_181 = Set[ 1 ]
    TOKENS_FOLLOWING_T__70_IN_domainDeclaration_203 = Set[ 34 ]
    TOKENS_FOLLOWING_domainBody_IN_domainDeclaration_205 = Set[ 1 ]
    TOKENS_FOLLOWING_LBRACE_IN_domainBody_230 = Set[ 51, 67 ]
    TOKENS_FOLLOWING_domainBodyDeclaration_IN_domainBody_232 = Set[ 51, 67 ]
    TOKENS_FOLLOWING_RBRACE_IN_domainBody_235 = Set[ 1 ]
    TOKENS_FOLLOWING_typeDeclaration_IN_domainBodyDeclaration_261 = Set[ 1 ]
    TOKENS_FOLLOWING_T__72_IN_initialDeclaration_283 = Set[ 34 ]
    TOKENS_FOLLOWING_initialBody_IN_initialDeclaration_285 = Set[ 1 ]
    TOKENS_FOLLOWING_LBRACE_IN_initialBody_311 = Set[ 51, 54, 77, 79, 82 ]
    TOKENS_FOLLOWING_initialBodyDeclaration_IN_initialBody_313 = Set[ 51, 54, 77, 79, 82 ]
    TOKENS_FOLLOWING_RBRACE_IN_initialBody_316 = Set[ 1 ]
    TOKENS_FOLLOWING_statement_IN_initialBodyDeclaration_342 = Set[ 1 ]
    TOKENS_FOLLOWING_classDeclaration_IN_typeDeclaration_359 = Set[ 1 ]
    TOKENS_FOLLOWING_T__67_IN_classDeclaration_384 = Set[ 29 ]
    TOKENS_FOLLOWING_IDENTIFIER_IN_classDeclaration_386 = Set[ 34 ]
    TOKENS_FOLLOWING_classBody_IN_classDeclaration_388 = Set[ 1 ]
    TOKENS_FOLLOWING_LBRACE_IN_classBody_410 = Set[ 51, 77, 79, 82 ]
    TOKENS_FOLLOWING_classBodyDeclaration_IN_classBody_412 = Set[ 51, 77, 79, 82 ]
    TOKENS_FOLLOWING_RBRACE_IN_classBody_415 = Set[ 1 ]
    TOKENS_FOLLOWING_memberDeclaration_IN_classBodyDeclaration_438 = Set[ 1 ]
    TOKENS_FOLLOWING_fieldDeclaration_IN_memberDeclaration_460 = Set[ 1 ]
    TOKENS_FOLLOWING_variableType_IN_fieldDeclaration_485 = Set[ 29, 66, 68, 69, 71, 73, 76, 80, 81 ]
    TOKENS_FOLLOWING_type_IN_fieldDeclaration_487 = Set[ 29 ]
    TOKENS_FOLLOWING_variableDeclarators_IN_fieldDeclaration_489 = Set[ 54 ]
    TOKENS_FOLLOWING_SEMI_IN_fieldDeclaration_491 = Set[ 1 ]
    TOKENS_FOLLOWING_variableDeclarator_IN_variableDeclarators_518 = Set[ 1, 13 ]
    TOKENS_FOLLOWING_COMMA_IN_variableDeclarators_521 = Set[ 29 ]
    TOKENS_FOLLOWING_variableDeclarator_IN_variableDeclarators_523 = Set[ 1, 13 ]
    TOKENS_FOLLOWING_variableDeclaratorId_IN_variableDeclarator_542 = Set[ 7 ]
    TOKENS_FOLLOWING_ASSIGN_IN_variableDeclarator_544 = Set[ 38, 42, 47, 50, 75 ]
    TOKENS_FOLLOWING_variableInitializer_IN_variableDeclarator_546 = Set[ 1 ]
    TOKENS_FOLLOWING_IDENTIFIER_IN_variableDeclaratorId_573 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_variableInitializer_590 = Set[ 1 ]
    TOKENS_FOLLOWING_variableType_IN_localVariableDeclaration_607 = Set[ 29, 66, 68, 69, 71, 73, 76, 80, 81 ]
    TOKENS_FOLLOWING_type_IN_localVariableDeclaration_609 = Set[ 29 ]
    TOKENS_FOLLOWING_variableDeclarators_IN_localVariableDeclaration_611 = Set[ 54 ]
    TOKENS_FOLLOWING_SEMI_IN_localVariableDeclaration_613 = Set[ 1 ]
    TOKENS_FOLLOWING_localVariableDeclaration_IN_statement_631 = Set[ 1 ]
    TOKENS_FOLLOWING_SEMI_IN_statement_639 = Set[ 1 ]
    TOKENS_FOLLOWING_relationalExpression_IN_expression_657 = Set[ 1, 65, 78 ]
    TOKENS_FOLLOWING_set_IN_expression_660 = Set[ 38, 42, 47, 50, 75 ]
    TOKENS_FOLLOWING_relationalExpression_IN_expression_666 = Set[ 1, 65, 78 ]
    TOKENS_FOLLOWING_addingExpression_IN_relationalExpression_685 = Set[ 1, 25, 27, 28, 39, 40, 45 ]
    TOKENS_FOLLOWING_set_IN_relationalExpression_688 = Set[ 38, 42, 47, 50, 75 ]
    TOKENS_FOLLOWING_addingExpression_IN_relationalExpression_702 = Set[ 1, 25, 27, 28, 39, 40, 45 ]
    TOKENS_FOLLOWING_multiplyingExpression_IN_addingExpression_721 = Set[ 1, 42, 47 ]
    TOKENS_FOLLOWING_set_IN_addingExpression_724 = Set[ 38, 42, 47, 50, 75 ]
    TOKENS_FOLLOWING_multiplyingExpression_IN_addingExpression_730 = Set[ 1, 42, 47 ]
    TOKENS_FOLLOWING_signExpression_IN_multiplyingExpression_749 = Set[ 1, 20, 57, 74 ]
    TOKENS_FOLLOWING_set_IN_multiplyingExpression_752 = Set[ 38, 42, 47, 50, 75 ]
    TOKENS_FOLLOWING_signExpression_IN_multiplyingExpression_760 = Set[ 1, 20, 57, 74 ]
    TOKENS_FOLLOWING_primeExpression_IN_signExpression_786 = Set[ 1 ]
    TOKENS_FOLLOWING_primary_IN_primeExpression_803 = Set[ 1 ]
    TOKENS_FOLLOWING_LPAREN_IN_primeExpression_811 = Set[ 38, 42, 47, 50, 75 ]
    TOKENS_FOLLOWING_expression_IN_primeExpression_813 = Set[ 53 ]
    TOKENS_FOLLOWING_RPAREN_IN_primeExpression_817 = Set[ 1 ]
    TOKENS_FOLLOWING_expression_IN_expressionList_836 = Set[ 1, 13 ]
    TOKENS_FOLLOWING_COMMA_IN_expressionList_839 = Set[ 38, 42, 47, 50, 75 ]
    TOKENS_FOLLOWING_expression_IN_expressionList_841 = Set[ 1, 13 ]
    TOKENS_FOLLOWING_T__75_IN_primary_857 = Set[ 29, 66, 68, 69, 71, 73, 76, 80, 81 ]
    TOKENS_FOLLOWING_creator_IN_primary_859 = Set[ 1 ]
    TOKENS_FOLLOWING_literal_IN_primary_867 = Set[ 1 ]
    TOKENS_FOLLOWING_createdName_IN_creator_881 = Set[ 38 ]
    TOKENS_FOLLOWING_classCreatorRest_IN_creator_883 = Set[ 1 ]
    TOKENS_FOLLOWING_structType_IN_createdName_900 = Set[ 1 ]
    TOKENS_FOLLOWING_primitiveType_IN_createdName_908 = Set[ 1 ]
    TOKENS_FOLLOWING_arguments_IN_classCreatorRest_925 = Set[ 1, 34 ]
    TOKENS_FOLLOWING_classBody_IN_classCreatorRest_927 = Set[ 1 ]
    TOKENS_FOLLOWING_LPAREN_IN_arguments_945 = Set[ 38, 42, 47, 50, 53, 75 ]
    TOKENS_FOLLOWING_expressionList_IN_arguments_947 = Set[ 53 ]
    TOKENS_FOLLOWING_RPAREN_IN_arguments_950 = Set[ 1 ]
    TOKENS_FOLLOWING_RANGEINTEGERLITERAL_IN_literal_964 = Set[ 1 ]
    TOKENS_FOLLOWING_structType_IN_type_978 = Set[ 1 ]
    TOKENS_FOLLOWING_primitiveType_IN_type_994 = Set[ 1 ]
    TOKENS_FOLLOWING_IDENTIFIER_IN_structType_1019 = Set[ 1 ]
    TOKENS_FOLLOWING_T__66_IN_primitiveType_1036 = Set[ 1 ]
    TOKENS_FOLLOWING_T__76_IN_primitiveType_1044 = Set[ 1 ]
    TOKENS_FOLLOWING_T__71_IN_primitiveType_1052 = Set[ 1 ]
    TOKENS_FOLLOWING_T__73_IN_primitiveType_1060 = Set[ 1 ]
    TOKENS_FOLLOWING_T__80_IN_primitiveType_1074 = Set[ 1 ]
    TOKENS_FOLLOWING_T__69_IN_primitiveType_1082 = Set[ 1 ]
    TOKENS_FOLLOWING_T__68_IN_primitiveType_1090 = Set[ 1 ]
    TOKENS_FOLLOWING_T__81_IN_primitiveType_1098 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0

end

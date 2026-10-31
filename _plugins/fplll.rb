require 'rouge'

module Rouge
  module Lexers
    class CppWithFplll < RegexLexer
      title 'fplll'
      desc 'c++ with fplll'
      tag 'fplll'
      filenames '*.cpp'

      state :root do
        rule %r/\s+/, Text::Whitespace

        rule %r/\/\/.*$/, Comment::Single

        rule %r/#include\s*[<"][^>"]+[>"]/, Comment::Preproc

        rule %r/\b(for|return|if|else|try|catch)\b/, Keyword
        rule %r/\b(this)\b/, Keyword::Pseudo
        rule %r/\b(NULL|LM_WRAPPER|FT_DEFAULT|LLL_VERBOSE|BKZ_VERBOSE|BKZ_AUTO_ABORT|BKZ_MAX_LOOPS)\b/, Keyword::Constant
        rule %r/\b(int|float|double|string|bool|void|char|mpz_t|ZZ_mat|vector|Strategy|BKZParam|RedStatus|exception)\b/, Keyword::Type

        rule %r/\b(to_string|rand|c_str|cout|endl|max)\b/, Name::Builtin
        rule %r/\b(block_size|e)\b/, Name::Variable
        rule %r/\b(mpz_set_str|lll_reduction|get_data|load_strategies_json|bkz_reduction|hkz|recover_gso)\b/, Name::Function
        rule %r/\b(fplll|std)\b/, Name::Class
        rule %r/\b(main)\b/, Name::Function
        rule %r/\b[A-Z][A-Z0-9_]*\b/, Name::Constant
        rule %r/[a-zA-Z_][a-zA-Z0-9_]*/, Name::Variable

        rule %r/\b\d+\b/, Literal::Number::Integer

        rule %r/"[^"]*"/, Str
        
        rule %r/[=+\-\*\/;(){}\.,:#<>\[\]\|&]/, Punctuation
      end
    end
  end
end

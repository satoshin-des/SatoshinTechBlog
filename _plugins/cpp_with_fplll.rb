require 'rouge'

module Rouge
  module Lexers
    class CppWithFplll < RegexLexer
      title 'CppWithFplll'
      desc 'c++ with fplll'
      tag 'fplll'
      filenames '*.mlg'

      state :root do
        rule %r/\s+/, Text

        rule %r/\/\/.*$/, Comment::Single

        rule %r/\b(main|for|return|if|else)\b/, Keyword

        rule %r/\b(NULL|LM_WRAPPER|FT_DEFAULT|LLL_VERBOSE|BKZ_VERBOSE|BKZ_AUTO_ABORT|BKZ_MAX_LOOPS)\b/, Keyword::Constant

        rule %r/\b(int|float|double|string|bool|void|char|mpz_t|ZZ_mat|vector|Strategy|BKZParam)\b/, Keyword::Type

        rule %r/#include <*>/, Comment::Preproc

        rule %r/\b(to_string|rand|c_str|cout|endl)\b/, Name::Builtin

        rule %r/\b(mpz_set_str|lll_reduction|get_data|load_strategies_json|bkz_reduction)\b/, Name::Function

        rule %r/\b(fplll|std)\b/, Name::Class

        rule %r/\b\d+\b/, Num::Integer

        rule %r/\b[A-Z][A-Z0-9_]*\b/, Name::Constant

        rule %r/"[^"]*"/, Str
        
        rule %r/[a-zA-Z_][a-zA-Z0-9_]*/, Name
        
        rule %r/[=+\-\*\/;(){}\.,:#<>\[\]\|\&]/, Punctuation
      end
    end
  end
end
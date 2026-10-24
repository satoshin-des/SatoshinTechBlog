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

        rule %r/\b(#include|main|for|return|if|else|NULL)\b/, Keyword

        rule %r/\b(int|float|double|string|bool|void|char|mpz_t|ZZ_mat|vector|Strategy|BKZParam)\b/, Keyword::Type

        rule %r/\b(mpz_set_str|lll_reduction|get_data|to_string|rand|c_str|cout|endl)\b/, Name::Builtin

        rule %r/\b(fplll|std)\b/, Name::Class

        rule %r/\b\d+\b/, Num::Integer

        rule %r/\b[A-Z][A-Z0-9_]*\b/, Name::Constant

        rule %r/"[^"]*"/, Str
        
        rule %r/[a-zA-Z_][a-zA-Z0-9_]*/, Name
        
        rule %r/[=+\-\*\/;(){}\.,:#<>\[\]\|]/, Punctuation
      end
    end
  end
end
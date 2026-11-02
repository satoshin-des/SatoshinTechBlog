require 'rouge'

module Rouge
  module Lexers
    class SageMath < RegexLexer
      title 'Sage'
      desc 'sagemath'
      tag 'sage'
      filenames '*.sage'

      state :root do
        rule %r/\s+/, Text

        rule %r/\/\/.*$/, Comment::Single

        rule %r/\b(for|return|if|else)\b/, Keyword

        rule %r/\b(int|float)\b/, Keyword::Type

        rule %r/\b(expand|var|latex|print|ascii_art|show)\b/, Name::Builtin

        rule %r/\b\d+\b/, Num::Integer

        rule %r/\b([A-Z][A-Z0-9_]*|pi)\b/, Name::Constant

        rule %r/"[^"]*"/, Str
        
        rule %r/[a-zA-Z_][a-zA-Z0-9_]*/, Name
        
        rule %r/[=+\-\*\/;(){}\.,:#<>\[\]\|\&]/, Punctuation
      end
    end
  end
end
require 'rouge'

module Rouge
  module Lexers
    class HSP < RegexLexer
      title 'HSP'
      desc 'hsp'
      tag 'hsp'
      filenames '*.hsp'

      state :root do
        rule %r/\s+/, Text

        rule %r/;.*$/, Comment::Single
        rule %r/(#const)/, Comment::Preproc

        rule %r/\b(repeat|loop|if|else|screen|double|strf|comres|pos|line|stop)\b/, Keyword
        rule %r/\b(cnt)\b/, Keyword::Pseudo

        rule %r/\b(int)\b/, Keyword::Type

        rule %r/\b(newcom|color|line)\b/, Name::Builtin

        rule %r/\b\d+\b/, Num::Integer

        rule %r/\b([A-Z][A-Z0-9_]*)\b/, Name::Constant

        rule %r/"[^"]*"/, Str
        
        rule %r/[a-zA-Z_][a-zA-Z0-9_]*/, Name
        
        rule %r/[=+\-\*\/;(){}\.,:#<>\[\]\|\&]/, Punctuation
      end
    end
  end
end
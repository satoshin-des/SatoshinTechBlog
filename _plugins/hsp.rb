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
        rule %r/(#const|#include\s"([a-zA-Z0-9_.]+)")/, Comment::Preproc

        rule %r/\b(repeat|loop|if|else|screen|comres|stop|goto)\b/, Keyword
        rule %r/\b(cnt)\b/, Keyword::Pseudo

        rule %r/\b(ddim)\b/, Keyword::Type

        rule %r/\b(newcom|color|line|mes|pos|strf|d3getfps|redraw|double|await|boxf)\b/, Name::Builtin
        rule %r/\*([a-zA-Z0-9_]+)/, Name::Class

        rule %r/\b\d+\b/, Num::Integer

        rule %r/\b([A-Z][A-Z0-9_]*)\b/, Name::Constant

        rule %r/"[^"]*"/, Str
        
        rule %r/[a-zA-Z_][a-zA-Z0-9_]*/, Name
        
        rule %r/[=+\-\*\/;(){}\.,:#<>\[\]\|\&]/, Punctuation
      end
    end
  end
end
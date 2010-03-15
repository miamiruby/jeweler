require 'jeweler/generator/bacon_mixin'

class Jeweler
  class Generator
    module TestingFrameworks
      class Bacon < Base
        def initialize(generator)
          super
          use_inline_templates! __FILE__

          rakefile_snippets << inline_templates[:rakefile_snippet]
        end
      end
    end
  end
end
__END__
@@ rakefile_snippet
require 'rake/testtask'
Rake::TestTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = %Q{spec/**/*_spec.rb}
  spec.verbose = true
end

require 'rcov/rcovtask'
Rcov::RcovTask.new do |spec|
  spec.libs << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.verbose = true
end

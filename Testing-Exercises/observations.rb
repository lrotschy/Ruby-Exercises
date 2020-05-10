# observations.rb


procs can be called without arguments without throwing Error


lambdas throw an error when called with the wrong number of arguments

lambdas are a type of Proc, Procs are a Proc, blocks are not objects--just syntax

lambda and proc syntax are different

name = lambda { |param|...param...}
name = -> (param) {...param...}
name.call(arg)
NOT Lambda.new

name = proc { |param| ...param...}
name.call(*optional args)
name = Proc.new { |param| ...param...}

return values...?

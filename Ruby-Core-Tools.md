## Core Tools/Packaging Code 

### 1. Purpose of core tools
what gets installed with modern versions of Ruby:
- core library
- standard library
- `irb` REPL
- `rake` utility (to automate Ruby dev tasks)
- `gem` command (tool to manage ruby gems)
- documentaion tools -- `rdoc` and `ri`

#### a. Bundler 
A gem that lets you specify which Ruby and which Gems you want to use with your Ruby app and checks for dependencies within them. It relies on a `Gemfile` in which you describe the version and gems you want. It creates a `Gemfile.lock` that specifies actual versions of gems and any other gems they depend on. 

To use Bundler: 
1. Bundler is installed automatically with Ruby 2.5 and higher. Otherwise, `gem install bundler`
2. Set up a project with the proper file structure. (lib, test, README are children of parent directory)
3. Create a `Gemfile`
4. Make sure you are using the correct version of ruby
5. run `bundle install` to create a `Gemfile.lock`
6. include `require bundler/setup` at the top of every project page
7. use `bundle exec` before commands to make sure you are using the proper versions of ruby and gems


#### b. Rake : 
a gem that automates functions required to build, test, package, and install programs. Uses a `Rakefile` to specify tasks. For example: 
  - set up env by creating files and directories
  - set up and initialize databases
  - run test
  - package app and files for distribution
  - install the app
  - perform common Git tasks
  - rebuild files and directories based on changes to other files and directories
  - i.e. anything you want to do during development, testing, and release cycles

Why use Rake?
  - It is used in almost every Ruby project
  - you can ensure tasks are completed in proper order
  - you avoid typos
  - you save time by using one command
  
To use Rake: 
1. Rake 
2. Create a rakefile
3. Make sure rake is added to Gemfile
4. run `bundle install`
5. now you can run rake tasks with `bundle exec rake -T` (to print a list of tasks) or `bundle exec rake` to run default, or `bundle exec rake task_name` to run a specific task.

Examples of rake tasks in a `Rakefile`:
```ruby 
require 'rake/testtask'
require 'bundler/gem_tasks'
require 'find'

desc 'Say hello'
task :default do # task :hello do (naming it default makes it default)
  puts "Hello there. This is the 'hello' task."
end

desc 'Run tests'
task :default => :test

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/*_test.rb']
end


desc 'List files'
task :file_list

# files = Rake::FileList["*.*", "*/*.*"]
# files.exclude(".*", "*/.*")
# puts files
files = []
Find.find('.') do |path|
  files << path if !path.include?('/.')
end
puts files
```

#### c. RVM/rbenv: let you intstall, manage, anduse multiple versions of Ruby and their utilities and gems
  - keeps gems and ruby versions together
  - RVM Gemsets is similar to Bundler but less widely used

#### d. Gems: packages of code that you can download, install, and use
  - rubocop (schecks for Ruby style guide violations)
  - pry (debugging tool)
  - sequel (simplifies database access)
  - rails (web application framework for dev)

#### e. Ruby projects 
are programs and libraries that use Ruby. Each Ruby project uses Ruby and gems. 

### 2. Gemfiles
To make a gem you need a .gemspec file and a common directory structure

- Source of Gems
- need a .gemspec file--if packaging as a Gem
- what version of ruby?
- What Ruby gems and versions?
```ruby
source "https://rubygems.org"
ruby '2.2.0'
gem 'minitest', '~> 5.10'
gem 'minitest-reporters', '~> 1.1'
gem 'stamp', '~> 0.6'
gem 'rake'
```
-the squiggle means up to the next decimal version (>= 5.1 and < 5.2, >= 1.1 and < 2.0, >= 0.6 and < 1.0--note that this is not the same as what is in LS materials, but it is in line with Bundler documentation https://bundler.io/v1.5/gemfile.html)

After creating `Gemfile` run `bundle install`, which will create `Gemfile.lock` that contains all the dependency information. Rerun this command every time you make a change to `Gemfile`. 

Add `require 'bundler/setup'` at the very top of all project files. 

Make sure you are running the correct version of Ruby and that you have bundler installed for that version. 
```ruby 
$ rvm install ruby-2.2.0
$ rvm use 2.2.0
$ gem install bundler

```
3. `Rakefile `
a. create  `Rakefile` in top level directory
b. write tasks 
```ruby
desc 'description of task'
task :task_name_as_symbol do 
  puts "create a block that does task"
end 
desc 'Run tests'
task :test do # or task :default do
  sh 'ruby ./test/todolist_project_test.rb'
end
```
c. add `gem 'rake'` to `Gemfile` and run `bundle install`
d. run rake tasks/commands 
```ruby
bundle exec rake -T # lists tasks
bundle exec rake # runs default tasks
bundle exec rake task_name # runs task
```

4. Steps for preparing a gem and `.gemspec ` file
a. put directories in proper arrangment
b. include:
    `rakefile` (opt)
    `gemfile` (opt)
c. add a `README.md` file 
d. prepare `project_name.gemspec` file
```ruby 
Gem::Specification.new do |s|
  s.name        = 'todolist_project'
  s.version     = '1.0.0'
  s.summary     = 'Todo List Manager!'
  s.description = 'This is a simple todo list manager!'
  s.authors     = ['Pete Williams']
  s.email       = 'pw@example.com'
  s.homepage    = 'http://example.com/todolist_project'
  s.files       = ['lib/todolist_project.rb', 'test/todolist_project_test.rb']
end
``` 
e. add `gemspec` to `Gemfile`
f. modify `Rakefile`. add near top:
`require "bundler/gem_tasks"`
g. run 
- `bundle exec rake build` 
- `bundle exec rake install`
- `bundle exec rake release`

Project directory structure:

main directory >
> project_name.gemspec
> Gemfile
> Gemfile.lock
> README.md
> Rakefile
> lib > program.rb
> test > program_test.rb

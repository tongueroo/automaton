Questions
=========

Ask questions from and provide answers to Automaton tasks.

Example Task
------------

<pre>
require 'automaton'

questions do
  name "What is your name?"
  email "What is your email?"
end

# do something with @name or @email here
</pre>

Extract Questions
-----------------

<pre>
require 'automaton'

module Automaton
  module Questions
    Questions.raise_exception_when_finished = true
    begin
      Runner.new('path/to/task.rb')
    rescue Finished
      # do something with Questions.questions or Questions.order
    end
  end
end
</pre>

Provide Answers
---------------

<pre>
require 'automaton'

module Automaton
  module Questions
    Questions.answers = [ :name => "John Doe", :email => "john@doe.org" ]
    Runner.new('path/to/task.rb')
  end
end
</pre>
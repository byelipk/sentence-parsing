require 'pry'
require 'treat'
include Treat::Core::DSL

string = <<STR
This year my goal is to start laying groundwork to move from mid-level developer to senior-level developer. I think community here has some great advice to share about leveling up one's programming skills, which is why I would like for this to be as much a public discussion as possible. Another reason is that I feel like there are others here in the similar situation. Reason for that being that starting with programming (Ruby) had a somewhat more of a straightforward path: start with one of the few cornerstone tutorials, learn syntax, build a few basic scripts / applications, and start peeling away Rails layer by layer. After over 2 years of being full-time software engineer in Ruby, I can't see the next steps as clear (perhaps it is the case of 'the more you learn, the less you know').

Here is a little more details about myself: I started coding almost 4 years ago, first in .Net. I have been writing Ruby professionally for a little over 2 years now, but would still very much consider myself to be a mid-level software engineer. In college I was an engineering major, but not CS. If the goal of becoming a senior software engineer sounds too broad, more specifically I want to become a senior full-stack / generalist engineer (Ruby + web).

I also think the best way to answer this question is to split it up into two separate questions: 1) How can mid-level developer become a senior developer? 2) And, perhaps more importantly, what makes a good senior developer?

To attempt to answer first question, some of the specific suggestions I came across so far are:

Understand and Implement Algorithms: Implement bloom filter, closest pair, etc Reimplement common data structures: Queue, stack, etc Rewrite gems: Reimplement xml library, etc. Architect applications on paper: Think of how you would implement Twitter (for example) and draw it out on the paper. I also heard a lot of advice like 'write a lot of code', 'read a lot of code', or 'read programming books' which is too vague to be helpful.

As far as addressing the 2nd part of the question, I had a hard time finding characteristic of good senior-level Ruby / Rails developer.  Don't get me wrong, a lot of people are looking for senior level engineers, but most job descriptions are too general.

What did you do to become a better developer? Please be as specific as possible about what worked for you, what resources you used or anything else of relevance.

Thank you Rogues!
STR


# Turn string into a section
entity = string.to_entity

# Chunk section to access paragraphs
sect = entity.chunk

# Intermediate variable to store paragraphs
ppgs = sect.paragraphs

html = []

ppgs.each do |pp|
  sentences = []
  pp.segment :punkt
  pp.each do |s|
    sentences << s.to_s
  end

  html << sentences
end

puts entity.print_tree

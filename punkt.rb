# == Punk-Segmenter NLP
#
# This is an example that illustrates the power of a learning algorithm's ability
# to parse a section of text for sentences when given adequate training data.
#
# The word we're training on is ".Net".
#
# When given inadequate training data, ".Net." is not recognized as a sentence boundry.
# Thus, the following is parsed as an entire sentence:
#
# => Here is a little more details about myself: I started coding almost 4 years ago, first in .Net. I love .Net so much that I just needed to keep writing in it as long as .Net was around.
#
# After increasing the frequency and varrying the useage of ".Net" in the training data,
# that selection is parsed correctly as several seprate sentences:
#
# => Here is a little more details about myself: I started coding almost 4 years ago, first in .Net.
# => I love .Net so much that I just needed to keep writing in it as long as .Net was around.
#
# gem install punkt-segmenter

require 'punkt-segmenter'

bad_training = <<STR
This year my goal is to start laying groundwork to move from mid-level developer to senior-level developer. I think community here has some great advice to share about leveling up one's programming skills, which is why I would like for this to be as much a public discussion as possible. Another reason is that I feel like there are others here in the similar situation. Reason for that being that starting with programming (Ruby) had a somewhat more of a straightforward path: start with one of the few cornerstone tutorials, learn syntax, build a few basic scripts / applications, and start peeling away Rails layer by layer. After over 2 years of being full-time software engineer in Ruby, I can't see the next steps as clear (perhaps it is the case of 'the more you learn, the less you know').

Here is a little more details about myself: I started coding almost 4 years ago, first in .Net. I have been writing Ruby professionally for a little over 2 years now, but would still very much consider myself to be a mid-level software engineer. In college I was an engineering major, but not CS. If the goal of becoming a senior software engineer sounds too broad, more specifically I want to become a senior full-stack / generalist engineer (Ruby + web).

I also think the best way to answer this question is to split it up into two separate questions: 1) How can mid-level developer become a senior developer? 2) And, perhaps more importantly, what makes a good senior developer?

To attempt to answer first question, some of the specific suggestions I came across so far are:

Understand and Implement Algorithms: Implement bloom filter, closest pair, etc Reimplement common data structures: Queue, stack, etc Rewrite gems: Reimplement xml library, etc. Architect applications on paper: Think of how you would implement Twitter (for example) and draw it out on the paper. I also heard a lot of advice like 'write a lot of code', 'read a lot of code', or 'read programming books' which is too vague to be helpful.

As far as addressing the 2nd part of the question, I had a hard time finding characteristic of good senior-level Ruby / Rails developer.  Don't get me wrong, a lot of people are looking for senior level engineers, but most job descriptions are too general.

What did you do to become a better developer? Please be as specific as possible about what worked for you, what resources you used or anything else of relevance.

Thank you Rogues!
STR

good_training = <<STR
This year my goal is to start laying groundwork to move from mid-level developer to senior-level developer. I think community here has some great advice to share about leveling up one's programming skills, which is why I would like for this to be as much a public discussion as possible. Another reason is that I feel like there are others here in the similar situation. Reason for that being that starting with programming (Ruby) had a somewhat more of a straightforward path: start with one of the few cornerstone tutorials, learn syntax, build a few basic scripts / applications, and start peeling away Rails layer by layer. After over 2 years of being full-time software engineer in Ruby, I can't see the next steps as clear (perhaps it is the case of 'the more you learn, the less you know').

Here is a little more details about myself: I started coding almost 4 years ago, first in .Net. I love .Net so much that I just needed to keep writing in it as long as .Net was around. I have been writing Ruby professionally for a little over 2 years now, but would still very much consider myself to be a mid-level software engineer. In college I was an engineering major, but not CS. If the goal of becoming a senior software engineer sounds too broad, more specifically I want to become a senior full-stack / generalist engineer (Ruby + web).

I also think the best way to answer this question is to split it up into two separate questions: 1) How can mid-level developer become a senior developer? 2) And, perhaps more importantly, what makes a good senior developer?

To attempt to answer first question, some of the specific suggestions I came across so far are:

Understand and Implement Algorithms: Implement bloom filter, closest pair, etc Reimplement common data structures: Queue, stack, etc Rewrite gems: Reimplement xml library, etc. Architect applications on paper: Think of how you would implement Twitter (for example) and draw it out on the paper. I also heard a lot of advice like 'write a lot of code', 'read a lot of code', or 'read programming books' which is too vague to be helpful.

As far as addressing the 2nd part of the question, I had a hard time finding characteristic of good senior-level Ruby / Rails developer.  Don't get me wrong, a lot of people are looking for senior level engineers, but most job descriptions are too general.

What did you do to become a better developer? Please be as specific as possible about what worked for you, what resources you used or anything else of relevance.

Thank you Rogues!

p.s.

Did I mention that I love .Net?
STR

# Not good enough
# tokenizer = Punkt::SentenceTokenizer.new(bad_training)
# result    = tokenizer.sentences_from_text(bad_training, :output => :sentences_text)

# Not good enough
# tokenizer = Punkt::SentenceTokenizer.new(bad_training)
# result    = tokenizer.sentences_from_text(good_training, :output => :sentences_text)

# Good enough
# tokenizer = Punkt::SentenceTokenizer.new(good_training)
# result    = tokenizer.sentences_from_text(good_training, :output => :sentences_text)

# Good enough
tokenizer = Punkt::SentenceTokenizer.new(good_training)
result    = tokenizer.sentences_from_text(bad_training, :output => :sentences_text)

puts result

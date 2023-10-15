require "sinatra"
require "better_errors"
require "binding_of_caller"
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')



base_URL =  "https://organic-space-guacamole-4j75gqgg574ph95j-4567.app.github.dev/dice_2.0/"

get("/") do
  "Hello World"
end

get("/zebra") do
  "We must add a route for each path we want to support"
end

get("/dice_2.0") do
"<h1>Pick a dice game to play!</h1>
 <p><a href = \"/2/6\">Roll 2 dice with 6 sides each</a></p>
 <p><a href = '#{base_URL}2/10'>Roll 2 dice with 10 sides each</a></p>
 <p><a href = '#{base_URL}1/20'>Roll 1 die with 20 sides</a><p>
 <p><a href = '#{base_URL}5/4'>Roll 5 dice with 4 sides each</a><p>"
end



get("/dice_2.0/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die
	
  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
	
  "<h1>2d6</h1>
   <p>#{outcome}</p>"
end


get("/dice_2.0/2/10") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die

  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}"

  "<h1>2d/10,</h1>
  <p>#{outcome}</p>"
end

get ("/dice_2.0/1/20") do 
  first_die = rand(1..20)
  outcome = "You rolled a #{first_die}"

  "<h1>1d/20</h1>
   <p>#{outcome}</p>"
end

get ("/dice_2.0/5/4") do
  first_die = rand(1..4)
  second_die = rand(1..4)
  third_die = rand(1..4)
  fourth_die = rand(1..4)
  fifth_die = rand(1..4)

  sum = first_die + second_die + third_die + fourth_die +fifth_die

  outcome = "You rolled #{first_die}, #{second_die}, #{third_die}, #{fourth_die}, and #{fifth_die} for a total of #{sum}"

  "<h1>5d/4</h1>
   <p>#{outcome}</p>"
end

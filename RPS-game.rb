
$weapons = ["rock", "paper", "scissors"]
$user_win = "You won this round!"
$comp_win = "The computer won this round!"
$user_win_count = 0
$comp_win_count = 0

puts "How many rounds would you like to play?"
$set_rounds = $stdin.gets.chomp.to_i

def ending 
  puts "Would you like to play again? Write Y (for yes) or N (for no)."
  user_continue = $stdin.gets.chomp.downcase
  if user_continue === "y"
    $user_win_count = 0
    $comp_win_count = 0
    puts "How many rounds would you like to play?"
    $set_rounds = $stdin.gets.chomp.to_i
    rps_round  
  else exit!
  end
end

def rps_round 
  puts "_________"
  puts "You: #{$user_win_count} vs Computer: #{$comp_win_count}"

  if $user_win_count === $set_rounds
    puts "///////////////////////////////////"
    puts "Congratulations! You won the game!"
    puts "///////////////////////////////////"
    ending
  elsif $comp_win_count === $set_rounds
    puts "///////////////////////////"
    puts "Oh snap! You lost the game."
    puts "///////////////////////////"
    ending
  else
    puts "Please choose either rock, paper or scissors."
    print '> '
    user_choice = $stdin.gets.chomp.downcase
    puts "You chose #{user_choice}."
    comp_choice = $weapons[rand($weapons.length)]
    puts "The Computer picks #{comp_choice}."

    if user_choice ===  comp_choice
      puts "It's a draw! Let's try again."
      rps_round
    elsif user_choice === "rock" && comp_choice === "scissors"
      puts $user_win
      $user_win_count += 1
      rps_round
    elsif user_choice ===  "rock" && comp_choice === "paper"
      puts $comp_win
      $comp_win_count += 1
      rps_round
    elsif user_choice === "scissors" && comp_choice === "paper"
      puts $user_win
      $user_win_count += 1
      rps_round
    elsif user_choice === "scissors" && comp_choice === "rock"
      puts $comp_win
      $comp_win_count += 1
      rps_round
    elsif user_choice === "paper" && comp_choice === "rock"
      puts $user_win
      $user_win_count += 1
      rps_round
    elsif user_choice === "paper" && comp_choice === "scissors"
      puts $comp_win
      $comp_win_count += 1
      rps_round
    else   
      puts "Hey, you wrote #{user_choice}. That doesn't count. Let's try again!"
      rps_round
    end
  end
end

puts "Welcome to the game 'Rock, paper, scissors.' Have fun!"
rps_round
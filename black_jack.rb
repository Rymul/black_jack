card_scores = { 'A' => [1, 11], 'K' => 10, 'Q' => 10, 'J' => 10, 
'10' => 10, '9' => 9, '8' => 8, '7' => 7, '6' => 6, 
'5' => 5, '4' => 4, '3' => 3, '2' => 2, '1' => 1 }
# how to make it so there are 4 of each card? hashes have unique keys
#could do 'AD' 'AS' 'AH' 'AC'
suits = ['D', 'H', 'S', 'C']

ALL_CARDS = Hash.new
suits.each do |suit|
    card_scores.each do |k, v|
        ALL_CARDS[k + suit] = v
    end
end

p ALL_CARDS




def game_play
    
    max_score = 21

    cards_arr = ALL_CARDS.keys
    player_hand = cards_arr.sample(2)
    p player_hand
    dealer_hand = cards_arr.sample(2)

    player_score = player_hand.each {|card| (ALL_CARDS[card].sum)}
    p player_hand
    p player_score
    p dealer_hand[0]
    p "hit or stay"
    answer = gets.chomp
    if answer == "hit"
        player_hand << cards_arr.sample
        p player_hand
        p player_score


    elsif answer == "stay"

    else 
    
    end
end

# on each turn/hit need to check score against 21 
# how do you choose 11 or 1 for an ace?
# how do you remove that card (k,v) from the hash -> own method

# need to make messages for "you win the hand", "bust", "dealer wins the hand"
# play again? y, n
# error handling for when someing other than hit or stay is input

#Black Jack class
# instance vars = @deck(via generate_deck Class#method), @dealer, @player
# instance methods = deal(will use hit intance method 
# - give cards to dealer and player and remove them from the ALL CARDS - use .shuffle and deal first card in deck)
# instance method = win, lose, bust, hit, play(initialize game), 
# inst method(after every round need to check num_cards to see if > .33 * num_cards)



#Dealer Class - @hit(if score <= 16), @dealer_score(attr_accessor), 
#inst method for ace(dealer hits on soft 17)
#Player Class - where we get user input and do most error handling, @player_score(attr_accessor)
#inst method for ace(if hand with 11 > 21 -> ace becomes 1)

game_play

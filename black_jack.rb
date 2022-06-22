All_cards = { 'A' => [1, 11], 'K' => 10, 'Q' => 10, 'J' => 10, 
'10' => 10, '9' => 9, '8' => 8, '7' => 7, '6' => 6, 
'5' => 5, '4' => 4, '3' => 3, '2' => 2, '1' => 1 }
# how to make it so there are 4 of each card? hashes have unique keys
#could do 'AD' 'AS' 'AH' 'AC'





def game_play
    
    max_score = 21

    cards_arr = All_cards.keys
    player_hand = cards_arr.sample(2)
    p player_hand
    dealer_hand = cards_arr.sample(2)

    player_score = player_hand.each {|card| (all_cards[card].to_i.sum)}
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
# how do you remove that card (k,v) from the hash
# on each trun dealer score compared to 18 if bellow, dealer hits
# need to make messages for "you win the hand", "bust", "dealer wins the hand"
# play again? y, n
# error handling for when someing other than hit or stay is input



game_play

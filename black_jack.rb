require_relative "bj_player.rb"
require_relative "bj_dealer.rb"

CARD_VALUES = { 'A' => 11, 'K' => 10, 'Q' => 10, 'J' => 10, 
'10' => 10, '9' => 9, '8' => 8, '7' => 7, '6' => 6, 
'5' => 5, '4' => 4, '3' => 3, '2' => 2 }

SUITS = ['D', 'H', 'S', 'C']

# ALL_CARDS = Hash.new
# SUITS.each do |suit|
#     CARD_VALUES.each do |k, v|
#         ALL_CARDS[k + suit] = v
#     end
# end


#Black Jack class
# instance vars = @deck(via generate_deck Class#method), @dealer, @player
# instance methods = deal(will use hit intance method 
# - give cards to dealer and player and remove them from the ALL CARDS - use .shuffle and deal first card in deck)
# instance method = win, lose, bust, hit, play(initialize game), 
# inst method(after every round need to check num_cards to see if > .33 * num_cards)


class BlackJack

    def self.generate_deck
        all_cards = Hash.new
        SUITS.each do |suit|
            CARD_VALUES.each do |k, v|
                all_cards[k + suit] = v
            end
        end
        cards_arr = all_cards.keys
        cards_arr.shuffle
    end

    attr_reader :deck, :dealer, :player
    def initialize
        @deck = BlackJack.generate_deck
        @dealer = Dealer.new
        @player = Player.new
    end


    def win?

    end

    def bust?

    end

    def deal(answer)
        puts @player.hand
        puts @player.score
        puts @dealer.hand[0]

        player_hand << @deck[0] if answer == 'hit'
            puts @player.hand
            puts @player.score
            @deck -= @deck[0]
        if @dealer.score <= 16
            @dealer.hand << @deck[0]
            puts @dealer.hand[0]
        elsif @dealer.score > 17 && @dealer.hand.include?('A')
            @dealer.score -= 10
        end

    end

    def play
        @player.start_hand
        @delare.start_hand
        self.deal(answe)
    end


    




    # def game_play

    # max_score = 21

    # cards_arr = ALL_CARDS.keys
    # player_hand = cards_arr.sample(2)
    # p player_hand
    # dealer_hand = cards_arr.sample(2)

    # player_score = player_hand.each {|card| (ALL_CARDS[card].sum)}
    # p player_hand
    # p player_score
    # p dealer_hand[0]


    # else 

    # end
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




require_relative "bj_player.rb"
require_relative "bj_dealer.rb"

CARD_VALUES = { 'A' => 11, 'K' => 10, 'Q' => 10, 'J' => 10, 
'10' => 10, '9' => 9, '8' => 8, '7' => 7, '6' => 6, 
'5' => 5, '4' => 4, '3' => 3, '2' => 2 }

SUITS = ['D', 'H', 'S', 'C']




#Black Jack class
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

    def self.player_score
        self.player_score = @player.player_hand.each {|card| (ALL_CARDS[card].sum)}
    end

    def dealer_score
        dealer_score = @dealer.dealer_hand.each {|card| (ALL_CARDS[card].sum)}
    end

    def win?(player_score, dealer_score)
        if self.player_score > self.dealer_score && self.player_score <= 21
            puts "You won the hand!"
            return true
        else self.dealer_score > self.player_score && self.dealer_score <= 21
            puts "Dealer won the hand."
            return false
        end
    end

    def bust?(player_score, dealer_score)
        if self.player_score > 21
            puts "You bust!"
            return true
        else self.dealer_score > 21
            puts "Dealer busted."
        end
    end

    def deal(answer)
        puts @player.hand
        puts self.player_score
        puts @dealer.hand[0]

        @player.hand << @deck[0] if answer == 'hit'
            puts @player.hand
            puts self.player_score
            @deck -= @deck[0]
        if @player.score > 21 && @player.hand.include?('A')
            @player.score -= 10
        end
        if self.dealer_score <= 16
            @dealer.hand << @deck[0]
            puts @dealer.hand[0]
        elsif self.dealer_score > 17 && @dealer.hand.include?('A')
            self.dealer_score -= 10
        end
    end

    def not_enough_cards?
        total_num_of_cards = @deck.length
        percent_of_cards_needed = total_num_of_cards * 0.33
        if total_num_of_cards < percent_of_cards_needed
            raise "Number of cards in deck too low to continue play. Start new game."
            return true
        else
            false
        end
    end
    
    def play_again?
        if win?(player_score, dealer_score) || not_enough_cards? 
            puts "Game over!"
            puts "Play again? y/n"
            answer = gets.chomp
            if answer == "y"
                self.play
            end
        end
    end

    def play
        @player.start_hand
        @dealer.start_hand
        self.deal(@player_move)
        self.bust?
        self.win?
        self.enough_cards?
    end
    
end




#Black Jack class
# instance vars = @deck(via generate_deck Class#method), @dealer, @player
# instance methods = deal(will use hit intance method 
# - give cards to dealer and player and remove them from the ALL CARDS - use .shuffle and deal first card in deck)
# instance method = win, lose, bust, hit, play(initialize game), 
# inst method(after every round need to check num_cards to see if > .33 * num_cards)




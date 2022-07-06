require_relative "./bj_player.rb"
require_relative "./bj_dealer.rb"

CARD_VALUES = { 'A' => 11, 'K' => 10, 'Q' => 10, 'J' => 10, 
'10' => 10, '9' => 9, '8' => 8, '7' => 7, '6' => 6, 
'5' => 5, '4' => 4, '3' => 3, '2' => 2 }

# SUITS = ['D', 'H', 'S', 'C']



class BlackJack

    def self.generate_deck(card_values, suits)
        cards_arr = []
        all_cards = Hash.new
        suits.each do |suit|
            card_values.each do |k, v|
                all_cards[k + suit] = v
            end
        end
        cards_arr = all_cards.keys
        return cards_arr.shuffle
    end

    attr_reader :deck, :dealer, :player
    def initialize(card_values, suits)
        @deck = BlackJack.generate_deck(card_values, suits)
        @dealer = Dealer.new
        @dealer_hand = [] #[self.dealer_start_hand]
        @player = Player.new
        @player_hand = [] #[self.player_start_hand]
    end

    def player_start_hand
        @player_hand.push(self.deck[0], self.deck[1])
        self.deck.delete(self.deck[0])
        self.deck.delete(self.deck[1])
    end

    def player_score
        # player_score = 
        sum = 0
        @player_hand.each do |card| 
           sum += CARD_VALUES[card]
        end
        sum
    end

    def dealer_start_hand
        @player_hand.push(self.deck[0], self.deck[1])
        self.deck.delete(self.deck[0])
        self.deck.delete(self.deck[1])
     end

     def dealer_score
        dealer_score = @dealer_hand.each {|card| (CARD_VALUES[card].sum)}
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
        puts @player_hand
        puts self.player_score
        puts @dealer_hand[0]

        @player_hand << deck[0] if answer == 'hit'
            puts @player_hand
            puts self.player_score
            @deck -= @deck[0]
        if @player_score > 21 && @player_hand.include?('A')
            @player_score -= 10
        end
        if self.dealer_score <= 16
            @dealer_hand << @deck[0]
            puts @dealer_hand[0]
        elsif self.dealer_score > 17 && @dealer_hand.include?('A')
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
        player_start_hand
        dealer_start_hand
        self.deal(@player_move)
        self.bust?
        self.win?
        self.enough_cards?
    end
end

card_values = { 'A' => 11, 'K' => 10, 'Q' => 10, 'J' => 10, 
    '10' => 10, '9' => 9, '8' => 8, '7' => 7, '6' => 6, 
    '5' => 5, '4' => 4, '3' => 3, '2' => 2 }
    
suits = ['D', 'H', 'S', 'C']
bj = BlackJack.new(card_values, suits)
bj.play





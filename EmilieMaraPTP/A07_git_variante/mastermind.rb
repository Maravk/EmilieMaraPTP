module Mastermind

  class Color < Struct.new(:symbol)

    def to_s

      symbol.to_s

    end

  end



  class Colors < Array

    def all_possibilities(pegs_count)

      repeated_permutation(pegs_count).map do |c|

        Combination.new(c)

      end

    end

  end



  class Answer < Struct.new(:blacks, :whites);

    def to_s

      "B: #{blacks} W: #{whites}"

    end

  end



  class Combination < Array

    def score(other)

      other_combination = other.dup

      black_count = zip(other_combination).find_all { |a, b| a==b }.count

      white_count = inject(0) { |mem, peg|

        if (index = other_combination.index(peg))

          other_combination.delete_at index

          mem += 1

        end

        mem

      } - black_count

      Answer.new(black_count, white_count)

    end



    def self.from_symbols(symbols)

      Combination.new(symbols.map { |s| Color.new(s) })

    end



    def to_s

      join('')

    end

  end



  class KnuthAlgorithm

    def initialize(colors, pegs_count)

      @colors = colors

      @pegs_count = pegs_count

      create_possibilities_set

      create_pegs_combinations

    end



    def attempt(before_combinations, old_scores)

      @before_combinations, @old_scores = before_combinations, old_scores

      return first_guess if before_combinations.empty?

      reject_infeasible!

      find_best

    end



    private



    def reject_infeasible!

      @before_combinations.zip(@old_scores).each do |combination, score|

        @possibilities.reject! { |answer|

          answer.score(combination) != score }

      end

    end



    def find_best

      @possibilities.max_by do |g|

        @answers_combination.map do |answer|

          @all_possibilities.map do |p|

            p.score(g) != answer ? 1 : 0

          end.inject(:+)

        end.min

      end

    end



    def first_guess

      half_pegs_count = @pegs_count/2

      Combination.new([@colors[0]] * half_pegs_count + [@colors[1]] * (@pegs_count - half_pegs_count))

    end



    def create_possibilities_set

      @possibilities = @colors.all_possibilities(@pegs_count)

      @all_possibilities = @possibilities.dup

    end



    def create_pegs_combinations

      @answers_combination = [:white, :black, :none].repeated_permutation(@pegs_count).map do |combination|

        Answer.new(combination.count(:black), combination.count(:white))

      end

    end

  end



  class Mastermind < Struct.new(:attempts_count)

    def initialize(hidden_combination, algorithm_class)

      @hidden_combination = hidden_combination

      @algorithm = algorithm_class.new(colors, pegs_count)

      check_combination

    end



    def play

      @combinations, @scores, @attempts = [], [], 0

      puts "Hidden combination: #{@hidden_combination}"

      loop do

        answer = @algorithm.attempt(@combinations, @scores)

        score = answer.score @hidden_combination

        puts "Attempt: #{answer}, Score: #{score}"

        @attempts += 1

        @combinations << answer

        @scores << score

        break if win?(score)

      end

    end



    def win?(score)

      score.blacks == pegs_count

    end



    def pegs_count

      4

    end



    def colors

      @allowed_colors ||= Colors.new(%w(A B C D E F).map { |symbol| Color.new(symbol) })

    end



    private

    def check_combination

      @hidden_combination.each do |color|

        raise "Color #{color} is not suitable." unless colors.include?(color)

      end

    end

  end

end



game = Mastermind::Mastermind.new(Mastermind::Combination.from_symbols, Mastermind::KnuthAlgorithm)

game.play

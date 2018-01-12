# Author:: Emilie Schuller
# Author:: Mara von Kroge
# TeamChallenger
# Mastermind - Human - Codebreaker

require_relative "mastermind_rules.rb"
require_relative "mastermind_io"

emi = MasterMindIO.new
emi.start
emi.input_human_codemaker
emi.check_combination_human_codemaker

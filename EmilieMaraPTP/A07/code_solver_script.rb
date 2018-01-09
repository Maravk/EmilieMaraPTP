# Author:: Mara von Kroge
# Author:: Emilie Schuller
# TeamChallenger
# 1. Januar 2018
# Code_solver für das Spiel MasterMind

require_relative "mastermind.rb"

mastermind=MasterMind.new
mastermind.generate_code
mastermind.code_solver

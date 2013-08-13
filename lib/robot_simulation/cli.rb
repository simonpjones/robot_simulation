require 'robot_simulation/robot'
require 'robot_simulation/table'

module RobotSimulation
  class Cli
    
    attr_accessor :robot, :table, :instructions

    def initialize
      @table = Table.new(size: 5)
      @robot = Robot.new(@table)
    end


    def start
      loop do
        repl ">> "
      end
    end

    private

    def repl(prompt)
      print prompt
      input = gets.chomp

      command, parameters = input.split(/\s/)

      parameters ||= ""
      handle_input command, parameters
    end

    def handle_input(command, paramaters)
      return if command.nil?
      result = case command.upcase.to_sym
      when :PLACE
        x, y, f = paramaters.split(',')
        place x, y, f
      when :MOVE then move
      when :LEFT, :RIGHT then rotate command.upcase.to_sym
      when :REPORT then result = report
      when :EXIT then exit 0
      else 
        'Invalid command.' 
      end

      puts(" => #{result}") unless result.nil? || result.empty?
    end

    def place(x,y,f)
      begin
        robot.place!(x.to_i, y.to_i, f.upcase.to_sym)
      rescue InvalidCoordinatesError => e
        e.message
      rescue InvalidOrientationError => e
        e.message
      end
    end

    def move
      begin
        robot.move!
      rescue NotPlacedError => e
        e.message
      end
    end

    def rotate(direction)
      begin
        robot.rotate! direction
      rescue InvalidDirectionError => e
        e.message
      rescue NotPlacedError => e
        e.message
      end
    end

    def report
      begin
        robot.report
      rescue NotPlacedError => e
        e.message
      end
    end

  end
end
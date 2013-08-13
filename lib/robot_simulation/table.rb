module RobotSimulation
  class Table
    attr_reader :size

    def initialize(options = {size: 5})
      @size = options[:size]
    end

    def min_coordinate
      0
    end

    def max_coordinate
      size - 1
    end
  end
end
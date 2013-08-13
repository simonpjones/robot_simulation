module RobotSimulation
  class Table
    attr_reader :size

    def initialize(options = {size: 5})
      @size = options[:size]
    end

    # Returns the minimum value an x or y coordinate can be
    #
    # Returns Integer
    def min_coordinate
      0
    end

    # Returns the maximum value an x or y coordinate can be
    #
    # Returns Integer
    def max_coordinate
      size - 1
    end
  end
end
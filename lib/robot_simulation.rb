require "robot_simulation/version"

module RobotSimulation

   # Base class for all RobotSimulation exceptions
  class RobotSimulationError < StandardError
  end

  class InvalidCoordinatesError < RobotSimulationError
  end

  class InvalidDirectionError < RobotSimulationError
  end

  class InvalidOrientationError < RobotSimulationError
  end

  class NotPlacedError < RobotSimulationError
  end

end

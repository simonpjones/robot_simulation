# encoding: utf-8

require 'spec_helper'
require 'robot_simulation/table'

module RobotSimulation
  describe "Table" do
    describe "Initialised without give size" do
      it "should still have a valid max_coordinates" do
        @table = Table.new
        @table.max_coordinate.should_not be_nil
      end
    end

  end
end
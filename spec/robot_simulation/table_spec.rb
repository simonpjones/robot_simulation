# encoding: utf-8

require 'spec_helper'
require 'robot_simulation/table'

module RobotSimulation
  describe "Table" do

    describe "Initialised without given size" do

      before do
        @table = Table.new
      end

      it "should still have a valid min_coordinate" do
        @table.min_coordinate.should_not be_nil
      end

      it "should still have a valid max_coordinate" do
        @table.max_coordinate.should_not be_nil
      end

    end

  end
end
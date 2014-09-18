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
        expect(@table.min_coordinate).to_not be nil
      end

      it "should still have a valid max_coordinate" do
        expect(@table.max_coordinate).to_not be nil
      end

    end

  end
end
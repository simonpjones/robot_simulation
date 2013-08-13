# encoding: utf-8

require 'spec_helper'
require 'robot_simulation/robot'

module RobotSimulation

  describe "Robot" do

    before do
      @table = double('table')
      @table.stub(:max_coordinate).and_return(4)
      @table.stub(:min_coordinate).and_return(0)
      
      @robot = Robot.new @table
    end

    after do
      @robot = @table = nil
    end

    it "should have a table" do
      @robot.table.should_not be_nil
    end

    it "should not be placed" do
      @robot.placed?.should_not be_true
    end

    describe "Move" do
      it "should raise a not placed exception" do
        lambda { @robot.move! }.should raise_error(RobotSimulation::NotPlacedError)
      end
    end

    describe "Placed" do
      before do
        @robot.place!(0, 0, :NORTH)
      end

      it "should be replaceable" do
        @robot.place!(1,1,:SOUTH)
        @robot.report.should eq("1,1,SOUTH")
      end
    end

    describe "Placed in valid direction (NORTH)" do
      before do
        @robot.place!(0,0,:NORTH)
      end

      it "should be placed" do
        @robot.placed?.should be_true
      end

      it "should be placed at 0,0" do
        @robot.x.should eq(0)
        @robot.y.should eq(0)
      end

      it "should be facing NORTH" do
        @robot.orientation.should eq(:NORTH)
      end
    end

    describe "Placed at invalid direction" do
      it "should not be placed" do
        lambda { @robot.place!(0,0,:SOUTH_WEST) }
        @robot.placed?.should_not be_true
      end

      it "should raise invalid orientation exception" do
        lambda { @robot.place!(0,0,:SOUTH_WEST) }.should raise_error(RobotSimulation::InvalidOrientationError)
      end
    end

    describe "Placed at invalid coordinates" do
      it "should not be placed" do
        lambda { @robot.place!(-1,10,:SOUTH) }
        @robot.placed?.should_not be_true
      end

      it "should raise invalid coorindates exception" do
        lambda { @robot.place!(-1,10,:SOUTH) }.should raise_error(RobotSimulation::InvalidCoordinatesError)
      end
    end

    describe "Placed EAST" do
      before do
        @robot.place!(0,0,:EAST)
      end

      describe "Turned LEFT" do
        it "should face NORTH" do
          @robot.rotate!(:LEFT)
          @robot.report.should eq("0,0,NORTH")
        end
      end

      describe "Turned RIGHT" do
        it "should face SOUTH" do
          @robot.rotate!(:RIGHT)
          @robot.report.should eq("0,0,SOUTH")
        end
      end

      describe "Turned LEFT twice" do
        it "should face WEST" do
          @robot.rotate!(:LEFT)
          @robot.rotate!(:LEFT)
          @robot.report.should eq("0,0,WEST")
        end
      end

      describe "Turned RIGHT twice" do
        it "should face WEST" do
          @robot.rotate!(:RIGHT)
          @robot.rotate!(:RIGHT)
          @robot.report.should eq("0,0,WEST")
        end
      end

      describe "Turned LEFT thrice" do
        it "should face SOUTH" do
          @robot.rotate!(:LEFT)
          @robot.rotate!(:LEFT)
          @robot.rotate!(:LEFT)
          @robot.report.should eq("0,0,SOUTH")
        end
      end
    end


    describe "Placed 0,0 EAST" do
      before do
        @robot.place!(0,0,:EAST)
      end

      describe "Moved" do
        it "should REPORT at 1,0,EAST" do
          @robot.move!
          @robot.report.should eq("1,0,EAST")
        end
      end
    end

    describe "Placed 4,4 EAST" do
      before do
        @robot.place!(4,4,:EAST)
      end

      describe "Moved thrice" do
        it "should not move" do
          @robot.move!
          @robot.move!
          @robot.move!
          @robot.report.should eq("4,4,EAST")
        end
      end
    end
  end
end
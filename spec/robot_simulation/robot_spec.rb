# encoding: utf-8

require 'spec_helper'
require 'robot_simulation/robot'

module RobotSimulation

  describe "Robot" do

    before do
      @table = double('table')
      allow(@table).to receive(:max_coordinate).and_return(4)
      allow(@table).to receive(:min_coordinate).and_return(0)
      
      @robot = Robot.new @table
    end

    after do
      @robot = @table = nil
    end

    it "should have a table" do
      expect(@robot.table).to_not be nil
    end

    it "should not be placed" do
      expect(@robot.placed?).to_not be true
    end

    describe "Move" do
      it "should raise a not placed exception" do
        expect(lambda { @robot.move! }).to raise_error(RobotSimulation::NotPlacedError)
      end
    end

    describe "Placed" do
      before do
        @robot.place!(0, 0, :NORTH)
      end

      it "should be replaceable" do
        @robot.place!(1,1,:SOUTH)
        expect(@robot.report).to eq "1,1,SOUTH"
      end
    end

    describe "Placed in valid direction (NORTH)" do
      before do
        @robot.place!(0,0,:NORTH)
      end

      it "should be placed" do
        expect(@robot.placed?).to be true
      end

      it "should be placed at 0,0" do
        expect(@robot.x).to eq 0
        expect(@robot.y).to eq 0
      end

      it "should be facing NORTH" do
        expect(@robot.orientation).to eq :NORTH
      end
    end

    describe "Placed at invalid direction" do
      it "should not be placed" do
        lambda { @robot.place!(0,0,:SOUTH_WEST) }
        expect(@robot.placed?).to_not be true
      end

      it "should raise invalid orientation exception" do
        expect(lambda { @robot.place!(0,0,:SOUTH_WEST) }).to raise_error(RobotSimulation::InvalidOrientationError)
      end
    end

    describe "Placed at invalid coordinates" do
      it "should not be placed" do
        lambda { @robot.place!(-1,10,:SOUTH) }
        expect(@robot.placed?).to_not be true
      end

      it "should raise invalid coorindates exception" do
        expect(lambda { @robot.place!(-1,10,:SOUTH) }).to raise_error(RobotSimulation::InvalidCoordinatesError)
      end
    end

    describe "Placed EAST" do
      before do
        @robot.place!(0,0,:EAST)
      end

      describe "Turned LEFT" do
        it "should face NORTH" do
          @robot.rotate!(:LEFT)
          expect(@robot.report).to eq "0,0,NORTH"
        end
      end

      describe "Turned RIGHT" do
        it "should face SOUTH" do
          @robot.rotate!(:RIGHT)
          expect(@robot.report).to eq "0,0,SOUTH"
        end
      end

      describe "Turned LEFT twice" do
        it "should face WEST" do
          @robot.rotate!(:LEFT)
          @robot.rotate!(:LEFT)
          expect(@robot.report).to eq "0,0,WEST"
        end
      end

      describe "Turned RIGHT twice" do
        it "should face WEST" do
          @robot.rotate!(:RIGHT)
          @robot.rotate!(:RIGHT)
          expect(@robot.report).to eq "0,0,WEST"
        end
      end

      describe "Turned LEFT thrice" do
        it "should face SOUTH" do
          @robot.rotate!(:LEFT)
          @robot.rotate!(:LEFT)
          @robot.rotate!(:LEFT)
          expect(@robot.report).to eq "0,0,SOUTH"
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
          expect(@robot.report).to eq "1,0,EAST"
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
          expect(@robot.report).to eq "4,4,EAST"
        end
      end
    end
  end
end
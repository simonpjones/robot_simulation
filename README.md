# Robot Simulation
Robot Simulation is a simulator of a robot that moves along a table.

## Usage
Robot Simulation reads instructions Command Line input using REPL, executing lines one at a time until 'EXIT' command is entered.

### Valid Commands

#### PLACE X,Y,FACING

Places the robot on the table in position X,Y and facing NORTH, SOUTH, EAST or WEST.  If the robot is already placed, inputting another valid PLACE command will place the robot in the new location.

#### MOVE

Moves the toy robot one step forward in the direction it is currently facing.

#### LEFT

Rotates the robot 90 degrees to the left (i.e. counter-clockwise) without changing the position of the robot.

#### RIGHT

Rotates the robot 90 degrees to the right (i.e. clockwise) without changing the position of the robot.

#### REPORT

Reports the X,Y and FACING of the robot in the command line.

#### EXIT

Exits the REPL environment.

### Installing

Ensure you have Git, Ruby 2.0.0

    gem install bundler
    bundle install

### Running

    $ bundle exec robot_simulation
    PLACE 1,2,EAST
    MOVE
    MOVE
    LEFT
    MOVE
    REPORT
    EXIT

## Testing

    $ rake



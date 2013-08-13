# Robot Simulation
Robot Simulation is a simulator of a robot that moves along a tabletop.

## Usage
Robot Simulation reads instructions from using REPL, executing them one at a time until 'exit' is entered.

### Valid Commands

#### PLACE X,Y,FACING

Places the robot on the table in position X,Y and facing NORTH, SOUTH, EAST or WEST.  If the robot is already placed, issuing another valid PLACE command will place the robot in the newly specified location.

#### MOVE

Moves the toy robot one unit forward in the direction it is currently facing.

#### LEFT

Rotates the robot 90 degrees to the left (i.e. counter-clockwise) without changing the position of the robot.

#### RIGHT

Rotates the robot 90 degrees to the right (i.e. clockwise) without changing the position of the robot.

#### REPORT

Announces the X,Y and F of the robot.

### installing

Ensure you have Git, Ruby 2.0.0 / RVM installed.

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

## Testing

    $ rake
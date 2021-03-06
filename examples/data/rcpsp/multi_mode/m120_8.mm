************************************************************************
file with basedata            : cm120_.bas
initial value random generator: 1910131728
************************************************************************
projects                      :  1
jobs (incl. supersource/sink ):  18
horizon                       :  101
RESOURCES
  - renewable                 :  2   R
  - nonrenewable              :  2   N
  - doubly constrained        :  0   D
************************************************************************
PROJECT INFORMATION:
pronr.  #jobs rel.date duedate tardcost  MPM-Time
    1     16      0       39       12       39
************************************************************************
PRECEDENCE RELATIONS:
jobnr.    #modes  #successors   successors
   1        1          3           2   3   4
   2        1          3           6   7   9
   3        1          3           5   6  13
   4        1          3           6  10  14
   5        1          2          11  12
   6        1          3          11  16  17
   7        1          3           8  11  14
   8        1          3          13  15  16
   9        1          1          13
  10        1          2          12  15
  11        1          1          15
  12        1          1          16
  13        1          1          17
  14        1          1          17
  15        1          1          18
  16        1          1          18
  17        1          1          18
  18        1          0        
************************************************************************
REQUESTS/DURATIONS:
jobnr. mode duration  R 1  R 2  N 1  N 2
------------------------------------------------------------------------
  1      1     0       0    0    0    0
  2      1     8       4    0    0    7
  3      1     5       3    0   10    0
  4      1     4       0    7    7    0
  5      1     3       7    0    5    0
  6      1     7       0    2    0    2
  7      1     8       7    0    0    9
  8      1     7       0    6    6    0
  9      1     9       0   10    8    0
 10      1     5       5    0    5    0
 11      1     5       5    0    3    0
 12      1     5       0    8    8    0
 13      1     9       0    3    0    7
 14      1     7       0    7    3    0
 15      1     6       6    0    3    0
 16      1     6       0    2    0    5
 17      1     7       5    0    8    0
 18      1     0       0    0    0    0
************************************************************************
RESOURCEAVAILABILITIES:
  R 1  R 2  N 1  N 2
   16   23   66   30
************************************************************************

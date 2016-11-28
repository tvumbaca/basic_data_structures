# Projects: Basic Data Structures and Algorithms

From The Odin Project: http://www.theodinproject.com/courses/ruby-programming/lessons/data-structures-and-algorithms

##Project 1: Searching Binary Trees

Build a method (#build_tree) which takes an array of data and turns it into a binary tree full of Node objects appropriately placed. Then build the "crawler" function that will locate data inside of it. These would be the methods for #breadth_first_search, #depth_first_search and a recursive depth_first_search (#dfs_rec).

-------

##Project 2: Knight's Travails

Build a method (#knight_moves) that shows the simplest possible way to get from one square on a 8x8 chess board to another square by outputting all squares the knight will stop on along the way. To do this, I had to create a tree data structure to hold all the possible knight positions. Once the target position was encountered, a breadth-first-search was called on the data tree to find the target and trace back to the starting position.

*\* For me the trickiest part was figuring out that the data tree could not be binary (each node would have a bunch of child nodes, not just a left or right child node). At that point having to work with an array of child nodes (@children) was the challenge.*

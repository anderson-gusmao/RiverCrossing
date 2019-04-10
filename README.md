# River Crossing Solver
## Missionaries and cannibals problem

[![Build Status](https://travis-ci.org/anderson-gusmao/RiverCrossing.svg?branch=master)](https://travis-ci.org/anderson-gusmao/RiverCrossing)

The missionaries and cannibals problem, and the closely related jealous husbands problem, are classic river-crossing problems. The missionaries and cannibals problem is a well-known toy problem in artificial intelligence, where it was used by Saul Amarel as an example of problem representation.

### The problem

In the missionaries and cannibals problem, three missionaries and three cannibals must cross a river using a boat which can carry at most two people, under the constraint that, for both banks, if there are missionaries present on the bank, they cannot be outnumbered by cannibals (if they were, the cannibals would eat the missionaries). The boat cannot cross the river by itself with no people on board. And, in some variations, one of the cannibals has only one arm and cannot row.
In the jealous husbands problem, the missionaries and cannibals become three married heterosexual couples, with the constraint that no woman can be in the presence of another man unless her husband is also present. Under this constraint, there cannot be both women and men present on a bank with women outnumbering men, since if there were, these women would be without their husbands. Therefore, upon changing men to missionaries and women to cannibals, any solution to the jealous husbands problem will also become a solution to the missionaries and cannibals problem.

### Solving

A system for solving the Missionaries and Cannibals problem whereby the current state is represented by a simple vector ⟨m, c, b⟩. The vector's elements represent the number of missionaries, cannibals, and boats on the wrong side, respectively. Since the boat and all of the missionaries and cannibals start on the wrong side, the vector is initialized to ⟨3,3,1⟩. Actions are represented using vector subtraction/addition to manipulate the state vector. For instance, if a lone cannibal crossed the river, the vector ⟨0,1,1⟩ would be subtracted from the state to yield ⟨3,2,0⟩. The state would reflect that there are still three missionaries and two cannibals on the wrong side, and that the boat is now on the opposite bank. To fully solve the problem, a simple tree is formed with the initial state as the root. The five possible actions (⟨1,0,1⟩, ⟨2,0,1⟩, ⟨0,1,1⟩, ⟨0,2,1⟩, and ⟨1,1,1⟩) are then subtracted from the initial state, with the result forming children nodes of the root. Any node that has more cannibals than missionaries on either bank is in an invalid state, and is therefore removed from further consideration. The valid children nodes generated would be ⟨3,2,0⟩, ⟨3,1,0⟩, and ⟨2,2,0⟩. For each of these remaining nodes, children nodes are generated by adding each of the possible action vectors. The algorithm continues alternating subtraction and addition for each level of the tree until a node is generated with the vector ⟨0,0,0⟩ as its value. This is the goal state, and the path from the root of the tree to this node represents a sequence of actions that solves the problem.

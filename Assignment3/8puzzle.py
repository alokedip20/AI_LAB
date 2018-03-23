class node:
	def __init__(self, state,parent,move,depth):
		self.state = state	
		self.parent = parent
		self.move = move
		self.depth = depth

def create_node(state,parent,move,depth):
	return node(state,parent,move,depth)

def generate_children(node):
	children = []
	children.append(create_node(tile_up(node.state),node,'up',node.depth + 1))
	children.append(create_node(tile_down(node.state),node,'down',node.depth + 1))
	children.append(create_node(tile_left(node.state),node,'left',node.depth + 1))
	children.append(create_node(tile_right(node.state),node,'right',node.depth + 1))
	children = [child for child in children if child.state != None]
	return children

def tile_up(state):
	modified_state = state[:]
	index = modified_state.index(0)
	if index not in [0,1,2]:
		temp = modified_state[index -3]
		modified_state[index - 3] = modified_state[index]
		modified_state[index] = temp
		return modified_state
	return None

def tile_down(state):
	modified_state = state[:]
	index = modified_state.index(0)
	if index not in [6,7,8]:
		temp = modified_state[index + 3]
		modified_state[index + 3] = modified_state[index]
		modified_state[index] = temp
		return modified_state
	return None
		
def tile_left(state):
	modified_state = state[:]
	index = modified_state.index(0)
	if index not in [0,3,6]:
		temp = modified_state[index - 1]
		modified_state[index - 1] = modified_state[index]
		modified_state[index] = temp
		return modified_state
	return None

def tile_right(state):
	modified_state = state[:]
	index = modified_state.index(0)
	if index not in [2,5,8]:
		temp = modified_state[index + 1]
		modified_state[index + 1] = modified_state[index]
		modified_state[index] = temp
		return modified_state
	return None

def dfs(start,goal,limit = 10):
	node_list = []
	node_list.append(create_node(start,None,None,1))
	while True:
		if len(node_list) == 0:
			return None
		node = node_list.pop(0)
		if node.state == goal:
			temp = node
			moves = []
			while True:
				if temp.depth == 1:
					break
				else:
					moves.insert(0,temp.move)
					temp = temp.parent
			return moves
		else:
			if node.depth < limit :
				gen_children = generate_children(node)
				gen_children.extend(node_list)
				node_list = gen_children

def bfs(start,goal):
	node_list = []
	node_list.append(create_node(start,None,None,1))
	while True:
		if len(node_list) == 0:
			return None
		else:
			node = node_list.pop(0)
			if node.state == goal:
				temp = node
				moves = []
				while True:
					if temp.depth == 1:
						break
					else:
						moves.insert(0,temp.move)
						temp = temp.parent
				return moves
			node_list.extend(generate_children(node))

def iterative_deepening(start,goal):
	level = 1
	while True:
		Moves = dfs(start,goal,level)
		if Moves == None:
			level += 1
		else:
			return Moves


def main():
	goal_state = [1,2,3,8,0,4,7,6,5]
	initial_state = [1,2,3,8,6,7,0,5,4]
	Moves = dfs(initial_state,goal_state,20)
	if Moves == None:
		print ('No path found')
	else:
		print ('Goal node has been found')
		print (Moves)

if __name__ == '__main__':
	main()
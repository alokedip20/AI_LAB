import sys
goal_state = [1,2,3,8,0,4,7,6,5]
class node:
	def __init__(self, state,parent,move,depth,h_val,node_cost):
		self.state = state	
		self.parent = parent
		self.move = move
		self.depth = depth
		self.heuristic_value = h_val
		self.cost = node_cost

def create_node(state,parent,move,depth,h_val = 0,node_cost = 0):
	return node(state,parent,move,depth,h_val,node_cost)

def generate_children(node,open_list,close_list):
	children = []
	children.append(create_node(tile_up(node.state),node,'up',node.depth + 1,heuristic(tile_up(node.state),goal_state)))
	children.append(create_node(tile_down(node.state),node,'down',node.depth + 1,heuristic(tile_down(node.state),goal_state)))
	children.append(create_node(tile_left(node.state),node,'left',node.depth + 1,heuristic(tile_left(node.state),goal_state)))
	children.append(create_node(tile_right(node.state),node,'right',node.depth + 1,heuristic(tile_right(node.state),goal_state)))
	children = [child for child in children if child.state != None]
	#children = [child for child in children if child.state not in open_list]
	#children = [child for child in children if child.state not in close_list]
	children = [child for child in children if not member_o(child,open_list)]
	children = [child for child in children if not member_c(child,close_list)]
	return children

def member_o(i,open_list):
	for index,elem in enumerate(open_list):
		if i.state == elem.state:
			print (str(index)+' element is in open list : '+str(i.state))
			return True
	return False

def member_c(i,close_list,flag = 0):
	for index,elem in enumerate(close_list):
		if i.state == elem.state:
			if not flag:
				print (str(index)+' element is in close list : '+str(i.state))
			return True
	return False	

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

def display(Node):
	s = Node.state
	print('------------------- H = '+ str(Node.heuristic_value) + ' ----------------------------')
	print(str(s[0]) + "\t" + str(s[1]) + "\t" + str(s[2]))
	print(str(s[3]) + "\t" + str(s[4]) + "\t" + str(s[5]))
	print(str(s[6]) + "\t" + str(s[7]) + "\t" + str(s[8]))

def dfs(start,goal,limit = 20):
	open_list = []
	close_list = []
	open_list.append(create_node(start,None,None,1))
	while True:
		if len(open_list) == 0:
			return None
		node = open_list.pop(0)
		if not member_c(node,close_list):
			close_list.append(node)
		if node.state == goal:
			temp = node
			moves = []
			while True:
				if temp.depth == 1:
					break
				else:
					#display(temp)
					moves.insert(0,temp.move)
					temp = temp.parent
			return moves
		else:
			if node.depth < limit :
				gen_children = generate_children(node,open_list,close_list)
				gen_children.extend(open_list)
				open_list = gen_children

def bfs(start,goal):
	open_list = []
	close_list = []
	open_list.append(create_node(start,None,None,1))
	while True:
		if len(open_list) == 0:
			return None
		else:
			node = open_list.pop(0)
			if not member_c(node,close_list):
				close_list.append(node)
			if node.state == goal:
				temp = node
				moves = []
				while True:
					if temp.depth == 1:
						break
					else:
						#display(temp)
						moves.insert(0,temp.move)
						temp = temp.parent
				return moves
			open_list.extend(generate_children(node,open_list,close_list))

def iterative_deepening(start,goal,limit = 20):
	level = 1
	while True:
		Moves = dfs(start,goal,level)
		if Moves == None:
			level += 1
			if level > limit:
				return None
		else:
			return Moves

def hill_climbing(start,goal,limit = 40):
	open_list = []
	close_list = []
	open_list.append(create_node(start,None,None,1))
	while True:
		if len(open_list) == 0:
			return None
		node = open_list.pop(0)
		if not member_c(node,close_list):
				close_list.append(node)
		if node.state == goal:
			temp = node
			moves = []
			while True:
				if temp.depth == 1:
					break
				else:
					#display(temp)
					moves.insert(0,temp.move)
					temp = temp.parent
			return moves
		if node.depth < limit:
			gen_children = generate_children(node,open_list,close_list)
			gen_children.sort(custom_cmp)
			gen_children.extend(open_list)
			open_list = gen_children

def best_first(start,goal):
	open_list = []
	close_list = []
	open_list.append(create_node(start,None,None,1))
	while True:
		if len(open_list) == 0:
			return None
		node = open_list.pop(0)
		if not member_c(node,close_list):
				close_list.append(node)
		if node.state == goal:
			temp = node
			moves = []
			while True:
				if temp.depth == 1:
					break
				else:
					#display(temp)
					moves.insert(0,temp.move)
					temp = temp.parent
			return moves
		gen_children = generate_children(node,open_list,close_list)
		open_list.extend(gen_children)
		open_list.sort(custom_cmp)
		
def heuristic(state,goal):
	distance = 0
	try:
		for i in range(9):
			if state[i] != goal[i] and state[i] != 0 and goal[i] != 0 :
				distance += 1
		return distance
	except: 
		return 0

def custom_cmp(i,j):
	return (i.heuristic_value - j.heuristic_value)

def index_pos(index):
	return (int(index / 3) , index % 3)

def main():
	initial_state = [int(a) for a in raw_input('Give the initial state: ').split()] 
	algorithms = ['dfs','bfs','iterative_deepening','hill_climbing','best_first']
	for al in algorithms:
		algorithm = eval(al)
		Moves = algorithm(initial_state,goal_state)
		if Moves == None:
			print ('No path found')
		else:
			print ('Goal node has been found by '+ al)
			print (Moves)
		raw_input('press any key to run next algorithm')

if __name__ == '__main__':
	main()
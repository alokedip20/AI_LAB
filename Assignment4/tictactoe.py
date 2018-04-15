human , computer = 'o','x'
computer_win , human_win = 20,-20
def board_full(board):
	for cell in board:
		if cell == '_':
			return False
	return True

def evaluation_board_state(board):
	for i in [0,3,6]:
		if ((board[i] == board[i+1]) and (board[i+1] == board[i+2])):
			if board[i] == human:
				return human_win
			elif board[i] == computer:
				return computer_win

	for i in [0,1,2]:
		if ((board[i] == board[i+3]) and (board[i+3] == board[i+6])):
			if board[i] == human:
				return human_win
			elif board[i] == computer:
				return computer_win

	if board[0] == board[4] and board[4] == board[8]:
		if board[0] == human:
			return human_win
		elif board[0] == computer:
			return computer_win

	if board[2] == board[4] and board[4] == board[6]:
		if board[2] == human:
			return human_win
		elif board[2] == computer:
			return computer_win

	return 0

def minimax(board,depth,ismax):
	score = evaluation_board_state(board)
	if score == computer_win or score == human_win:
		return score

	if board_full(board):
		return 0

	if ismax:
		best = -9999
		for i in range(9):
			if board[i] == '_':
				board[i] = computer
				best = max(best,minimax(board,depth + 1,not ismax))
				board[i] = '_'
		return best

	else:
		best = 9999
		for i in range(9):
			if board[i] == '_':
				board[i] = human
				best = min(best,minimax(board,depth + 1,not ismax))
				board[i] = '_'
		return best

def best_move(board):
	best_val = -9999
	optimum_cell = -1
	for i in range(9):
		if board[i] == '_':
			board[i] = computer
			move_val = minimax(board,0,False)
			board[i] = '_'
			if move_val > best_val:
				optimum_cell = i
				best_val = move_val
	print ("Best Val: "+str(best_val))
	return optimum_cell,best_val

def initialise_board():
	return ['_'] * 9

def valid_move(board,index):
	return board[index] == '_'

def display_board(board):
	print (board[0] + '\t' + board[1] + '\t' + board[2])
	print (board[3] + '\t' + board[4] + '\t' + board[5])
	print (board[6] + '\t' + board[7] + '\t' + board[8])

def main():
	board = initialise_board()
	while True:
		human_move = int(raw_input('Give index in between 0 - 9 : \n'))
		if valid_move(board,human_move):
			print ('Valid move')
			board[human_move] = human
			if board_full(board):
				print ('Draw match ... (')
				display_board(board)
				return 0
			opt_cell,score = best_move(board)
			print ('Computer chooses cell : '+str(opt_cell))
			board[opt_cell] = computer
			if score == computer_win:
				print('Computer wins')
				display_board(board)
				return 0
			elif score == human_win:
				print ('Human wins')
				display_board(board)
				return 0
			else:
				display_board(board)
		else:
			print ('Not a valid move')

if __name__ == '__main__':
	main()

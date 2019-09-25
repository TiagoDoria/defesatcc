import socket


def Main():
	# endereço do cliente
	host = '192.168.1.10'
	

	# porta para conexão
	port = 12341
	s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

	# criar conexão socket
	s.connect((host, port))

	while True:
     
		print ("Operações: ")
		print ("0 - Abrir conta")
		print ("1 - Saldo")
		print ("2 - Saque")
		print ("3 - Depósito")
		opcao = input()
		#s.send(opcao.encode('ascii'))
		if opcao == '0':
			rg = input("Digite seu RG: \n")
			nome = input("Digite seu nome: \n")
			data = opcao + '\n' + rg + '\n' + nome
			s.send(data.encode('ascii'))
			data = s.recv(1024)
			print(str(data.decode('ascii')))
   
		if opcao == '1':
			data = opcao + '\n'
			s.send(data.encode('ascii'))
			data = s.recv(1024)
			print("Saldo: ", str(data.decode('ascii')))
   
		if opcao == '2':
			saque = input("Digite valor para sacar:\n")
			data = opcao + '\n' + saque
			s.send(data.encode('ascii'))

		if opcao == '3':
			deposito = input("Digite valor para depositar:\n")
			data = opcao + '\n' + deposito
			s.send(data.encode('ascii'))

		 
		# deseja realizar outra operação? 
		ans = input('\nDeseja realizar uma nova operação?(s/n) :') 
		if ans == 's': 
			continue
		else: 
			break
	# fechar conexão 
	s.close() 

if __name__ == '__main__': 
	Main() 

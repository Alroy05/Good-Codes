import socket

try:
  sock = socket.socket(socket.AF_INET,socket.SOCK_STREAM)

  servaddr = ('localhost',1668)

  sock.connect(servaddr)
  print('Connection Established!')

  while True:

    message = input('Enter a message\n')
    sock.send(message.encode('utf-8'))

    if message == 'exit':
      break

    str = sock.recv(100).decode('utf-8')
    print(f'Message Received:\n {str}')

    if str == 'exit':
      break

  sock.close()

except Exception as e:
  print(f'Connection Failed: {e}')
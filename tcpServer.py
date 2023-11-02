import socket

try:
    
    sock = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
    print('Socket Created')
    print(f'Socket No.={sock.fileno()}')

    servadr = ('localhost',1668)

    sock.bind(servadr)
    print('Binding Successfull!')

    sock.listen(2)
    print('Socket is listening for incoming request')

    com_s,clint_adr = sock.accept()
    print("Connection established")

    while True:
        str = com_s.recv(100).decode('utf-8')

        if str == 'exit':
            break

        print(f'Message Received: {str}')

        message = input('Enter a Message..')
        com_s.send(message.encode('utf-8'))

        if message == 'exit':
            break

    sock.close()

except Exception as e:
    print(f"Connection Failed: {e}")
  
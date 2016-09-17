echo f | xcopy /f /y "src/socket.io-client-cpp/src/sio_client.h" "Output/SocketIO/Include/sio_client.h"
echo f | xcopy /f /y "src/socket.io-client-cpp/src/sio_message.h" "Output/SocketIO/Include/sio_message.h"
echo f | xcopy /f /y "src/socket.io-client-cpp/src/sio_socket.h" "Output/SocketIO/Include/sio_socket.h"

echo f | xcopy /f /y "src/socket.io-client-cpp/src/internal/sio_packet.h" "Output/SocketIO/Include/internal/sio_packet.h"
echo f | xcopy /f /y "src/socket.io-client-cpp/src/internal/sio_client_impl.h" "Output/SocketIO/Include/internal/sio_client_impl.h"
pause

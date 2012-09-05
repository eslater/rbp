require "socket"
class Client
  def initialize(ip="127.0.0.1", port=3333)
    @ip, @port = ip, port
  end

  def send_message(msg)
    connection do |socket|
      socket.puts(msg)
      socket.gets
    end
  end

  def receive_message
    connection { |socket| socket.gets }
  end

  private
  def connection
    socket = TCPSocket.new(@ip, @port)
    yield(socket)
  ensure
    socket.close
  end
end

class Server
  def initialize(port=3333)
    @server   = TCPServer.new('127.0.0.1', port)
    @handlers = {}
  end

  def handle(pattern, &block)
    @handlers[pattern] = block
  end

  def run
    while session = @server.accept
      msg   = session.gets
      match = nil
      @handlers.each do |pattern, block|
        if match = msg.match(pattern)
          break session.puts(block.call(match))
        end
      end
      unless match
        session.puts "Server received unknown message: #{msg}"
      end
    end
  end

  def self.run(port=3333, &block)
    server = Server.new(port)
    server.instance_eval(&block)
    server.run
  end
end

if __FILE__ == $PROGRAM_NAME
  Server.run do
    handle(/hello/i) { "Hello from server at #{Time.now}" }
    handle(/goodbye/i) { "Goodbye from server at #{Time.now}" }
    handle(/name is (\w+)/) { |m| "Nice to meet you #{m[1]}!" }
  end

  client = Client.new
  ["Hello", "My name is Greg", "Goodbye"].each do |msg|
    response = client.send_message(msg)
    puts response
  end
end
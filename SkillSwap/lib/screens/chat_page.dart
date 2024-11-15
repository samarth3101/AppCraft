import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ChatPage extends StatefulWidget {
  final String groupName;

  const ChatPage({super.key, required this.groupName});

  @override
  ChatPageState createState() => ChatPageState();
}

class ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Message> _messages = [];
  File? _image;
  String? _pollQuestion;

  // Simulate message sending after a short delay
  void _sendMessage(String text) {
    if (text.isNotEmpty || _image != null) {
      setState(() {
        _messages.add(Message(
          sender: 'You',
          text: text,
          sentTime: DateTime.now(),
          image: _image, // Include image if available
          isPoll: false,
        ));
      });

      // Simulate other user response after delay
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _messages.add(Message(
            sender: 'Other User',
            text: 'Got it, let me check on that!',
            sentTime: DateTime.now(),
            isPoll: false,
          ));
        });
      });
    }
  }

  // Open File Picker for selecting media
  Future<void> _pickImage() async {
    final picker = ImagePicker();  // Renamed to 'picker'
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // Polling functionality
  void _startPoll(String question) {
    setState(() {
      _pollQuestion = question;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat in ${widget.groupName}'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          // Chat messages area
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return MessageBubble(
                  message: message,
                );
              },
            ),
          ),

          const Divider(),
          
          // Polling section if active
          if (_pollQuestion != null) ...[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    _pollQuestion!,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(onPressed: () {}, child: const Text('Yes')),
                      ElevatedButton(onPressed: () {}, child: const Text('No')),
                    ],
                  ),
                ],
              ),
            ),
          ],

          // Input field and buttons for attachments
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                // Attach File Icon
                IconButton(
                  icon: const Icon(Icons.attach_file),
                  onPressed: _pickImage, // Attach file functionality
                ),
                // Poll Icon
                IconButton(
                  icon: const Icon(Icons.poll),
                  onPressed: () => _startPoll('What time should we meet?'), // Start a poll
                ),
                // Input Text Field
                Expanded(
                  child: TextField(
                    controller: _controller,
                    maxLines: null,
                    decoration: const InputDecoration(
                      hintText: 'Type your message...',
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                // Send Button
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    _sendMessage(_controller.text);
                    _controller.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final String sender;
  final String text;
  final DateTime sentTime;
  final bool isPoll;
  final File? image;

  Message({
    required this.sender,
    required this.text,
    required this.sentTime,
    this.isPoll = false,
    this.image,
  });
}

class MessageBubble extends StatelessWidget {
  final Message message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isUserMessage = message.sender == 'You';
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Align(
        alignment: isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: isUserMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            // Display image if attached
            if (message.image != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Image.file(
                  message.image!,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            // Display message text
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isUserMessage ? Colors.blueAccent : Colors.grey[300],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                message.text,
                style: TextStyle(
                  color: isUserMessage ? Colors.white : Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 5),
            // Display timestamp
            Text(
              '${message.sentTime.hour}:${message.sentTime.minute}',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
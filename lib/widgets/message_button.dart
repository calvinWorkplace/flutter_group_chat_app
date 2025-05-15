import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble.first({
    super.key,
    required this.username,
    required this.message,
    required this.isMe,
  }) : isFirstInSequence = true;

  const MessageBubble.next({
    super.key,
    required this.message,
    required this.isMe,
  })  : isFirstInSequence = false,
        username = null;

  final bool isFirstInSequence;
  final String? username;
  final String message;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          if (isFirstInSequence && username != null)
            Row(
              mainAxisAlignment:
                  isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
              children: [
                if (!isMe) ...[
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: theme.colorScheme.primary.withAlpha(180),
                    child: const Icon(Icons.person,
                        size: 20, color: Colors.white),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    username!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ] else ...[
                  Text(
                    username!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(width: 8),
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: theme.colorScheme.primary.withAlpha(180),
                    child: const Icon(Icons.person,
                        size: 20, color: Colors.white),
                  ),
                ]
              ],
            ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment:
                isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    color: isMe
                        ? Colors.grey[300]
                        : theme.colorScheme.secondary.withAlpha(200),
                    borderRadius: BorderRadius.only(
                      topLeft: !isMe && isFirstInSequence
                          ? Radius.zero
                          : const Radius.circular(12),
                      topRight: isMe && isFirstInSequence
                          ? Radius.zero
                          : const Radius.circular(12),
                      bottomLeft: const Radius.circular(12),
                      bottomRight: const Radius.circular(12),
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                  child: Text(
                    message,
                    style: TextStyle(
                      height: 1.3,
                      color: isMe
                          ? Colors.black87
                          : theme.colorScheme.onSecondary,
                    ),
                    softWrap: true,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

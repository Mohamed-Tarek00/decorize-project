import 'package:flutter/material.dart';

class SnackBarHelper {
  static void showFailure(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: FailureWidget(message: message),
        backgroundColor: Colors.redAccent,
        duration: duration,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

class FailureWidget extends StatelessWidget {
  final String message;

  const FailureWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text("❌", style: TextStyle(fontSize: 20)),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            message,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

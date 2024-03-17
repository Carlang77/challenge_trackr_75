import 'package:flutter/material.dart';

class StatsPage extends StatelessWidget {
  // Example progress value. This could be dynamically calculated.
  final double progress = 0.75; // 75%

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200, // Size of the circular progress indicator
        height: 200, // Size of the circular progress indicator
        child: Stack(
          fit: StackFit.expand,
          children: [
            CircularProgressIndicator(
              value: progress, // Current progress
              strokeWidth: 12, // Width of the progress indicator
              backgroundColor:
                  Colors.grey[300], // Color of the unfilled portion
              color: Colors.blue, // Color of the filled portion
            ),
            Center(
              child: Text(
                '${(progress * 100).toInt()}%', // Display the percentage in the center
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

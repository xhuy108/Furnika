import 'package:flutter/material.dart';

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Main ticket area
    path.addRRect(RRect.fromLTRBAndCorners(
      0,
      0,
      size.width - size.width / 5, // Reduce width to fit the right section
      size.height,
      topLeft: Radius.circular(8),
      bottomLeft: Radius.circular(8),
    ));

    // Right-side section with holes
    final rightSectionWidth = size.width / 5;

    // Add path for the right section (matches background rounded corners)
    path.addRRect(RRect.fromLTRBAndCorners(
      size.width - rightSectionWidth, // Start from the right
      0,
      size.width,
      size.height,
      topRight: Radius.circular(8),
      bottomRight: Radius.circular(8),
    ));

    // Define hole characteristics
    final holeWidth = rightSectionWidth / 10; // Adjust for desired hole size
    final holeSpacing = holeWidth;

    // Start position for holes
    final holeStartIndex = size.width - (holeWidth * 10) - (holeSpacing * 9);

    // Create the holes
    for (var i = 0; i < 10; i++) {
      final holeRect = Rect.fromLTWH(
        holeStartIndex + (i * (holeWidth + holeSpacing)),
        size.height / 2 - holeWidth / 2,
        holeWidth,
        holeWidth,
      );
      path.addRRect(
          RRect.fromRectAndRadius(holeRect, Radius.circular(holeWidth / 2)));
    }

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

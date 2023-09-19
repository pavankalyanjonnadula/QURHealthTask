import 'package:flutter/material.dart';

class MyImageWidget extends StatelessWidget {
  final String imageUrl; // Your image URL
  const MyImageWidget(
      {super.key, required this.imageUrl}); // Constructor to receive imageUrl

  final placeholderImage =
      const AssetImage('lib/assets/placeholder.png'); // Your placeholder image

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      placeholder: placeholderImage,
      image: NetworkImage(imageUrl),
      fit: BoxFit.cover,
      imageErrorBuilder: (context, error, stackTrace) {
        return Image(image: placeholderImage);
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecommendedCard extends StatelessWidget {
  final String price;
  final String title;
  final String subtitle;
  final int rating;
  final String image;

  RecommendedCard({
    required this.price,
    required this.title,
    required this.subtitle,
    required this.rating,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 450,
        width: 240,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 130,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              "$price / Night",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              title,
              style: GoogleFonts.poppins(fontSize: 16),
            ),
            SizedBox(height: 4),
            Text(
              subtitle,
              style: GoogleFonts.poppins(color: Colors.grey),
            ),
            SizedBox(height: 10),
            Row(
              children: List.generate(
                rating,
                    (index) => Icon(
                  Icons.star,
                  color: Colors.orange,
                  size: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
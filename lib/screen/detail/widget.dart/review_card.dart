import 'package:flutter/material.dart';
import 'package:slurp_restaurant_app/utils/theme/theme_extensions.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
    required this.backgroundCard,
    required this.backgroundError,
    required this.name,
    required this.review,
    required this.date,
    required this.textColor,
    required this.textSecond,
  });

  final Color backgroundCard;
  final Color backgroundError;
  final String name;
  final String review;
  final String date;
  final Color textColor;
  final Color textSecond;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundCard,
      elevation: 4,
      shadowColor: Colors.black38,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: backgroundError,
              radius: 24,
              child: Icon(Icons.person),
            ),
            const SizedBox.square(dimension: 12.0),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          name,
                          style: context.text.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w900,
                            color: textColor,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox.square(dimension: 10),
                      Text(
                        date,
                        style: context.text.labelSmall?.copyWith(
                          color: textSecond,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox.square(dimension: 12),
                  Text(
                    review,
                    style: context.text.bodySmall?.copyWith(color: textSecond),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

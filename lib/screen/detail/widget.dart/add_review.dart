import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slurp_restaurant_app/provider/detail/restaurant_detail_provider.dart';
import 'package:slurp_restaurant_app/screen/detail/widget.dart/custom_snackbar.dart';

class AddReviewDialog extends StatefulWidget {
  final String restaurantId;
  const AddReviewDialog({super.key, required this.restaurantId});

  @override
  State<AddReviewDialog> createState() => _AddReviewDialogState();
}

class _AddReviewDialogState extends State<AddReviewDialog> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _reviewController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isLoading = context
        .watch<RestaurantDetailProvider>()
        .isReviewSubmitting;

    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Add Review', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 20),

            // Name
            TextField(
              controller: _nameController,
              enabled: !isLoading,
              decoration: const InputDecoration(
                hintText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            // Review
            TextField(
              controller: _reviewController,
              enabled: !isLoading,
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: 'Add your review...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Cancel button
                TextButton(
                  onPressed: isLoading ? null : () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                const SizedBox(width: 8),

                // Submit button
                FilledButton(
                  onPressed: isLoading
                      ? null
                      : () async {
                          final name = _nameController.text.trim();
                          final review = _reviewController.text.trim();

                          if (name.isEmpty || review.isEmpty) {
                            CustomSnackBar.show(
                              context,
                              isSuccess: false,
                              message: 'Name and review cannot be empty',
                            );
                            return;
                          }

                          try {
                            final isSuccess = await context
                                .read<RestaurantDetailProvider>()
                                .submitReview(
                                  widget.restaurantId,
                                  name,
                                  review,
                                );

                            if (!context.mounted) return;
                            Navigator.pop(context);

                            if (isSuccess) {
                              CustomSnackBar.show(
                                context,
                                isSuccess: true,
                                message: 'Review submitted successfully',
                              );
                            } else {
                              CustomSnackBar.show(
                                context,
                                isSuccess: false,
                                message:
                                    'Failed to submit review, please try again',
                              );
                            }
                          } catch (e) {
                            if (!context.mounted) return;

                            CustomSnackBar.show(
                              context,
                              isSuccess: false,
                              message:
                                  'Failed to submit review, check your internet',
                            );
                          }
                        },
                  child: isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Text('Submit'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

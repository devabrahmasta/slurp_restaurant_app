import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slurp_restaurant_app/provider/detail/restaurant_detail_provider.dart';

class AddReviewDialog extends StatefulWidget {
  final String restaurantId;
  const AddReviewDialog({super.key, required this.restaurantId});

  @override
  State<AddReviewDialog> createState() => _AddReviewDialogState();
}

class _AddReviewDialogState extends State<AddReviewDialog> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _reviewController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Add Review', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 20),

            // Nama
            TextField(
              controller: _nameController,
              enabled: !_isLoading,
              decoration: const InputDecoration(
                hintText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            // Review
            TextField(
              controller: _reviewController,
              enabled: !_isLoading,
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
                TextButton(
                  onPressed: _isLoading ? null : () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                const SizedBox(width: 8),

                FilledButton(
                  onPressed: _isLoading
                      ? null
                      : () async {
                          final name = _nameController.text;
                          final review = _reviewController.text;

                          if (name.trim().isEmpty || review.trim().isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Nama dan ulasan tidak boleh kosong!',
                                  style: Theme.of(context).textTheme.bodyMedium
                                      ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                backgroundColor: Theme.of(
                                  context,
                                ).colorScheme.errorContainer,
                              ),
                            );
                            return;
                          }

                          setState(() {
                            _isLoading = true;
                          });

                          try {
                            final isSuccess = await context
                                .read<RestaurantDetailProvider>()
                                .submitReview(
                                  widget.restaurantId,
                                  name,
                                  review,
                                );

                            if (mounted) {
                              Navigator.pop(context);

                              if (isSuccess) {
                                SnakBarCustom(context, true);
                              }
                            }
                          } catch (e) {
                            if (mounted) {
                              setState(() {
                                _isLoading = false;
                              });
                              SnakBarCustom(context, false);
                            }
                          }
                        },
                  child: _isLoading
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

  void SnakBarCustom(BuildContext context, bool isSend) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(bottom: 24, left: 24, right: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: isSend
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.errorContainer,
        elevation: 6,
        content: Row(
          children: [
            Icon(
              isSend ? Icons.check_circle_rounded : Icons.error_outline_rounded,
              color: Colors.white,
              size: 24,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                isSend ? 'Review berhasil dikirim' : 'Gagal mengirim review',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}

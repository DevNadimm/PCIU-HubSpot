import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pciu_hubspot/core/constants/reviews_data.dart';
import 'package:pciu_hubspot/features/more/screens/write_review_screen.dart';
import 'package:pciu_hubspot/features/more/widgets/review_card.dart';

class UserReviewsScreen extends StatelessWidget {
  const UserReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reviews',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
        forceMaterialTransparency: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.5),
          child: Container(
            color: Colors.grey.withOpacity(0.2),
            height: 1.5,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: reviews.length,
                      itemBuilder: (context, index) {
                        final review = reviews[index];
                        return ReviewCard(
                          imgUrl: review['imgUrl']!,
                          name: review['name']!,
                          rating: review['rating']!,
                          time: review['time']!,
                          review: review['review']!,
                        );
                      },
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ),
          Divider(
            thickness: 1.5,
            height: 1.5,
            color: Colors.grey.withOpacity(0.2),
          ),
          const SizedBox(height: 16),
          _buildWriteReviewButton(context),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildWriteReviewButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            Get.to(const WriteReviewScreen());
          },
          child: const Text('Write Review'),
        ),
      ),
    );
  }
}

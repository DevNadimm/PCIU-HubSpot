import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pciu_hubspot/controller/more_controller/review_controller.dart';
import 'package:pciu_hubspot/core/utils/progress_indicator.dart';
import 'package:pciu_hubspot/core/utils/snackbar_message.dart';
import 'package:pciu_hubspot/features/more/screens/write_review_screen.dart';
import 'package:pciu_hubspot/features/more/widgets/review_card.dart';

class UserReviewsScreen extends StatefulWidget {
  const UserReviewsScreen({super.key});

  @override
  State<UserReviewsScreen> createState() => _UserReviewsScreenState();
}

class _UserReviewsScreenState extends State<UserReviewsScreen> {
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() async {
    final controller = ReviewController.instance;
    final result = await controller.getReviews();
    if (!result) {
      SnackBarMessage.errorMessage(controller.errorMessage!);
    }
  }

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
              child: GetBuilder<ReviewController>(builder: (controller) {
                return Visibility(
                  visible: !controller.inProgress,
                  replacement: const ProgressIndicatorWidget(),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 8),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.reviewList?.length ?? 0,
                          itemBuilder: (context, index) {
                            final review = controller.reviewList![index];
                            return ReviewCard(
                              name: review.name ?? 'N/A',
                              rating: review.rating ?? 0,
                              time: review.createdAt ?? 'N/A',
                              review: review.review ?? 'N/A',
                            );
                          },
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                );
              }),
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

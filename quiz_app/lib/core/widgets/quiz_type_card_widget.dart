import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/core/views/play_quiz_view.dart';
import 'package:quiz_app/res/colors.dart';
import 'package:quiz_app/utils/use_full_functions.dart';

class QuizTypeCardWidget extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String desc;
  final String quizId;

  const QuizTypeCardWidget({
    Key? key,
    required this.quizId,
    required this.imgUrl,
    required this.title,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, PlayQuizView.routeName, arguments: quizId);
      },
      child: Container(
        width: getDeviceWidth(context),
        margin: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
        child: Stack(
          children: [
            // Image with reduced opacity
            Opacity(
              opacity: 0.76, // Adjust opacity as needed
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: imgUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Container to overlay the image and contain text
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Colors.black26,
              ),
              // Align text to bottom left
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      desc,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:quiz_app/models/questions_with_answers.dart';
import 'package:quiz_app/utils/app_colors.dart';

class CongratsWidgets extends StatelessWidget {
  final int score;
  final VoidCallback onTap;
  const CongratsWidgets({super.key, required this.score, required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/passed_badge.jpg',
          
        ),
        const Text(
          'Congratulations!',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Your score: $score/${questionsWithAnswers.length}',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.blueGrey,
          foregroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text('Reset Quiz'),
      ),
    ),
        // DecoratedBox(
        //   decoration: BoxDecoration(
            
        //     color: AppColors.green,
        //     borderRadius: BorderRadius.circular(8),
        //     border: Border.all(
        //       color: AppColors.grey.withOpacity(0.3),
        //     ),
        //   ),
        //   child: TextButton(
        //     onPressed: onTap,
        //     child: const Text('Reset Quiz', 
        //                   style: TextStyle(color:AppColors.white,) ),
        //   ),
        // ),
      ],
    );
  }
}

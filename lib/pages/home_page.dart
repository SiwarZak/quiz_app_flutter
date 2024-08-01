import 'package:flutter/material.dart';
import 'package:quiz_app/models/questions_with_answers.dart';
import 'package:quiz_app/utils/app_colors.dart';
import 'package:quiz_app/widgets/answer_widget_item.dart';
import 'package:quiz_app/widgets/congrats_widgets.dart';
import 'package:quiz_app/widgets/main_button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int questionIndex = 0;
  bool isFinished = false;
  int score = 0;
  String? selectedAnswer;
  bool answerSelected = false;
  bool showAnswer = false;
  String correctAns='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: !isFinished
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Text(
                        questionsWithAnswers[questionIndex].question,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Answer and get points!',
                        style: TextStyle(
                          fontSize: 17,
                          color: AppColors.grey,
                        ),
                      ),
                      const SizedBox(height: 36),
                      Row(
                        children:[ Text(
                          'Step ${questionIndex+1}',
                            style: const TextStyle(
                            fontSize: 17,
                            color: AppColors.black,
                          ),
                        ),
                        Text(
                        ' of ${questionsWithAnswers.length}',
                          style: const TextStyle(
                          fontSize: 17,
                          color: AppColors.grey,
                        ),
                      )],
                      ),
                      SizedBox(
                         width: 60.0, // Set width to 100 pixels
                         height: 2.0, // Set height to 50 pixels
                         child: Container(
                         color: Colors.green, 
                         )
                      ),
                      
                      const SizedBox(height: 20),
                      Column(
                        children: questionsWithAnswers[questionIndex]
                            .answers
                            .map((answer) => AnswerWidgetItem(
                                  answer: answer,
                                  selectedAnswer: selectedAnswer,
                                  onTap: () {
                                    setState(() {
                                      selectedAnswer = answer.text;
                                      answerSelected = true;
                                    });
                                  },
                                ))
                            .toList(),
                      ),
                      const Spacer(),
                      MainButton(
                        text: 'Show Correct Answer',
                        onTap: () {  
                          setState(() {
                            final questionObj = questionsWithAnswers[questionIndex];
                            correctAns = questionObj.correctAnswer;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                                 SnackBar(
                                  content: Text(
                                    correctAns,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: AppColors.white,
                                  
                                    ),
                                  ),
                                ),
                              );
                        }
                      ),
                     
                       
                       // Text(correctAns,
                       //        style: const TextStyle(
                       //        fontSize: 26,
                       //       fontWeight: FontWeight.w600,
                       //       ),
                       //       )
                       
                      const SizedBox(height: 10),
                      MainButton(
                        text: 'Next',
                        onTap: () {
                        answerSelected
                          ? 
                          setState(() {
                            final questionObj =
                                questionsWithAnswers[questionIndex];
                            if (selectedAnswer == questionObj.correctAnswer) {
                              score++;
                            }
                            //selectedAnswer=null;
                            if (questionIndex <
                                questionsWithAnswers.length - 1) {
                              questionIndex++;
                            } else {
                              isFinished = true;
                            }
                          })
                          :ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'You have to choose an answer!',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: AppColors.red,
                                  
                                    ),
                                  ),
                                ),
                              );
                            answerSelected=false;  
                        },
                        
                      ),
                    ],
                  )
                : CongratsWidgets(
                    score: score,
                    onTap: () {
                      setState(() {
                        questionIndex = 0;
                        isFinished = false;
                        score = 0;
                      });
                    },
                  ),
          ),
        ),
      ),
    );
  }
}

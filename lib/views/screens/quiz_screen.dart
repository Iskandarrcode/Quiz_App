// import 'package:firebase_quiz/controllers/quiz_controller.dart';
// import 'package:firebase_quiz/models/quiz_models.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class QuizScreen extends StatefulWidget {
//   const QuizScreen({super.key});

//   @override
//   State<QuizScreen> createState() => _QuizScreenState();
// }

// class _QuizScreenState extends State<QuizScreen> {
//   final controller = PageController();

//   List<Map<String, dynamic>> question = [{}];
//   @override
//   Widget build(BuildContext context) {
//     final quizController = context.watch<QuizController>();
//     return Scaffold(
//       backgroundColor: const Color(0xff8582e5),
//       body: StreamBuilder(
//         stream: quizController.list,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }

//           if (snapshot.data == null) {
//             return const Center(
//               child: Text("Mahsulotlar mavjud emas"),
//             );
//           }
//           final quizes = snapshot.data!.docs;

//           return ListView.builder(
//             itemCount: quizes.length,
//             itemBuilder: (context, index) {
//               final quizInfo = Question.fromJson(quizes[index]);

//               return Expanded(
//                 child: Column(
//                   children: [
//                     Center(
//                       child: SafeArea(
//                         child: Image.asset(
//                           "assets/images/reflectly.gif",
//                           width: 70,
//                           height: 70,
//                         ),
//                       ),
//                     ),
//                     PageView.builder(
//                       controller: controller,
//                       scrollDirection: Axis.vertical,
//                       itemCount: question.length,
//                       itemBuilder: (context, index) {
//                         return Column(
//                           children: [
//                             Text("Savol ${quizInfo.questionText}"),
//                           ],
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               );
//             },
//           );
//         },
//       ),
//       floatingActionButton: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           IconButton(
//             onPressed: () {
//               controller.previousPage(
//                 duration: const Duration(milliseconds: 600),
//                 curve: Curves.linear,
//               );
//             },
//             icon: const Icon(
//               Icons.arrow_upward_rounded,
//               color: Colors.white,
//               size: 30,
//             ),
//           ),
//           const SizedBox(height: 20),
//           IconButton(
//             onPressed: () {
//               controller.nextPage(
//                   duration: const Duration(milliseconds: 800),
//                   curve: Curves.linear);
//             },
//             icon: const Icon(
//               Icons.arrow_downward_rounded,
//               color: Colors.white,
//               size: 30,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:firebase_quiz/controllers/quiz_controller.dart';
import 'package:firebase_quiz/models/quiz_models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    final quizController = context.watch<QuizController>();
    return Scaffold(
      backgroundColor: const Color(0xff8582e5),
      appBar: AppBar(
        leading: Center(
          child: SafeArea(
            child: Image.asset(
              "assets/images/reflectly.gif",
              width: 70,
              height: 70,
            ),
          ),
        ),
      ),
      body: StreamBuilder(
        stream: quizController.list,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text("Mahsulotlar mavjud emas"),
            );
          }
          final quizes = snapshot.data!.docs;

          return ListView.builder(
            itemCount: quizes.length,
            itemBuilder: (context, index) {
              // final quizInfo = Question.fromJson(quizes[index].data());
              final quizInfo = Question.fromJson(quizes[index]);

              return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: PageView.builder(
                  controller: controller,
                  scrollDirection: Axis.vertical,
                  itemCount: quizes.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Text(quizInfo.questionText),
                      ],
                    );
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              controller.previousPage(
                duration: const Duration(milliseconds: 600),
                curve: Curves.linear,
              );
            },
            icon: const Icon(
              Icons.arrow_upward_rounded,
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(height: 20),
          IconButton(
            onPressed: () {
              controller.nextPage(
                duration: const Duration(milliseconds: 800),
                curve: Curves.linear,
              );
            },
            icon: const Icon(
              Icons.arrow_downward_rounded,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}

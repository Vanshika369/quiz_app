import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/results_screen.dart';



class Quiz extends StatefulWidget{
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers=[];
  var activeScreen='start-screen';

  
  switchScreen(){
    setState(() {
      activeScreen='questions-screen';
    }
  );
  }

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length){
      setState(() {
        //selectedAnswers=[];
        activeScreen ='results-screen';
      });
    }
  }



  @override
  Widget build(context){

    Widget screenWidget=StartScreen(switchScreen);

    if (activeScreen=='questions-screen') {
      screenWidget=QuestionsScreen(onSelectAnswer: chooseAnswer);

    }

    if (activeScreen=='results-screen') {
      screenWidget=ResultsScreen(chosenAnswers:selectedAnswers);

    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple,
                Colors.purpleAccent,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,

              )
          ),
          child: screenWidget,
          ),
          
        ),
        
      );

  }
}


//conditional-rendering WAY-1
// class Quiz extends StatefulWidget{
//   const Quiz({super.key});

//   @override
//   State<Quiz> createState() {
//     return _QuizState();
//   }
// }

// class _QuizState extends State<Quiz> {
//   Widget? activeScreen;

//   @override
//   void initState(){
//     activeScreen=StartScreen(switchScreen);
//     super.initState();

//   }
//   switchScreen(){
//     setState(() {
//       activeScreen=const QuestionsScreen();
//     }
//   );
//   }

//   @override
//   Widget build(context){
//     return MaterialApp(
//       home: Scaffold(
//         body: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Colors.deepPurple,
//                 Colors.purpleAccent,
//                 ],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,

//               )
//           ),
//           child: activeScreen
//           ),
          
//         ),
        
//       );

//   }
// }

//conditional-rendering WAY-2
// class Quiz extends StatefulWidget{
//   const Quiz({super.key});

//   @override
//   State<Quiz> createState() {
//     return _QuizState();
//   }
// }

// class _QuizState extends State<Quiz> {
//   var activeScreen='start-screen';

  
//   switchScreen(){
//     setState(() {
//       activeScreen='questions-screen';
//     }
//   );
//   }

//   @override
//   Widget build(context){
//     return MaterialApp(
//       home: Scaffold(
//         body: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Colors.deepPurple,
//                 Colors.purpleAccent,
//                 ],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,

//               )
//           ),
//           child: activeScreen == 'start-screen'
//               ? StartScreen(switchScreen)
//               : const QuestionsScreen(),
//           ),
          
//         ),
        
//       );

//   }
// }
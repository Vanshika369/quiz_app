import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary.dart';

class ResultsScreen extends StatelessWidget{
  const ResultsScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  List<Map<String,Object>>getSummarydata(){
    final  List<Map<String,Object>> summary=[];

    for(var i = 0; i < chosenAnswers.length; i++){
      summary.add({     
          'question_index': i,                         //{}->intialise the map in dart
          'question' : questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer':chosenAnswers[i],
      });

    }

    return summary;

  }

  @override
  Widget build(context){
    final summaryData=getSummarydata();
    final numTotalQuestions = questions.length;
    final numCorrectAnswers = summaryData.where((data) {
      return data['correct_answer']==data['user_answer'];
    }).length;



    return SizedBox(
        width: double.infinity, //take all available width
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('You answered $numCorrectAnswers out of $numTotalQuestions questions correctly!'),
              const SizedBox(height: 30,),
              QuestionsSummary(summaryData),
              const SizedBox(height: 30,),
              TextButton(
                onPressed: (){}, 
                child: const Text('Restart Quiz!'),
                )
            ],
          ),
        ),
    );
  }
}
    
  
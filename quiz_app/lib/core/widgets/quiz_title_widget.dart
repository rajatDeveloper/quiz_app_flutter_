import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz_app/core/views/play_quiz_view.dart';
import 'package:quiz_app/core/widgets/option_tile_widget.dart';
import 'package:quiz_app/model/question_model.dart';

class QuizTileWidget extends StatefulWidget {
  final QuestionModel questionModel;
  final int index;
  const QuizTileWidget(
      {super.key, required this.questionModel, required this.index});

  @override
  State<QuizTileWidget> createState() => _QuizTileWidgetState();
}

class _QuizTileWidgetState extends State<QuizTileWidget> {
  String optionSelected = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      alignment: Alignment.topLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${widget.index + 1}. ${widget.questionModel.question!} ",
            textAlign: TextAlign.start,
            softWrap: true,
            style: const TextStyle(fontSize: 18, color: Colors.black),
          ),
          const SizedBox(
            height: 4,
          ),
          GestureDetector(
            onTap: () {
              if (!widget.questionModel.answered!) {
                if (widget.questionModel.option1 ==
                    widget.questionModel.correctOption) {
                  optionSelected = widget.questionModel.option1!;
                  widget.questionModel.answered = true;
                  correct++;
                  notAttempted = notAttempted - 1;
                } else {
                  optionSelected = widget.questionModel.option1!;
                  widget.questionModel.answered = true;
                  incorrect++;
                  notAttempted = notAttempted - 1;
                }
              }
              setState(() {});
            },
            child: OptionTileWidegt(
              option: "A",
              desc: widget.questionModel.option1!,
              correctAns: widget.questionModel.correctOption!,
              optionSelected: optionSelected,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          GestureDetector(
            onTap: () {
              if (!widget.questionModel.answered!) {
                if (widget.questionModel.option2 ==
                    widget.questionModel.correctOption) {
                  optionSelected = widget.questionModel.option2!;
                  widget.questionModel.answered = true;
                  optionSelected = widget.questionModel.option1!;
                  widget.questionModel.answered = true;
                  correct++;
                  notAttempted = notAttempted - 1;
                } else {
                  optionSelected = widget.questionModel.option2!;
                  widget.questionModel.answered = true;
                  incorrect++;
                  notAttempted = notAttempted - 1;
                }
              }
              setState(() {});
            },
            child: OptionTileWidegt(
              option: "B",
              desc: widget.questionModel.option2!,
              correctAns: widget.questionModel.correctOption!,
              optionSelected: optionSelected,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          GestureDetector(
            onTap: () {
              if (!widget.questionModel.answered!) {
                if (widget.questionModel.option3 ==
                    widget.questionModel.correctOption) {
                  optionSelected = widget.questionModel.option3!;
                  widget.questionModel.answered = true;
                  correct++;
                  notAttempted = notAttempted - 1;
                } else {
                  optionSelected = widget.questionModel.option3!;
                  widget.questionModel.answered = true;
                  incorrect++;
                  notAttempted = notAttempted - 1;
                }
              }
              setState(() {});
            },
            child: OptionTileWidegt(
              option: "C",
              desc: widget.questionModel.option3!,
              correctAns: widget.questionModel.correctOption!,
              optionSelected: optionSelected,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          GestureDetector(
            onTap: () {
              if (!widget.questionModel.answered!) {
                if (widget.questionModel.option4 ==
                    widget.questionModel.correctOption) {
                  optionSelected = widget.questionModel.option4!;

                  widget.questionModel.answered = true;
                  correct++;
                  notAttempted = notAttempted - 1;
                } else {
                  optionSelected = widget.questionModel.option4!;
                  widget.questionModel.answered = true;
                  incorrect++;
                  notAttempted = notAttempted - 1;
                }
              }
              setState(() {});
            },
            child: OptionTileWidegt(
              option: "D",
              desc: widget.questionModel.option4!,
              correctAns: widget.questionModel.correctOption!,
              optionSelected: optionSelected,
            ),
          ),
        ],
      ),
    );
  }
}

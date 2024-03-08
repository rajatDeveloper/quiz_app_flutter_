import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz_app/utils/use_full_functions.dart';

class OptionTileWidegt extends StatefulWidget {
  final String option, desc, correctAns, optionSelected;

  const OptionTileWidegt(
      {super.key,
      required this.option,
      required this.desc,
      required this.correctAns,
      required this.optionSelected});

  @override
  State<OptionTileWidegt> createState() => _OptionTileWidegtState();
}

class _OptionTileWidegtState extends State<OptionTileWidegt> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            alignment: Alignment.center,
            width: getDeviceWidth(context) * 0.08,
            height: getDeviceWidth(context) * 0.08,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                  color: widget.optionSelected == widget.desc
                      ? widget.optionSelected == widget.correctAns
                          ? Colors.green.withOpacity(0.7)
                          : Colors.red.withOpacity(0.7)
                      : Colors.grey),
            ),
            child: Text(
              widget.option,
              softWrap: true,
              style: TextStyle(
                color: widget.optionSelected == widget.desc
                    ? widget.correctAns == widget.optionSelected
                        ? Colors.green.withOpacity(0.7)
                        : Colors.red.withOpacity(0.7)
                    : Colors.grey,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(
            width: getDeviceWidth(context) * 0.05,
          ),
          Expanded(
            child: Text(
              widget.desc,
              softWrap: true,
              style: const TextStyle(fontSize: 17, color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}

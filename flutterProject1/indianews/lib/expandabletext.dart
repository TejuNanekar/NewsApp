import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;

  ExpandableText({required this.text});

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: Text(
        widget.text,
        maxLines: _isExpanded ? null : 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontWeight: FontWeight.bold, // Add bold font weight
        ),
      ),
    );
  }
}

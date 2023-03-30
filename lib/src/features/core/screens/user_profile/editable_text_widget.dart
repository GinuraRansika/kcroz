import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditableTextWidget extends StatefulWidget {
  final String text;

  const EditableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  _EditableTextWidgetState createState() => _EditableTextWidgetState();
}

class _EditableTextWidgetState extends State<EditableTextWidget> {
  final TextEditingController _textEditingController = TextEditingController();
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _textEditingController.text = widget.text;
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _isEditing
              ? TextField(
            controller: _textEditingController,
            autofocus: true,
            onSubmitted: (newValue) {
              setState(() {
                _isEditing = false;
              });
            },
          )
              : Text(
            widget.text,
            style: TextStyle(fontSize: 18.0),
          ),
        ),
        IconButton(
          icon: Icon(_isEditing ? Icons.done : Icons.edit),
          onPressed: () {
            setState(() {
              _isEditing = !_isEditing;
            });
          },
        ),
      ],
    );
  }
}

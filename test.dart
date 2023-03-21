import 'package:flutter/material.dart';

class MyCheckbox extends StatefulWidget {
  @override
  _MyCheckboxState createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  final _controller = TextEditingController();
  bool _isChecked = false;

  @override
  void initState() {
    _controller.text = _isChecked.toString();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: _isChecked,
          onChanged: (value) {
            setState(() {
              _isChecked = value!;
              _controller.text = _isChecked.toString();
            });
          },
        ),
        SizedBox(width: 8),
        Expanded(
          child: TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                _isChecked = value.toLowerCase() == 'true';
              });
            },
          ),
        ),
      ],
    );
  }
}

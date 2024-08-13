import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumericSquareTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final bool enabled;
  final ValueChanged<String>? onChanged;

  const NumericSquareTextField({
    Key? key,
    this.controller,
    this.hintText,
    this.labelText,
    this.enabled = true,
    this.onChanged,
  }) : super(key: key);

  @override
  NumericSquareTextFieldState createState() => NumericSquareTextFieldState();
}

class NumericSquareTextFieldState extends State<NumericSquareTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100, // Adjust width as needed
      height: 100, // Same as width to make it square
      child: TextFormField(
        controller: _controller,
        onChanged: widget.onChanged,
        enabled: widget.enabled,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          contentPadding: EdgeInsets.all(8.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          hintText: widget.hintText,
          labelText: widget.labelText,
        ),
      ),
    );
  }
}

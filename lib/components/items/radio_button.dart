import 'package:flutter/material.dart';

class LabeledRadio extends StatelessWidget {
  const LabeledRadio({
    required this.label,
    required this.groupValue,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final String groupValue;
  final String value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          if (value != groupValue) onChanged(value);
        },
        child: Row(
          children: <Widget>[
            SizedBox(
              height: 20,
              width: 20,
              child: Radio(
                groupValue: groupValue,
                value: value,
                activeColor: Colors.deepOrange,
                onChanged: (newValue) {
                  onChanged(newValue);
                },
              ),
            ),
            SizedBox(width: 6),
            Text(
              label,
              maxLines: 1,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

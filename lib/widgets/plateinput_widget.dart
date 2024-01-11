import 'package:flutter/material.dart';

class PlateInputWidget extends StatelessWidget {
  final String plate1, plate2, plate3;
  final Function(String)? onChangedPlate1;
  final Function(String)? onChangedPlate2;
  final Function(String)? onChangedPlate3;
  const PlateInputWidget({
    super.key,
    required this.plate1,
    required this.plate2,
    required this.plate3,
    required this.onChangedPlate1,
    required this.onChangedPlate2,
    required this.onChangedPlate3,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: TextEditingController(text: plate1),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            onChanged: onChangedPlate1,
          ),
        ),
        Expanded(
          child: TextField(
            controller: TextEditingController(text: plate2),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            onChanged: onChangedPlate2,
          ),
        ),
        Expanded(
          child: TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            onChanged: onChangedPlate3,
          ),
        ),
      ],
    );
  }
}

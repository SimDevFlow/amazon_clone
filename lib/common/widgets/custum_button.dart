import 'package:flutter/material.dart';

class CustumButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onTap;
  const CustumButton(
      {super.key, required this.buttonName, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50)),
      child: Text(buttonName,style: const TextStyle(color: Colors.white,),),
    );
  }
}

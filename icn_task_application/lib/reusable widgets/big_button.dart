import 'package:flutter/material.dart';
import 'package:icn_task_application/other_pages/createAcc_page.dart';

class MyButton extends StatelessWidget {
  const MyButton({Key? key, required this.text, required this.backgroundColor, required this.textColor, required this.isIcon, required this.onPressed}) : super(key: key);

  final String text;
  final Color backgroundColor, textColor; 
  final bool isIcon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
          side: MaterialStateProperty.all<BorderSide>(
            BorderSide(
              color: Colors.grey[200]!,
              width: 1.0
            )
          )
        ),

        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isIcon)
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Image(
                    height: 20,
                    width: 20,
                    image: AssetImage(
                      'assets/googleIcon.jpeg'
                    )
                  ),
                ),

              Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}
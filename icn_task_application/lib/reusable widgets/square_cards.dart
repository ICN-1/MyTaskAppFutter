import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SquareCards extends StatelessWidget {
  const SquareCards({super.key, required this.cardIcon, required this.cardName, required this.cardNumber});

  final String cardIcon, cardName, cardNumber;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: Colors.grey[200]
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  cardIcon,
                  style: TextStyle(
                    fontSize: 18.0
                  ),
                ),
              ),
            ),
          
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Text(
                cardName,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14.0
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                cardNumber,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
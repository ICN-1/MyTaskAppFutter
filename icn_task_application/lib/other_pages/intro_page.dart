import 'package:flutter/material.dart';
import 'package:icn_task_application/other_pages/createAcc_page.dart';
import 'package:icn_task_application/reusable%20widgets/big_button.dart';

class Intro_Page extends StatelessWidget {
  const Intro_Page({super.key});

  void _nextPage(BuildContext context){
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (
          (context) => CreateAccount()
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    double _statusBarHeight = MediaQuery.of(context).padding.top + 10.0;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, _statusBarHeight, 0.0, 0.0),
              child: Image(
                height: 350,
                width: 350,
                image: AssetImage('assets/intro_page_img.png')
              ),
            ),  
        
            Padding(
              padding: const EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 10.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Welcome to ',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Tasky',
                      style: TextStyle(
                        color: Colors.indigoAccent[400],
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold
                      )
                    ),
                    TextSpan(
                      text: '!',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold
                      )
                    ),
                  ],
                )
              )
            ),
    
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 10.0),
              child: Text(
                'Manage all your projects and tasks in one place',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.black
                ),
                textAlign: TextAlign.center,
              ),
            ),
    
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 70.0, 20.0, 20.0),
              child: MyButton(
                onPressed: () {
                  _nextPage(context);
                },
                text: 'Begin', 
                textColor: Colors.white,
                isIcon: false,
                backgroundColor: Colors.indigoAccent[400]!
              )
            ),
    
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Do you already have an account? ',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16.0,
                      color: Colors.black
                    ) 
                  ),
              
                  Text(
                    'Log in',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Colors.black
                    ) 
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
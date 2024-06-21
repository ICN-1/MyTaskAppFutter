import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icn_task_application/reusable%20widgets/big_button.dart';
import 'package:icn_task_application/reusable%20widgets/bottom_navigation_bar.dart';
import 'package:icn_task_application/reusable%20widgets/textFormFields.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key}); 

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  bool _isSwitched = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();

  void _create(){
    final isCreated = _formKey.currentState?.validate();
    if (isCreated!) {
      Navigator.push(
        context, 
        MaterialPageRoute(
          builder: (
            (context) => MyBottomNavigationBar(
              name: _nameController.text
            )
          )
        )
      );
      return;
    }
    _formKey.currentState?.save();
  }

  @override
  Widget build(BuildContext context) {
    double _statusBarHeight = MediaQuery.of(context).padding.top + 10.0;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20.0, _statusBarHeight, 20.0, 10.0),
                  child: Text(
                    'Create an Account',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            ),
              
            Form(
              key: _formKey,
              child: Column(
                children: [
                  MyTextField(
                    fieldHeader: 'Name', 
                    fieldHint: 'Input your name...',
                    nameController: _nameController,
                  ),
    
                  MyTextField(
                    fieldHeader: 'Email', 
                    fieldHint: 'Input your email address...'
                  ),
    
                  MyTextField(
                    fieldHeader: 'Password', 
                    fieldHint: 'Input your password...', 
                    visibilityIcon: true
                  ),
                ]
              )
            ),
              
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          text: 'Accept ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Colors.black
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Terms and Conditions',
                              style: TextStyle(
                                color: Colors.indigoAccent[400],
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold
                              )
                            )
                          ]
                        )
                      ),
                    ),
                  ),
              
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Transform.scale(
                        scale: 0.6,
                        child: Switch(
                          value: _isSwitched, 
                          onChanged: (value){
                            setState(() {
                              _isSwitched = value;
                            });
                          },
                          activeColor: Colors.indigoAccent[400],
                          activeTrackColor: Colors.indigoAccent[50],
                          inactiveThumbColor: Colors.grey,
                          inactiveTrackColor: Colors.grey[300],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
              
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
              child: MyButton(
                onPressed: () {
                  _create();
                },
                text: 'Register',
                textColor: Colors.white,
                isIcon: false,
                backgroundColor: Colors.indigoAccent[400]!
              ),
            ),
              
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.grey[350],
                    height: 1.0,
                    width: 120,
                  ),
              
                  Text(
                    '  Or register with  ',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey
                    ),
                  ),
              
                  Container(
                    color: Colors.grey[350],
                    height: 1.0,
                    width: 120,
                  )
                ],
              ),
            ),
              
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
              child: MyButton(
                onPressed: () {},
                text: 'Google',
                isIcon: true,
                textColor: Colors.black,
                backgroundColor: Colors.white
              ),
            ),
              
            Padding(
                padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 50.0),
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
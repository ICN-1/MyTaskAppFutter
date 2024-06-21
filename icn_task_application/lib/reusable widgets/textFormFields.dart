import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  MyTextField({Key? key, required this.fieldHeader, required this.fieldHint, this.visibilityIcon = false, this.nameController}) : super(key: key);

  final String fieldHeader, fieldHint;
  final bool visibilityIcon;
  TextEditingController? nameController;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool _hiddenText = true;
  String? errorMessage; 

  void _validate(String? value) {
    setState(() {
      if (widget.fieldHeader == 'Password') {
        if (value!.isEmpty) {
          errorMessage = 'Password field is empty';
        } else if (6 <= value.length && value.length <= 8) {
          errorMessage = 'Your password should be more than 8 characters.';
        } else {
          errorMessage = null;
        }
      }

      // if (widget.fieldHeader == 'Name') {
      //   if (value!.isEmpty) {
      //     errorMessage = 'Name field is empty';
      //   } else if (value.length < 5) {
      //     errorMessage = 'Your Name is too short.';
      //   } else {
      //     errorMessage = null;
      //   }
      // } else if (widget.fieldHeader == 'Email') {
      //   if (value!.isEmpty) {
      //     errorMessage = 'Email field is empty';
      //   } else if (!RegExp(r"^[a-zA-Z0-9.!#$%&'*+-/=?^_'{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+$").hasMatch(value)) {
      //     errorMessage = 'Invalid Email';
      //   } else {
      //     errorMessage = null;
      //   }
      // } else if (widget.fieldHeader == 'Password') {
        // if (value!.isEmpty) {
        //   errorMessage = 'Password field is empty';
        // } else if (value.length <= 8) {
        //   errorMessage = 'Your password should be more than 8 characters.';
        // } else {
        //   errorMessage = null;
        // }
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 5.0),
              child: Text(
                widget.fieldHeader,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold
                )
              ),
            ),
          ],
        ),

        Padding(
          padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 5.0),
          child: TextFormField(
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16.0
            ),

            obscureText: widget.visibilityIcon ? _hiddenText : false,

            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 224, 224, 224)
                )
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  width: 2.0,
                  color: Color.fromARGB(255, 63, 81, 181)
                )
              ),

              hintText: widget.fieldHint,
              hintStyle: TextStyle(
                fontSize: 18,
                color: Colors.grey[400],
                fontWeight: FontWeight.normal
              ),

              suffixIcon: widget.visibilityIcon ? IconButton(
                icon: Icon(
                  _hiddenText ? Icons.visibility : Icons.visibility_off
                ),
                onPressed: (){
                  setState(() {
                    _hiddenText = !_hiddenText;
                  });
                } 
              ):null
            ),

            validator: (value) {
              if (value!.isEmpty) {
                return widget.fieldHeader + " field is too short.";
              } else if (widget.fieldHeader == 'Email' && !RegExp(r"^[a-zA-Z0-9.!#$%&'*+-/=?^_'{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+$").hasMatch(value)) {
                return "Invalid email address";
              } else if (widget.fieldHeader == 'Name' && value!.length < 4){
                return 'Your name is too short';
              } else if (widget.fieldHeader == 'Password' && value!.length < 6){
                return 'Password is too short';
              }
            },

            controller: widget.nameController,

            keyboardType: TextInputType.name,
            onChanged: _validate,
          ),
        ),

        if(errorMessage != null)
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
            child: Row(
              children: [
                Icon(
                  Icons.check_circle_outline_rounded,
                  color: Colors.grey[600],
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    errorMessage!,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            )
          )
      ],
    );
  }
}
import 'package:flutter/material.dart';

class ComposeEmail extends StatefulWidget {
  Function addEmail;
  ComposeEmail(this.addEmail);
  @override
  State<ComposeEmail> createState() => _ComposeEmailState();
}

class _ComposeEmailState extends State<ComposeEmail> {
  String toEmail = "";
  String emailBody = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30,40,30,0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  <Widget>[
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                  labelText: 'Reciever Email',
                  hintText: 'Enter Reciever Email'
              ),
              onChanged: (value){
                setState(() {
                  toEmail = value;
                });
              },
            ),
            SizedBox(height:40),
            TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email Body',
              hintText: 'Enter Email Body'
            ),
              onChanged: (value){
              setState(() {
                emailBody = value;
              });
              },
            ),
            SizedBox(height:40),
            TextButton(
              onPressed: (){
                if(emailBody=="" || toEmail==""){
                  return;
                }
                widget.addEmail(toEmail,emailBody);
              },
                child: Text('Send',style: TextStyle(
                  color:  (emailBody=="" || toEmail=="")?Colors.white:Colors.white,
                ),),
              style: ButtonStyle(
                backgroundColor: (emailBody=="" || toEmail=="")?MaterialStateProperty.all<Color>(Colors.grey) :MaterialStateProperty.all<Color>(Colors.blueAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
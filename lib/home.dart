import 'package:first_flutter_app/db/email_db.dart';
import 'package:first_flutter_app/structure/user_info.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_app/structure/email.dart';
import 'package:uuid/uuid.dart';

class Home extends StatefulWidget {
  List<Email> allEmails;
  UserInfo userInfo;
  Function refreshNotes;
  Home(this.allEmails, this.userInfo, this.refreshNotes);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
          child: SingleChildScrollView(
            child: Column(
              verticalDirection: VerticalDirection.down,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.allEmails
                  .map((emailInfo) => Dismissible(
                        key: Key(emailInfo.id.toString()),
                        onDismissed: (direction) {
                          setState(() {
                            EmailDataBase.instance.delete(emailInfo.id ?? -1);
                          });
                          widget.refreshNotes();
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Email dismissed')));
                        },
                        child: GestureDetector(
                          onTap: () {
                            var index = widget.allEmails.indexOf(emailInfo);
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Container(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "From: ",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey),
                                              ),
                                              Flexible(
                                                  child: Text(emailInfo
                                                              .fromEmail
                                                              .toLowerCase() ==
                                                          widget.userInfo
                                                              .userEmail
                                                              .toLowerCase()
                                                      ? "You"
                                                      : emailInfo.fromEmail))
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "To: ",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Flexible(
                                                  child: Text(emailInfo.toEmail
                                                              .toLowerCase() ==
                                                          widget.userInfo
                                                              .userEmail
                                                              .toLowerCase()
                                                      ? "You"
                                                      : emailInfo.toEmail))
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Body: ",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey),
                                                overflow: TextOverflow.visible,
                                              ),
                                              Flexible(
                                                  child: Text(emailInfo.body))
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: [
                                        Text(
                                          "From: ",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        Text(
                                          emailInfo.fromEmail.toLowerCase() ==
                                                  widget.userInfo.userEmail
                                                      .toLowerCase()
                                              ? "You"
                                              : emailInfo.fromEmail,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "To: ",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        Text(
                                          emailInfo.toEmail.toLowerCase() ==
                                                  widget.userInfo.userEmail
                                                      .toLowerCase()
                                              ? "You"
                                              : emailInfo.toEmail,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(emailInfo.body.length > 100
                                        ? emailInfo.body.substring(0, 100) +
                                            "..."
                                        : emailInfo.body),
                                  ],
                                ),
                              )),
                        ),
                      ))
                  .toList(),
            ),
          )),
    );
  }
}

import 'package:flutter/material.dart';

class Create extends StatefulWidget {
  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            new TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.title),
                hintText: 'Create Title',
                labelText: 'Title',
              ),
              // validator: validateMessage,
              onSaved: (val) {
                // konten = val;
              },
              maxLines: 2,
              keyboardType: TextInputType.text,
            ),
            new TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.create),
                hintText: 'Description',
                labelText: 'Description',
              ),
              // validator: validateMessage,
              onSaved: (val) {
                // konten = val;
              },
              maxLines: 6,
              keyboardType: TextInputType.text,
            ),
          ],
        ),
      ),
    );
  }
}

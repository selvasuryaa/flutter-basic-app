import 'package:flutter/material.dart';

class DetailScreen2 extends StatefulWidget {
  const DetailScreen2({Key? key}) : super(key: key);

  @override
  State<DetailScreen2> createState() => _DetailScreen2State();
}

class _DetailScreen2State extends State<DetailScreen2> {
  // TextEditingController nameController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  String uname = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Item 2')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              autofocus: true,
              onChanged: (value) {
                // value = nameController.text;
                uname = value;
                // print(value);
              },
              // controller: nameController,
              decoration: InputDecoration(
                label: Text('Username'),
                hintText: 'Enter the Name',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              onChanged: (value) {
                // value = passwordController.text;
                password = value;
                // print(value);
              },
              // controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                label: Text('Password'),
                hintText: 'Enter the Password',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // print(nameController.text);
              // print(passwordController.text);

              print(uname);
              print(password);
              showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      title: Text('Message'),
                      content:
                          Text('Username: ${uname} \n password: ${password}'),
                      actions: [
                        TextButton(
                          child: Text('Okay'),
                          onPressed: () {
                           
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    );
                  }
                  );
                   
            },
            child: Text(
              'Submit',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

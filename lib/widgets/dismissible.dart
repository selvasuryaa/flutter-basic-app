import 'package:flutter/material.dart';

class Dismissables extends StatefulWidget {
  const Dismissables({Key? key}) : super(key: key);

  @override
  State<Dismissables> createState() => _DismissablesState();
}

class _DismissablesState extends State<Dismissables> {
  final items = List<String>.generate(20, (i) => 'Item ${i + 1}');
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Dismissible(
          direction: DismissDirection.startToEnd,

          key: Key(item),
          confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Are you sure'),
            content: Text('you want to delete this item from the Cart?'),
            actions: [
              TextButton(
                child: Text('yes'),
                onPressed: () {
                      Navigator.of(ctx).pop(true);

                },
              ),
              TextButton(
                child: Text('No'),
                onPressed: () {
                      Navigator.of(ctx).pop(false);

                },
              ),
            ],
          ),
        );
      },

          onDismissed: (direction) {
            setState(() {
              items.removeAt(index);
            });

            // Then show a snackbar.
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                duration: Duration(milliseconds: 4000),
                content: Text('$item dismissed')));
          },
          // Show a red background as the item is swiped away.
          background: Container(
              padding: EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              child: Icon(Icons.delete),
              color: Colors.red),
          child: ListTile(
            title: Text(item),
          ),
        );
      },
    );
  }
}

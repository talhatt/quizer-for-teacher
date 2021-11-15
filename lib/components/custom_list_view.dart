import 'package:flutter/material.dart';
import 'package:quizer/constants.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Card(
            color: primaryColor,
            child: ListTile(
              title: Text("Soru Setim - 1"),
              trailing: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.play_circle)),
                  ],
                ),
              ),
            ),
          ),
          Card(
            color: primaryColor,
            child: ListTile(
              title: Text("Soru Setim - 1"),
              trailing: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.play_circle)),
                  ],
                ),
              ),
            ),
          ),
          Card(
            color: primaryColor,
            child: ListTile(
              title: Text("Soru Setim - 1"),
              trailing: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.play_circle)),
                  ],
                ),
              ),
            ),
          ),
          Card(
            color: primaryColor,
            child: ListTile(
              title: Text("Soru Setim - 1"),
              trailing: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.play_circle)),
                  ],
                ),
              ),
            ),
          ),
          Card(
            color: primaryColor,
            child: ListTile(
              title: Text("Soru Setim - 1"),
              trailing: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.play_circle)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

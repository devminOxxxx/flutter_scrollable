import 'package:flutter/material.dart';

class EmptyGroceryScreen extends StatelessWidget {
  const EmptyGroceryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
            child: AspectRatio(
                aspectRatio: 1.0,
                child: Image.asset('assets/fooderlich_assets/empty_list.png'))),
        Text(
          'No Groceries',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          'Shoopong for ingredients? Write them down!',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        MaterialButton(
          onPressed: () {},
          textColor: Colors.white,
          color: Colors.green,
          height: 36,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Text('Browse Recipes'),
        ),
      ],
    );
  }
}

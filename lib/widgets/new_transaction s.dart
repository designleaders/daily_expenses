import 'package:flutter/material.dart';

class NewTrasactions extends StatefulWidget {
  final Function addTx;

  NewTrasactions(
    this.addTx,
  );

  @override
  State<NewTrasactions> createState() => _NewTrasactionsState();
}

class _NewTrasactionsState extends State<NewTrasactions> {
  final titleController = TextEditingController();

  final amountontroller = TextEditingController();

  void submitData() {
    final enterTitle = titleController.text;
    final enterAmount = double.parse(amountontroller.text);

    if (enterTitle.isEmpty || enterAmount <= 0) {
      return;
    }

    widget.addTx(
      enterTitle,
      enterAmount,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Product',
              ),
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'amount',
              ),
              controller: amountontroller,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
              onPressed: submitData,
              child: Text(
                'Add Transaction',
              ),
              textColor: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TrasactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TrasactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'Transactions is not added yet!',
                  style: TextStyle(fontSize: 30),
                ),
                Icon(
                  Icons.paid,
                  size: 250,
                  color: Colors.purple,
                ),
                Container(
                  child: Image.asset(
                    'assets/images/cat.png',
                    scale: 1,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Colors.purple,
                          ),
                        ),
                        child: Text(
                          ' \$${transactions[index].amount.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(transactions[index].title,
                              style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.bold,
                                fontSize: 36,
                              )),
                          Text(
                            DateFormat.yMMMEd()
                                .format(transactions[index].date),
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}

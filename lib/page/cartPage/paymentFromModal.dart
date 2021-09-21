import 'package:flutter/material.dart';

void showPaymentModal(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Name on Card')
              ),
              TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Card Number')
              ),
              TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Expire date')
              ),
              IconButton(onPressed: () {

              }, icon: Icon(Icons.payments_outlined), iconSize: 50,)
            ],
          ),
        );
      });
}

import 'package:flutter/material.dart';
import 'package:smart_menu/entity/meal.dart';
import 'package:smart_menu/page/cartPage/paymentFromModal.dart';

class Cart extends StatefulWidget {
  List cartItems = [];
  final Function addToCart;
  final Function removeFromCart;
  double totalPrice = 0.0;
  Cart(this.cartItems, this.addToCart, this.removeFromCart, this.totalPrice);

  @override
  _Cart createState() => _Cart();
}

class _Cart extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    void add(Meal m) {
      setState(() {
        widget.totalPrice = widget.addToCart(m);
      });
    }

    void remove(int id) {
      setState(() {
        widget.totalPrice = widget.removeFromCart(id);
      });
    }

    return Scaffold(
        appBar: AppBar(
          iconTheme: new IconThemeData(color: Colors.white70),
          actionsIconTheme: new IconThemeData(color: Colors.white70),
          title: Text('My Cart',
              style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Railway',
                  color: Colors.white70,
                  fontWeight: FontWeight.bold)),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text('Total Price: ${widget.totalPrice.toStringAsFixed(2)}\$', style: TextStyle(fontSize: 15, letterSpacing: 1, color: Colors.white70),),
            ),
            IconButton(onPressed: () {
              if (widget.cartItems.isNotEmpty) {
                showPaymentModal(context);
              }
            }, icon: Icon(Icons.payment))
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            if (widget.cartItems.length < 1)
              Text(
                'No items yet...',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
                    letterSpacing: 3),
                textAlign: TextAlign.center,
              )
            else
              for (int i = 0; i < widget.cartItems.length; i++)
                Card(
                  child: ListTile(
                    title: Text('${widget.cartItems[i].name}'),
                    leading: Image.asset(widget.cartItems[i].img),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove_circle_outline),
                          onPressed: () {
                            remove(widget.cartItems[i].id);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.add_circle_outline),
                          onPressed: () {
                            add(widget.cartItems[i]);
                          },
                        ),
                      ],
                    ),
                    subtitle: Text(
                        '${widget.cartItems[i].price}\$  x${widget.cartItems[i].amount.toString()}'),
                  ),
                )
          ],
        ));
  }
}

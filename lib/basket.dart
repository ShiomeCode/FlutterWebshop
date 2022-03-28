import 'package:flutter/material.dart';

import 'nav.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: cartItemName.isEmpty == true
          ? Center(
              child: Text("Ingen Produkter i kurven"),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: cartItemName.length,
                      itemBuilder: ((context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              leading: Container(
                                color: cartItemPic[index],
                                width: 48,
                                height: 48,
                              ),
                              title: Text(cartItemAmount[index].toString() +
                                  " stk " +
                                  cartItemName[index]),
                              trailing: IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () {
                                  setState(() {
                                    cartItemName.removeAt(index);
                                    cartItemAmount.removeAt(index);
                                    cartItemPic.removeAt(index);
                                  });
                                },
                              ),
                            ),
                          ))),
                ),
                Center(child: DialogButton()),
              ],
            ),
    );
  }
}

class DialogButton extends StatelessWidget {
  const DialogButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.lightBlue)),
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Dette er en test'),
          content: const Text(
              'Betalingsmodul er ikke med i denne demo\n\nTryk OK for at gå tilbage'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const Text('Til Betaling',
          style: TextStyle(color: Colors.white, fontSize: 18)),
    );
  }
}

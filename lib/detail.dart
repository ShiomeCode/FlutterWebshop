import 'package:flutter/material.dart';
import 'nav.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, this.title, this.image})
      : super(
          key: key,
        );
  final String? title;
  final Color? image;
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  TextEditingController tec = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                height: 200,
                width: 300,
                child: Container(color: widget.image),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "${widget.title}",
                style: const TextStyle(fontSize: 22),
              ),
            ),
            const SizedBox(
              width: 350,
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras fringilla ante nec nulla viverra, id aliquet elit tempus. Sed imperdiet in enim eget dictum. Nulla vitae iaculis ex. Fusce congue id velit nec aliquet.Mauris mollis nunc non condimentum semper.",
                style: TextStyle(fontSize: 16),
              ),
            ),
            ListTile(
              leading: const Padding(
                padding: EdgeInsets.only(top: 8, left: 68.0),
                child: Text("Antal:"),
              ),
              title: Padding(
                padding: const EdgeInsets.only(right: 20, left: 10),
                child: TextField(
                  controller: tec,
                  keyboardType: const TextInputType.numberWithOptions(
                      signed: false, decimal: false),
                ),
              ),
              trailing: Padding(
                padding: const EdgeInsets.only(right: 28.0),
                child: TextButton(
                  child: Container(
                      height: 40,
                      decoration: const BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Tilføj",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                  onPressed: () {
                    cartItemName.add(widget.title ?? "Error");
                    cartItemPic.add(widget.image ?? Colors.grey);
                    cartItemAmount.add(int.parse(tec.value.text));

                    setState(() {
                      final snackBar = SnackBar(
                        content: Text(
                            "${tec.text} stk ${widget.title} tilføjet til kurv"),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Navigator.pop(context);
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

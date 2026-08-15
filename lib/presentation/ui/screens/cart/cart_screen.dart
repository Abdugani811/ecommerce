import 'package:flutter/material.dart';
import 'package:splash_screen/presentation/ui/resourses/app_styles.dart';
import 'package:splash_screen/presentation/ui/widgets/w_button.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cart Screen")),
      body: ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => AlertDialog(
              title: Center(
                child: Icon(Icons.warning, color: Colors.red, size: 73),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Delete this product", style: AppStyles.getLabelStyle()),
                  SizedBox(height: 10),
                  Text(
                    "Do you want to delete this product?",
                    style: AppStyles.getContentStyle(),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 42),
                  Row(
                    children: [
                      Expanded(
                        child: WButton(
                          text: "Yes",
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          borderRadius: 70,
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: WButton(
                          text: "No",
                          onTap: () {},
                          color: Colors.amber,
                          borderRadius: 70,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        child: Text("Open Dialog"),
      ),
    );
  }
}

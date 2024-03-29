import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/models/product-model.dart';
import 'package:project/models/user-model.dart';
import 'package:project/screens/customer/Auth/login_screen.dart';
import 'package:project/screens/customer/cart/newAddress.dart';
import 'package:project/services/Localization/applocalization.dart';
import 'package:project/services/localizationService.dart';
import 'package:project/services/productService.dart';
import 'package:project/services/userService.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // replace it with if the user logged in and get token
  String userToken;
  List<Product> cartProducts = [];
  var total;
  int _value;
  User currentUser;
  bool _isBtnDisabled;

  @override
  void initState() {
    super.initState();
    String lang = LocalizationService().lang;
    _isBtnDisabled = false;
    total = 0;
    _value = 1;
    getUser();
  }

  void getUser() async {
    UserService userServ = UserService();
    userToken = await userServ.isUserSignedIn();
    if (userToken != null) {
      currentUser = await userServ.getUserByToken(userToken);
      var cartIDs = currentUser.cart;
      if (cartIDs == null || cartIDs.length ==0) _isBtnDisabled = true;
      cartProducts = await ProductService().getProductListByID(cartIDs);
      cartProducts.forEach((element) {element.quantity =1;});
      getTotalPrice();
      setState(() {});
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
    }
  }

  getTotalPrice() {
    var newTotal = 0;
    for (var i = 0; i < cartProducts.length; i++) {
      newTotal += cartProducts[i].price * cartProducts[i].quantity;
    }
    setState(() {
      total = newTotal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Container(
            width: 100,
            height: 40,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Image.asset('Images/amazon-black.png'),
            )),
        actions: [
          IconButton(
              icon: Icon(Icons.keyboard_voice_outlined,
                  color: Colors.black, size: 30),
              onPressed: () {}),
        ],
        elevation: 0.0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                Color.fromRGBO(133, 217, 225, 1),
                Color.fromRGBO(165, 230, 206, 1)
              ])),
        ),
      ),
      body: Stack(
        children: [
          Column(children: [
            Padding(padding: const EdgeInsets.only(top: 150.0)),
            Expanded(
              // height: MediaQuery.of(context).size.height*0.67,
              child: ListView.builder(
                itemCount: cartProducts.length,
                itemBuilder: (context, index) {
                  final cartItem = cartProducts[index];
                  return Container(
                    // height: 350,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(color: Colors.grey[300]),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 200,
                              height: 200,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Image.network(cartItem.image),
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 150,
                                    child: Text(
                                      cartItem.name,
                                      style: TextStyle(
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                  Text("\$" + cartItem.price.toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.red[900])),
                                  Text(
                                      AppLocalizations.of(context)
                                          .translate('inStock'),
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.green[700])),
                                  Row(
                                    children: [
                                      Text(
                                          AppLocalizations.of(context)
                                                  .translate('color') +
                                              ": ",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                      Text(cartItem.color,
                                          style: TextStyle(
                                            fontSize: 18,
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.grey[400]),
                                elevation:
                                    MaterialStateProperty.all<double>(0.0),
                              ),
                              onPressed: () {
                                setState(() {
                                  if(cartItem.quantity == 0)
                                    cartItem.quantity = 0;
                                  else cartItem.quantity -=1;
                                  getTotalPrice();
                                });
                              },
                              child: Text('-'),
                            ),
                            Container(
                              width: 70,
                              height: 35,
                              child: Center(child: Text(cartItem.quantity.toString())),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.grey)),
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.grey[400]),
                                elevation:
                                    MaterialStateProperty.all<double>(0.0),
                              ),
                              onPressed: () {
                                // Respond to button press
                                setState(() {
                                  if(cartItem.quantity == 10)
                                    cartItem.quantity = 10;
                                  else cartItem.quantity +=1;
                                  getTotalPrice();
                                });
                              },
                              child: Text('+'),
                            ),
                          ]),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.grey[400]),
                                  elevation:
                                      MaterialStateProperty.all<double>(0.0),
                                ),
                                onPressed: () {
                                  setState(() {
                                    cartItem.quantity = 0;
                                    getTotalPrice();
                                  });
                                },
                                child: Text(AppLocalizations.of(context)
                                    .translate('delete')),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.grey[400]),
                                  elevation:
                                      MaterialStateProperty.all<double>(0.0),
                                ),
                                onPressed: () {
                                  // Respond to button press
                                },
                                child: Text(AppLocalizations.of(context)
                                    .translate('saveForLater')),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(AppLocalizations.of(context)
                                  .translate('compareSimilarItems')),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ]),
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(color: Colors.grey[300])),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppLocalizations.of(context).translate('subtotal')),
                      Text(" (" +
                          cartProducts.length.toString() +
                          AppLocalizations.of(context).translate('items') +
                          ") "),
                      Text(
                        "\$" + total.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red[900]),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        onChanged: (bool value) {
                          print('ok');
                        },
                        tristate: true,
                        value: false,
                        activeColor: Colors.cyan[900],
                      ),
                      Text(
                        AppLocalizations.of(context)
                            .translate('orderContainGift'),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: ElevatedButton(
                      onPressed: _isBtnDisabled
                          ? null
                          : () {
                              List<Product> checked = [];
                              cartProducts.forEach((element) {
                                if(element.quantity != 0)
                                  checked.add(element);
                              });
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      NewAddress(cartItems: checked,)));
                            },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(242, 196, 89, 1))),
                      child: Text(AppLocalizations.of(context)
                          .translate('proceedToCheckout')),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

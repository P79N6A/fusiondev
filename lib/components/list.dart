
import 'package:flutter/material.dart';
import '../views/detail.dart';
class MyList extends StatefulWidget{
  @override
  ListState createState() => new ListState();
}

class ListState extends State<MyList>{
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: 30,
      itemBuilder: (BuildContext context, int index){
        return new Card(
          child: new Container(
            padding: new EdgeInsets.all(1.0),
            child: new ListTile(
              subtitle: new Container(
                height: 72,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        new Text("标题", style: new TextStyle(fontWeight: FontWeight.bold,fontSize:16.0))
                      ]
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            new Text("时间："),
                            new Text("2019-03-22 16:03")
                          ],
                        )
                      ]
                    ),
                    new Row(children: <Widget>[
                      new Container(
                        padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 2.0),
                        child: new Text('内容')
                      )
                    ],)
                  ],
                )
              ),
              trailing: new Icon(Icons.keyboard_arrow_right,color:Colors.grey),
            )
          )
        );
      }
    );
  }

}





class Product {
  const Product({this.name});
  final String name;
}

typedef void CartChangedCallback(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget {
  ShoppingListItem({Product product, this.inCart, this.onCartChanged})
      : product = product,
        super(key: new ObjectKey(product));

  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  Color _getColor(BuildContext context) {
    // The theme depends on the BuildContext because different parts of the tree
    // can have different themes.  The BuildContext indicates where the build is
    // taking place and therefore which theme to use.

    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context) {
    if (!inCart) return new TextStyle(
      color: Theme.of(context).primaryColor,
      decoration: TextDecoration.lineThrough,
    );

    return new TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      onTap: () {
        onCartChanged(product, !inCart);
      },
      leading: new CircleAvatar(
        backgroundColor: _getColor(context),
        child: new Text(product.name[0]),
      ),
      title: new Text(product.name, style: inCart ? _getTextStyle(context):null),
    );
  }
}


class ShoppingList extends StatefulWidget {
  ShoppingList({Key key, this.products}) : super(key: key);

  final List<Product> products;

  // The framework calls createState the first time a widget appears at a given
  // location in the tree. If the parent rebuilds and uses the same type of
  // widget (with the same key), the framework will re-use the State object
  // instead of creating a new State object.

  @override
  _ShoppingListState createState() => new _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  Set<Product> _shoppingCart = new Set<Product>();

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      // When user changes what is in the cart, we need to change _shoppingCart
      // inside a setState call to trigger a rebuild. The framework then calls
      // build, below, which updates the visual appearance of the app.

      // detail.dart

      if (inCart)
        _shoppingCart.add(product);
      else
        _shoppingCart.remove(product);


    Navigator.push(
    context,
    new MaterialPageRoute(builder: (context) => new DetailApp()),
  );
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // appBar: new AppBar(
      //   title: new Text('Shopping List'),
      // ),
      body: new ListView(
        padding: new EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((Product product) {
          return new ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
            onCartChanged: _handleCartChanged,
          );
        }).toList(),
      ),
    );
  }
}

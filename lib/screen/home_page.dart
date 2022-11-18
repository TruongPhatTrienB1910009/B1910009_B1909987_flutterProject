// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:orderfood/models/categories_modle.dart';
import 'package:orderfood/provider/my_provider.dart';
import 'package:orderfood/screen/auth/auth_manager.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoriesModle> burgerList = [];
  List<CategoriesModle> recipeList = [];
  List<CategoriesModle> pizzaList = [];
  List<CategoriesModle> drinkList = [];

  Widget categoriesContainer({required String image, required String name}) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 10),
          height: 60,
          width: 70,
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(image)),
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          name,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  Widget bottonContainer(
      {required String image, required int price, required String name}) {
    return Container(
      height: 240,
      width: 220,
      decoration: BoxDecoration(
        color: Color(0xff3a3e3e),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage(image),
          ),
          ListTile(
            leading: Text(
              name,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            trailing: Text("\$ $price",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.white,
                ),
                Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.white,
                ),
                Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.white,
                ),
                Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.white,
                ),
                Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.white,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget drawerItem({required String name, required IconData icon}) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        name,
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget burger() {
    return Row(
      children: burgerList
          .map(
            (e) => categoriesContainer(
              image: e.image,
              name: e.name,
            ),
          )
          .toList(),
    );
  }

  Widget recipe() {
    return Row(
      children: recipeList
          .map(
            (e) => categoriesContainer(
              image: e.image,
              name: e.name,
            ),
          )
          .toList(),
    );
  }

  Widget pizza() {
    return Row(
      children: pizzaList
          .map(
            (e) => categoriesContainer(
              image: e.image,
              name: e.name,
            ),
          )
          .toList(),
    );
  }

  Widget drink() {
    return Row(
      children: drinkList
          .map(
            (e) => categoriesContainer(
              image: e.image,
              name: e.name,
            ),
          )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);

    final authprovider = Provider.of<AuthManager>(context);
    //
    provider.getBurgerCategory();
    burgerList = provider.throwBurgerList;

    //
    provider.getRecipeCategory();
    recipeList = provider.throwRecipeList;

    //
    provider.getPizzaCategory();
    pizzaList = provider.throwPizzaList;

    //
    provider.getDrinkCategory();
    drinkList = provider.throwDrinkList;

    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Color(0xff2b2b2b),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('images/background.jpg'),
                    ),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('images/profile.jpg'),
                  ),
                  accountName: Text("Burger"),
                  accountEmail: Text('Trienb1910009@gmail.com'),
                ),
                drawerItem(
                  icon: Icons.person,
                  name: "Profile",
                ),
                drawerItem(
                  icon: Icons.add_shopping_cart,
                  name: "Cart",
                ),
                drawerItem(
                  icon: Icons.shop,
                  name: "Order",
                ),
                Divider(
                  thickness: 2,
                  color: Colors.white,
                ),
                ListTile(
                  leading: Text(
                    "Comunicate",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                // Text(
                //   "Comunicate",
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 20,
                //   ),
                // ),
                drawerItem(
                  icon: Icons.lock,
                  name: "Change",
                ),
                // drawerItem(
                //   icon: Icons.exit_to_app,
                //   name: "Log out",
                // ),
                ListTile(
                  leading: Icon(
                    Icons.exit_to_app,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Log out",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    authprovider.logout();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0.0,
        // leading: Icon(Icons.sort),
        actions: [
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('images/profile.jpg'),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search Food",
                hintStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                filled: true,
                fillColor: Color(0xff3a3e3e),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                burger(),
                recipe(),
                pizza(),
                drink(),
                // categoriesContainer(
                //   image: 'images/1.png',
                //   name: 'All',
                // ),
                // categoriesContainer(
                //   image: 'images/2.png',
                //   name: 'Burger',
                // ),
                // categoriesContainer(
                //   image: 'images/3.png',
                //   name: 'Recipe',
                // ),
                // categoriesContainer(
                //   image: 'images/4.png',
                //   name: 'Pizza',
                // ),
                // categoriesContainer(
                //   image: 'images/5.png',
                //   name: 'Drink',
                // ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 1),
            height: 500,
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              shrinkWrap: false,
              primary: false,
              children: [
                bottonContainer(
                  image: 'images/1.png',
                  name: 'burger1',
                  price: 12,
                ),
                bottonContainer(
                  image: 'images/1.png',
                  name: 'burger1',
                  price: 12,
                ),
                bottonContainer(
                  image: 'images/1.png',
                  name: 'burger1',
                  price: 12,
                ),
                bottonContainer(
                  image: 'images/1.png',
                  name: 'burger1',
                  price: 12,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

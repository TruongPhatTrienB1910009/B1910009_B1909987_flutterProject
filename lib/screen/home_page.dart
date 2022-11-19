// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:orderfood/models/categories_modle.dart';
import 'package:orderfood/models/food_categories_modle.dart';
import 'package:orderfood/models/food_modle.dart';
import 'package:orderfood/provider/my_provider.dart';
import 'package:orderfood/screen/auth/auth_manager.dart';
import 'package:orderfood/screen/categories.dart';
import 'package:orderfood/screen/detail_page.dart';
import 'package:orderfood/screen/widget/bottom_Contianer.dart';
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

  List<FoodModle> singleFoodList = [];
  List<FoodCategoriesModle> burgerCategoriesList = [];
  List<FoodCategoriesModle> recipeCategoriesList = [];
  List<FoodCategoriesModle> pizzaCategoriesList = [];
  List<FoodCategoriesModle> drinkCategoriesList = [];

  Widget categoriesContainer({
    required VoidCallback onTap,
    required String image,
    required String name,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 10),
            height: 60,
            width: 70,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(image)),
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
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
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => Categories(
                      list: burgerCategoriesList,
                    ),
                  ),
                );
              },
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
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => Categories(
                      list: recipeCategoriesList,
                    ),
                  ),
                );
              },
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
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => Categories(
                      list: pizzaCategoriesList,
                    ),
                  ),
                );
              },
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
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => Categories(
                      list: drinkCategoriesList,
                    ),
                  ),
                );
              },
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

    //
    provider.getFoodList();
    singleFoodList = provider.throwFoodModleList;

    //
    provider.getBurgerCategoriesList();
    burgerCategoriesList = provider.throwBurgerCategoriesList;

    //
    provider.getrecipeCategoriesList();
    recipeCategoriesList = provider.throwRecipeCategoriesList;

    //
    provider.getPizzaCategoriesList();
    pizzaCategoriesList = provider.throwPizzaCategoriesList;

    //
    provider.getDrinkCategoriesList();
    drinkCategoriesList = provider.throwDrinkCategoriesList;

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
              children: singleFoodList
                  .map(
                    (e) => BottomContainer(
                      image: e.image,
                      price: e.price,
                      name: e.name,
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => DetailPage(
                              image: e.image,
                              name: e.name,
                              price: e.price,
                            ),
                          ),
                        );
                      },
                    ),
                  )
                  .toList(),
              // children: [
              //   bottonContainer(
              //     image: 'images/1.png',
              //     name: 'burger1',
              //     price: 12,
              //   ),
              //   bottonContainer(
              //     image: 'images/1.png',
              //     name: 'burger1',
              //     price: 12,
              //   ),
              //   bottonContainer(
              //     image: 'images/1.png',
              //     name: 'burger1',
              //     price: 12,
              //   ),
              //   bottonContainer(
              //     image: 'images/1.png',
              //     name: 'burger1',
              //     price: 12,
              //   ),
              // ],
            ),
          )
        ],
      ),
    );
  }
}

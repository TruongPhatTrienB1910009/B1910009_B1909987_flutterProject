import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:orderfood/models/categories_modle.dart';
import 'package:orderfood/models/food_modle.dart';

class MyProvider extends ChangeNotifier {
  List<CategoriesModle> burgerList = [];
  late CategoriesModle burgerModle;
  Future<void> getBurgerCategory() async {
    List<CategoriesModle> newBurgerList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('v8DWTDXufnJ7dEvmEp3F')
        .collection('burger')
        .get();
    querySnapshot.docs.forEach((element) {
      burgerModle = CategoriesModle(
        image: element['image'],
        name: element['name'],
      );
      print(burgerModle.name);
      newBurgerList.add(burgerModle);
      burgerList = newBurgerList;
    });
  }

  get throwBurgerList {
    return burgerList;
  }

  //////////////////////////// 2nd categories ////////////////////
  List<CategoriesModle> recipeList = [];
  late CategoriesModle recipeModle;
  Future<void> getRecipeCategory() async {
    List<CategoriesModle> newRecipeList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('v8DWTDXufnJ7dEvmEp3F')
        .collection('recipe')
        .get();
    querySnapshot.docs.forEach((element) {
      recipeModle = CategoriesModle(
        image: element['image'],
        name: element['name'],
      );
      print(recipeModle.name);
      newRecipeList.add(recipeModle);
      recipeList = newRecipeList;
    });
  }

  get throwRecipeList {
    return recipeList;
  }

  //////////////////////////// 3nd categories ////////////////////
  List<CategoriesModle> pizzaList = [];
  late CategoriesModle pizzaModle;
  Future<void> getPizzaCategory() async {
    List<CategoriesModle> newPizzaList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('v8DWTDXufnJ7dEvmEp3F')
        .collection('pizza')
        .get();
    querySnapshot.docs.forEach((element) {
      pizzaModle = CategoriesModle(
        image: element['image'],
        name: element['name'],
      );
      print(pizzaModle.name);
      newPizzaList.add(pizzaModle);
      pizzaList = newPizzaList;
    });
  }

  get throwPizzaList {
    return pizzaList;
  }

  //////////////////////////// 4nd categories ////////////////////
  List<CategoriesModle> drinkList = [];
  late CategoriesModle drinkModle;
  Future<void> getDrinkCategory() async {
    List<CategoriesModle> newDrinkList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('v8DWTDXufnJ7dEvmEp3F')
        .collection('drink')
        .get();
    querySnapshot.docs.forEach((element) {
      drinkModle = CategoriesModle(
        image: element['image'],
        name: element['name'],
      );
      print(drinkModle.name);
      newDrinkList.add(drinkModle);
      drinkList = newDrinkList;
    });
  }

  get throwDrinkList {
    return drinkList;
  }

/////////////////////////////////////////////////////////////////

  List<FoodModle> foodModeList = [];
  late FoodModle foodModle;
  Future<void> getFoodList() async {
    List<FoodModle> newFoodModleList = [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('food').get();
    querySnapshot.docs.forEach((element) {
      foodModle = FoodModle(
        image: element['image'],
        name: element['name'],
        price: element['price'],
      );
      print(drinkModle.name);
      newFoodModleList.add(foodModle);
      newFoodModleList = newFoodModleList;
    });
  }

  get throwFoodModleList {
    return foodModeList;
  }
}

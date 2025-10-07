import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin notifications = FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const AndroidInitializationSettings initSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  final InitializationSettings initSettings =
      InitializationSettings(android: initSettingsAndroid);
  try {
    await notifications.initialize(initSettings);
  } catch (e) {}
  runApp(const MessMenuApp());
}

class MessMenuApp extends StatelessWidget {
  const MessMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mess Menu',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const MessMenuScreen(),
    );
  }
}

class MessMenuScreen extends StatelessWidget {
  const MessMenuScreen({super.key});

  final Map<String, Map<String, String>> menu = const {
    'Monday': {
      'Breakfast':
          'Aloo Paratha, Curd, Pickle / Veg Upma / Egg Bhurji / Tea, Milk, Coffee / Bread, Butter, Jam',
      'Lunch':
          'Phulkas, Rajma Curry, Plain Rice, Rasam, Beetroot Poriyal, Curd / Chicken Gravy (Non-Veg Option)',
      'Snacks': 'Panipuri / Dahipuri / Tea, Coffee, Milk',
      'Dinner':
          'Roti, Tomato Egg Gravy / Dosa, Sambar, Mint Chutney / White Rice, Rasam, Dry Kovakkai Poriyal, Butter Milk / Salad (Carrot, Cucumber, Tomato) / Fruit (Papaya), Milk'
    },
    'Tuesday': {
      'Breakfast':
          'Idly, Vada, Sambar, Chutney / Veg Egg Masala / Tea, Milk, Coffee / Bread, Butter, Jam',
      'Lunch':
          'Brinjal Kara Kuzhambu, Phulkas, White Rice, Rasam, Kootu, Beans Poriyal, Curd / Chicken Manchurian (Non-Veg Option)',
      'Snacks': 'Mysore Bonda / Sambar Vada / Tea, Coffee, Milk',
      'Dinner':
          'Chole Bhature, Channa Masala, Mirchi Raitha / Lemon Sevai, Tomato Sevai, Pottukadalai Chutney / White Rice, Rasam, Gobi 65, Butter Milk / Salad (Carrot, Beetroot, Cucumber) / Milk'
    },
    'Wednesday': {
      'Breakfast':
          'Pongal / Uthappam / Wheat Upma, Coconut Chutney / Paruppu Vada / Gobi Paratha, Curd, Pickle / Omelette / Tea, Milk, Coffee / Bread, Butter, Jam',
      'Lunch':
          'Phulka, Bhindi Fry, Jeera Rice, Rasam, Dal, Thovayal, Pickle, Papad, Curd / Chicken Tikka (Non-Veg Option)',
      'Snacks': 'Burger / Cutlet with Sauce / Tea, Coffee, Milk',
      'Dinner':
          'Phulka, Mushroom Masala / Podi Dosa, Sambar, Groundnut Chutney / White Rice, Rasam, Dry Vazhakkai Poriyal, Butter Milk / Milk, Salad, Ice Cream'
    },
    'Thursday': {
      'Breakfast':
          'Thin Onion Dosa, Sambar, Chutney, Medu Vada / Poori, Chana Masala, Aloo Masala / Scrambled Egg / Tea, Milk, Coffee / Bread, Butter, Jam',
      'Lunch':
          'Chapathi, Paneer Butter Masala, Lemon Rice, Curd Rice, Papad, Ghee, Thovayal, Pickle / Chicken Curry (Non-Veg Option)',
      'Snacks': 'Bread Pakoda / Samosa, Green Chutney / Tea, Coffee, Milk',
      'Dinner':
          'Brinjal Biryani / Veg Biryani, Raitha, French Fries / Chapathi, Egg Gravy / White Rice, Rasam, Mixed Veg Poriyal, Butter Milk / Fruit Salad / Milk, Gulab Jamun'
    },
    'Friday': {
      'Breakfast':
          'Carrot Uttappam, Sambar, Onion Tomato Chutney / Veg Khichadi or Sabudana Khichadi with Carrot and Beans, Curd / French Toast / Tea, Milk, Coffee / Wheat Bread, Butter, Jam',
      'Lunch':
          'Phulka, Bhaji, White Rice, Moor Kulambu, Potato Fry, Curd, Pickle / Chicken Curry (Non-Veg Option)',
      'Snacks': 'Boiled Sweet Corn with Masala / Tea, Coffee, Milk',
      'Dinner':
          'Wheat Paratha (Chettinad Chicken Gravy / Butter Chicken) / Millet Idly, Chilli Idly, Sambar, Tomato Chutney / White Rice, Rasam, Butter Milk / Salad, Rose Milk / Badam Milk'
    },
    'Saturday': {
      'Breakfast':
          'Gobi Paratha / Paneer Paratha, Curd, Pickle / Pongal, Coconut Chutney, Sambar, Vada / Boiled Egg / Tea, Milk, Coffee / Bread, Butter, Jam',
      'Lunch':
          'Chapathi, Veg Kurma, Lemon Rice, Poriyal, Papad, Pickle / Egg Masala (Non-Veg Option)',
      'Snacks': 'Masala Puri / Veg Noodles / Tea, Coffee, Milk',
      'Dinner':
          'Red Pasta / Dahi Papdi Chat / Tea, Coffee, Milk / Phulka, Veg Sabji, Dal Makhani / Onion Podi Uttappam, Sambar, Kara Chutney / White Rice, Sambar, Tomato Rasam, Carrot Poriyal / Butter Milk, Salad'
    },
    'Sunday': {
      'Breakfast':
          'White Puttu / Ragi Puttu / Kadala Curry / Grated Coconut, Banana, Sugar, Ghee / Pav Bhaji, Masala, Chopped Onions / Tea, Milk, Coffee / Bread, Butter, Jam',
      'Lunch':
          'Chicken Biryani, Onion Raitha / Dindukkal Chicken Gravy / Brinjal Curry / Boiled Egg / Pulka, Mutton Curry / White Rice, Rasam, Curd',
      'Snacks': 'Tea, Coffee, Milk',
      'Dinner':
          'Phulka, Veg Subji, Dal Makhani / Onion Podi Uttappam, Sambar, Kara Chutney / White Rice, Sambar, Tomato Rasam, Carrot Poriyal / Butter Milk, Salad, Milk'
    },
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mess Menu')),
      body: ListView(
        children: menu.entries.map((day) {
          return Card(
            margin: const EdgeInsets.all(8),
            child: ExpansionTile(
              title: Text(day.key),
              children: day.value.entries.map((meal) {
                return ListTile(
                  title: Text(meal.key),
                  subtitle: Text(meal.value),
                );
              }).toList(),
            ),
          );
        }).toList(),
      ),
    );
  }
}

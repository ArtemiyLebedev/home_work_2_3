import 'package:flutter/material.dart';

class NavigationDemo extends StatefulWidget {
  const NavigationDemo({Key? key}) : super(key: key);

  @override
  _NavigationDemoState createState() => _NavigationDemoState();
}

class _NavigationDemoState extends State<NavigationDemo> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: const MainScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainScreen(),
        '/contacts': (context) => const SecondScreen(),
      },
    );
  }
}

Widget navDrawer(context) => Drawer(
  child: ListView(padding: EdgeInsets.zero, children: [
    DrawerHeader(
      decoration: const BoxDecoration(
        color: Colors.blue,
      ),
      child: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height : 100,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50.0))
              ),
              child: Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/330px-Google-flutter-logo.svg.png"),
            ),
            const Text("Навигация во Flutter")
          ],
        ),
      ),
    ),
    ListTile(
      leading: const Icon(Icons.one_k),
      title: const Text("Главная"),
      onTap: () {
        //Navigator.pop(context);
        Navigator.pushNamed(context, '/');
      },
    ),
    const Divider(),
    ListTile(
      leading: const Icon(Icons.two_k),
      title: const Text("Виджеты"),
      onTap: () {
        Navigator.pushNamed(context, '/contacts');
      },
    ),
    const Divider(),
    ListTile(
      leading: const Icon(Icons.two_k),
      title: const Text("Библиотеки"),
      onTap: () {},
    ),

  ]),
);

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle =
    TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);

    return Scaffold(
      appBar: AppBar(
          title: const Text('Главная'),
           actions: <Widget>[
             IconButton(
                 tooltip: "Домашняя страница",
                 onPressed: () {},
                 icon: const Icon(Icons.account_balance)
             ),
          IconButton(
              tooltip: "Настройки",
              onPressed: () {},
              icon: const Icon(Icons.settings)),

          TextButton(
            onPressed: () {},
            child: const Text("Профиль"),
            style: buttonStyle,
          ),
        ],

      ),

      drawer: navDrawer(context),
      body: const Center(
        child: Text('Главная станица'),
      )
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Виджеты')),
        drawer: navDrawer(context),
        body: const Center(
          child: Text('Виджеты'),
        ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: 'Избранное'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance), label: 'Дом.страница'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Настройки'),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:oxy_boot/generated/menu_item.dart';

class MenuItems {
  static const home = MenuItemClass(
      Icons.home_outlined, 'Home', 'assets/icons/home_ic.png', false);
  static const profile = MenuItemClass(
      Icons.person_outline, 'Profile', 'assets/icons/user_ic.png', false);
  static const cart =
      MenuItemClass(Icons.person, 'My Cart', 'assets/icons/bag_ic.png', false);
  static const favourite = MenuItemClass(Icons.favorite_border, 'Favourite',
      'assets/icons/favourite_ic.png', false);
  static const notification = MenuItemClass(Icons.person_outline,
      'Notification', 'assets/icons/notify_ic.png', false);
  static const signout =
      MenuItemClass(Icons.logout_outlined, 'Sign Out', '', true);

  static const all = <MenuItemClass>[
    profile,
    home,
    cart,
    favourite,
    notification,
    signout
  ];
}

class MenuScreen extends StatelessWidget {
  final MenuItemClass currentItem;
  final ValueChanged<MenuItemClass> onSelectedItem;

  const MenuScreen(
      {super.key, required this.currentItem, required this.onSelectedItem});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1A2530),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Container(
                margin: const EdgeInsets.only(left: 15, bottom: 15),
                height: 120,
                width: 120,
                decoration: const BoxDecoration(),
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 15,
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            color:const Color.fromARGB(255, 95, 110, 124),
                            borderRadius: BorderRadius.circular(70)),
                      ),
                    ),
                    Positioned(
                        top: 2,
                        left: 18,
                        child: SizedBox(
                          height: 52,
                          width: 52,
                          child: Image.asset(
                            'assets/images/icons8-person-48.png',
                            fit: BoxFit.contain,
                          ),
                        )),
                    const Positioned(
                        bottom: 25,
                        left: 5,
                        child: Text(
                          'Hey, 👋',
                          style: TextStyle(
                              color: Color(0xff707B81),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        )),
                    const Positioned(
                        bottom: 0,
                        left: 5,
                        child: Text(
                          'Boss Njugush',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w500),
                        ))
                  ],
                )),
            ...MenuItems.all.map(buildMenuItem).toList(),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(MenuItemClass item) {
    return ListTileTheme(
      selectedColor: Colors.white,
      child: ListTile(
        selectedTileColor: Colors.black26,
        selected: currentItem == item,
        minLeadingWidth: 25,
        leading: item.isIcon
            ? Icon(
                item.icon,
                color: const Color(0xff707B81),
                size: 24,
              )
            : Image.asset(
                item.image!,
                color: const Color(0xff707B81),
                height: 24,
              ),
        title: Text(
          item.title,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
        onTap: () => onSelectedItem(item),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:web_gnom/core/app/store/auth/user_data.dart';

class CartListItem extends StatelessWidget {
  const CartListItem(
      {super.key,
      required this.path,
      required this.name,
      required this.price,
      required this.userData,
      required this.icon,
      this.onClick,
      required this.count,
      this.onClickPlus,
      this.onClickMinus});
  final String path;
  final String name;
  final String price;
  final String count;
  final UserData userData;
  final IconData icon;
  final VoidCallback? onClick;
  final VoidCallback? onClickPlus;
  final VoidCallback? onClickMinus;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(30))),
      margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
      padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                  width: 200,
                  height: 200,
                  child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30)),
                      child: Image.asset(
                        path,
                        fit: BoxFit.fill,
                      ))),
              Container(
                  margin: const EdgeInsets.only(left: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 25,
                          fontFamily: 'Nekst',
                        ),
                      )
                    ],
                  ))
            ],
          ),
          Row(
            children: [
              IconButton(
                  onPressed: onClickMinus,
                  icon: const Icon(size: 50, Icons.remove_rounded)),
              Container(
                margin: const EdgeInsets.only(right: 15, left: 15),
                child: Text(
                  count,
                  style: const TextStyle(
                    fontSize: 25,
                    fontFamily: 'Nekst',
                  ),
                ),
              ),
              IconButton(
                  onPressed: onClickPlus,
                  icon: const Icon(size: 50, Icons.add_rounded)),
              Container(
                margin: const EdgeInsets.only(right: 15, left: 15),
                child: Text(
                  '$price\$',
                  style: const TextStyle(
                    fontSize: 25,
                    fontFamily: 'Nekst',
                  ),
                ),
              ),
              IconButton(onPressed: onClick, icon: Icon(size: 50, icon))
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../constant/strings.dart';
import '../constant/textStyle.dart';
import 'add_task_bottom_sheet.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Text(''),
      actions: [
        IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => AddTaskBottomSheet(
                  // onAddTask: () {},
                  ),
            );
          },
          icon: CircleAvatar(
            child: Icon(Icons.add),
          ),
        ),
        SizedBox(width: 16),
      ],
      title: Text(
        homePage,
        style: TextStyles.headingStyle,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

import 'package:flutter/material.dart';

class RoleSelectionWidget extends StatelessWidget {
  final String selectedRole;
  final Function(String) onRoleSelected;

  RoleSelectionWidget({
    required this.selectedRole,
    required this.onRoleSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildRoleImage('All', 'All_icon.webp'),
        buildRoleImage('Top', 'Baron_icon.webp'),
        buildRoleImage('Mid', 'Mid_icon.webp'),
        buildRoleImage('Jungle', 'Jungle_icon.webp'),
        buildRoleImage('ADC', 'Dragon_icon.webp'),
        buildRoleImage('Support', 'Support_icon.webp'),
      ],
    );
  }

  Widget buildRoleImage(String role, String imageName) {
    return GestureDetector(
      onTap: () {
        onRoleSelected(role);
      },
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: selectedRole == role ? Colors.blue : Colors.transparent,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          children: [
            Image.asset(
              'assets/$imageName',
              width: 30,
              height: 30,
            ),
            // Image.asset(
            //   'roles/$imageName',
            //   width: 30,
            //   height: 30,
            // ),
            SizedBox(height: 4),
            Text(
              role,
              style: TextStyle(
                fontWeight:
                    selectedRole == role ? FontWeight.bold : FontWeight.normal,
                color: selectedRole == role ? Colors.blue : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

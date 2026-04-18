import 'package:flutter/material.dart';
import 'package:guardly/features/screens/Parent_Dashboard/p_home/model/header_section_model.dart';

class HeaderSection extends StatefulWidget {
  final UserModel user;
  final List<UserModel> children;
  final Function(UserModel) onSelect;

  const HeaderSection({
    super.key,
    required this.user,
    required this.children,
    required this.onSelect,
  });

  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              // SELECTED CHILD
              InkWell(
                onTap: () {
                  setState(() {
                    isOpen = !isOpen;
                  });
                },
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(widget.user.imageUrl),
                    ),
                    const SizedBox(width: 10),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Child Profile selected:",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          Text(
                            widget.user.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Icon(
                      isOpen
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                    ),
                  ],
                ),
              ),

              // DROPDOWN LIST
              if (isOpen) ...[
                const SizedBox(height: 10),

                Column(
                  children: [
                    ...widget.children.map((child) {
                      return ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 0,
                        ),
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(child.imageUrl),
                        ),
                        title: Text(child.name),
                        onTap: () {
                          widget.onSelect(child);

                          setState(() {
                            isOpen = false;
                          });
                        },
                      );
                    }),

                    // ✅ ADD CHILD inside dropdown
                    ListTile(
                      leading: const Icon(Icons.person_add, color: Colors.teal),
                      title: const Text(
                        "Add Another Child",
                        style: TextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

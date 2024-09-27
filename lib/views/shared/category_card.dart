import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomIconButton extends StatelessWidget {
  final String iconPath;
  final String label;
  final double size;
  final double padding;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomIconButton({
    Key? key,
    required this.iconPath,
    required this.label,
    this.size = 24.0,
    this.padding = 16.0,
    this.isSelected = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(1000),
            ),
            padding: EdgeInsets.all(padding),
            child: SvgPicture.asset(
              iconPath,
              width: size,
              height: size,
              color: isSelected
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}

class CategoryCardList extends StatefulWidget {
  final List<Map<String, String>> categories; // Specify the type more precisely
  const CategoryCardList({super.key, required this.categories});

  @override
  _CategoryCardListState createState() => _CategoryCardListState();
}

class _CategoryCardListState extends State<CategoryCardList> {

  int _selectedIndex = 0;

  void _onIconButtonTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categories.length,
        itemBuilder: (context, index) {
          final iconPath = widget.categories[index]['icon'] ?? '';
          final label = widget.categories[index]['label'] ?? '';

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CustomIconButton(
              iconPath: iconPath,
              label: label,
              isSelected: _selectedIndex == index,
              onTap: () => _onIconButtonTapped(index),
            ),
          );
        },
      ),
    );
  }
}

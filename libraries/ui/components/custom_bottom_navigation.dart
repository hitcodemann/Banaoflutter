import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:routine/utils/app_colors.dart';

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onSelected,
  });

  final List<CustomBottomNavigationItem> items;
  final int selectedIndex;
  final SelectedCallback onSelected;

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56 + MediaQuery.of(context).viewPadding.bottom,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.black12, blurRadius: 2),
      ], color: Colors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: widget.items.map((item) {
          var index = widget.items.indexOf(item);
          return Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                widget.onSelected(index);
              },
              child: Ink(
                child: Column(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: double.infinity,
                      height: 2,
                      color: widget.selectedIndex == index
                          ? AppColors.primary
                          : Colors.transparent,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          item.label == "Profile"
                              ? Container(
                                  height: 24,
                                  width: 24,
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 1,
                                      color: widget.selectedIndex == index
                                          ? AppColors.primary
                                          : AppColors.primary.withOpacity(0.5),
                                    ),
                                  ),
                                  child: const Image(
                                      image: AssetImage(
                                          "assets/images/profile.png")),
                                )
                              : SvgPicture.asset(
                                  item.iconPath,
                                  colorFilter: ColorFilter.mode(
                                      widget.selectedIndex == index
                                          ? AppColors.primary
                                          : AppColors.greyDarker,
                                      BlendMode.srcATop),
                                ),
                          Text(
                            item.label,
                            style: GoogleFonts.inter(
                                color: widget.selectedIndex == index
                                    ? AppColors.primary
                                    : AppColors.greyDark,
                                fontSize: 10,
                                fontWeight: widget.selectedIndex == index
                                    ? FontWeight.w600
                                    : FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

typedef SelectedCallback = void Function(int index);

class CustomBottomNavigationItem {
  final String label;
  final String iconPath;

  CustomBottomNavigationItem({
    required this.iconPath,
    required this.label,
  });
}

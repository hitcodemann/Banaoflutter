import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:routine/models/programs.dart';
import 'package:routine/ui/components/space.dart';

import '../../utils/app_colors.dart';
import '../animations/tap_bounce.dart';

class ProgramsPresenterDashboard extends StatelessWidget {
  const ProgramsPresenterDashboard(
      {super.key, required this.onViewAllTap, required this.programs});

  final VoidCallback onViewAllTap;
  final Programs programs;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Programs for you",
                style: GoogleFonts.lora(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.greyDarkest,
                ),
              ),
              SizedBox(
                height: 24,
                width: 70,
                child: TapBounce(
                  onTap: onViewAllTap,
                  child: Row(
                    children: [
                      Text(
                        "View all",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: AppColors.greyDarker),
                      ),
                      Container(
                        height: 24,
                        width: 24,
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                            "assets/icons/ic_forward_arrow.svg",
                            width: 13),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 285,
          child: ListView.separated(
            itemCount: programs.items.length > 7 ? 7 : programs.items.length,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return imageCard(
                onTap: () {},
                imagePath: "assets/images/image_1.png",
                category: programs.items[index].category,
                name: programs.items[index].name,
                lessonCount: programs.items[index].lesson,
              );
            },
            separatorBuilder: (context, index) => const Space(horizontal: 16),
          ),
        ),
      ],
    );
  }

  Widget imageCard({
    required VoidCallback onTap,
    required String imagePath,
    required String category,
    required String name,
    required int lessonCount,
  }) {
    return TapBounce(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 5),
        width: 242,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(color: AppColors.greyLighter, blurRadius: 5),
            ],
            border: Border.all(width: 1, color: AppColors.greyLighter)),
        child: Column(
          children: [
            Image(
              image: AssetImage(imagePath),
              height: 140,
              width: 242,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      category.toUpperCase(),
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          color: AppColors.primary),
                    ),
                    const Space(vertical: 16),
                    Expanded(
                      child: Text(
                        name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Colors.black),
                      ),
                    ),
                    const Space(vertical: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "$lessonCount lessons",
                          style: GoogleFonts.inter(
                              color: AppColors.greyDarker,
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

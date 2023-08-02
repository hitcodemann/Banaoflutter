import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:routine/controllers/lessons_controller.dart';
import 'package:routine/models/lessons.dart';

import '../../utils/app_colors.dart';
import '../animations/tap_bounce.dart';
import '../components/space.dart';

class LessonsScreen extends StatefulWidget {
  const LessonsScreen({super.key});

  @override
  State<LessonsScreen> createState() => _LessonsScreenState();
}

class _LessonsScreenState extends State<LessonsScreen> {
  LessonsController lessonsController = LessonsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.greyDarkest),
        title: const Text("Lessons"),
        titleTextStyle: GoogleFonts.lora(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: AppColors.greyDarkest),
        backgroundColor: AppColors.lightPrimary,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: lessonsController.getLessons(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              Lessons lessons = snapshot.data!;
              return ListView.separated(
                itemCount: lessons.count,
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return makeCard(item: lessons.items[index]);
                },
                separatorBuilder: (context, index) => const Space(vertical: 8),
              );
            }
          }
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
              strokeWidth: 2,
            ),
          );
        },
      ),
    );
  }

  Widget makeCard({required Item item}) {
    return TapBounce(
      onTap: () {},
      child: Container(
        height: 120,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: AppColors.greyLighter,
              blurRadius: 5,
            ),
          ],
          border: Border.all(width: 1, color: AppColors.greyLighter),
        ),
        child: Row(
          children: [
            const AspectRatio(
              aspectRatio: 1,
              child: Image(
                image: AssetImage("assets/images/image_2.png"),
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      item.category.toUpperCase(),
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          color: AppColors.primary),
                    ),
                    Text(
                      item.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${item.duration} min",
                          style: GoogleFonts.inter(
                              color: AppColors.greyDarker,
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        ),
                        if (item.locked)
                          SvgPicture.asset("assets/icons/ic_lock.svg"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

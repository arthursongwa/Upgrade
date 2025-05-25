import 'package:flutter/material.dart';
import '../../core/colors.dart';
import '../../core/constant.dart';
import '../../core/typography.dart';
import '../../data/models/mealLog_model.dart';
import '../../data/models/aliment_model.dart';

class TodayData extends StatefulWidget {
  final MealLogModel mealLog;

  const TodayData({super.key, required this.mealLog});

  @override
  State<TodayData> createState() => _TodayDataState();
}

class _TodayDataState extends State<TodayData> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Aujourd'hui", style: AppTypography.button),
        SizedBox(height: AppSpacing.md),
        Container(
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          child: Column(
            children: [
              lineData(title: "Petit dej", mealKey: "breakfast", value: 332),
              lineData(title: "Dejeuner", mealKey: "lunch", value: 832),
              lineData(title: "Diner", mealKey: "dinner", value: 232),
              lineData(title: "Collation", mealKey: "snack", value: 0),
            ],
          ),
        ),
        SizedBox(height: AppSpacing.md),
        Container(
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(AppRadius.md),
            border: Border(
              bottom: BorderSide(color: AppColors.background, width: 2),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppSpacing.md,
              horizontal: AppSpacing.lg,
            ),
            child: Row(
              children: [
                Text("Entrainements", style: AppTypography.body),
                Spacer(),
                Text(
                  "45min % 350kcal",
                  style: AppTypography.smallText.copyWith(
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget lineData({
    required String title,
    required String mealKey,
    int value = 0,
  }) {
    List<AlimentModel> aliments = widget.mealLog.meals[mealKey] ?? [];
    String content = aliments.map((a) => a.name).join(', ');
    int totalCalories = aliments.fold(0, (sum, a) => sum + a.calories);

    Widget line = Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.background, width: 2),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: AppSpacing.sm,
          left: AppSpacing.lg,
          right: AppSpacing.lg,
          bottom: AppSpacing.md,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(title, style: AppTypography.body),
                Spacer(),
                Text(
                  totalCalories.toString() + " Kcal",
                  style: AppTypography.smallText.copyWith(
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSpacing.xs),
            Row(
              children: [
                Text(content!, style: AppTypography.smallText),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    print("Ajout d'un repas popup");
                    // Ou Navigator.push(...)
                  },
                  child: Text(
                    "+Ajouter un repas",
                    style: AppTypography.smallText.copyWith(
                      color: AppColors.greenLight,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    return line;
  }

  Widget lineData2(String title, {int? value}) {
    Widget line = Container(
      child: Row(
        children: [
          Text(title, style: AppTypography.smallText),
          Spacer(),
          value == null
              ? Text(
                "+Ajouter un repas",
                style: AppTypography.smallText.copyWith(
                  color: AppColors.greenLight,
                ),
              )
              : Text(
                value.toString() + " Kcal",
                style: AppTypography.smallText,
              ),
        ],
      ),
    );
    return line;
  }
}

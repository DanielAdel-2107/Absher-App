import 'package:absher_app/core/styles/app_text_styles.dart';
import 'package:absher_app/features/models/explanation_model.dart';
import 'package:absher_app/features/user/profile/screens/details_screen.dart';
import 'package:flutter/material.dart';

class Ro2yaDetailsTab extends StatelessWidget {
  const Ro2yaDetailsTab({super.key, required this.explanationModelList});

  final List<ExplanationModel>? explanationModelList;
  @override
  Widget build(BuildContext context) {
    return explanationModelList == null
        ? Center(child: CircularProgressIndicator())
        : explanationModelList!.isEmpty
            ? Center(
                child: Text(
                "لا يوجد رؤيا",
                style: AppTextStyles.title28Brown,
              ))
            : ListView.builder(
                itemCount: explanationModelList!.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.all(8),
                    child: ListTile(
                      title: Text(explanationModelList![index].ro2yaName),
                      subtitle: Text(explanationModelList![index].ro2ya),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              explanationModel: explanationModelList![index],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
  }
}

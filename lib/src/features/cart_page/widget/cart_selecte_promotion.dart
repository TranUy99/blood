
import 'package:flutter/material.dart';
import '../../../core/model/promotion.dart';
import '../../../core/remote/response/promotion_response/promotion_response.dart';
import '../../profile/widget/hexagon_discount.dart';
import '../../promotion/view_model/promotion_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SelectedPromotionCard extends StatefulWidget {
  int? selectedPromotionIndex;
  final Function(int?) onAddressSelected;
  SelectedPromotionCard({this.selectedPromotionIndex, required this.onAddressSelected, Key? key})
      : super(key: key);

  @override
  State<SelectedPromotionCard> createState() => _SelectedPromotionCardState();
}

class _SelectedPromotionCardState extends State<SelectedPromotionCard> {
  PromotionViewModel promotionViewModel = PromotionViewModel();
  List<PromotionDTO> promotionList = [];
  PromotionDTO? promotion;
  PromotionResponse? promotionResponse;
  int currentPage = 0;
  int limit = 2;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PromotionResponse?>(
      future: promotionViewModel.getPromotion(0, 100),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Container();
        } else {
          if (snapshot.hasData) {
            promotionList = snapshot.data!.contents!;
            // Build UI using the retrieved products
            return buildUI(context);
          } else {
            return const Text('No promotion ');
          }
        }
      },
    );
  }

  Widget buildUI(BuildContext context) {
     final List<int?> promotionNames =
                    promotionList.map((promotion) => promotion.discountDTO).toList();
    return Row(children: [
      Text(AppLocalizations.of(context)!.discount.toUpperCase(),
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      const SizedBox(
        width: 100
      ),
      SizedBox(
          height: 50,
          child: DropdownButtonHideUnderline(
              child: DropdownButton<int?>(
            menuMaxHeight: MediaQuery.of(context).size.height * 0.5,
            hint: const Text("Promotion"),
            value: promotion?.discountDTO,
            onChanged: (value) {
              setState(() {
                promotion =
                    promotionList.firstWhere((promotion) => promotion.discountDTO == value);
              });

              if (promotion != null && promotion is PromotionDTO) {
                setState(() {
                  widget.selectedPromotionIndex = promotion?.id;
                  widget.onAddressSelected(promotion?.id!);
                });
              }
            },
            items: promotionNames
                .map((name) => DropdownMenuItem(
                      value: name,
                      child:  Row(
                        children: [
                        
                          HexagonPage(
                            height: MediaQuery.of(context).size.height * 0.07,
                            discount: name,
                          ),
                          
                        ],
                      ),
                    ))
                .toList(),
          )))
    ]);
  }
}

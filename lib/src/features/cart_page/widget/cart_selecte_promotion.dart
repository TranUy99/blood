import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/model/promotion.dart';
import '../../profile/widget/hexagon_discount.dart';
import '../../promotion/view_model/promotion_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../bloc/cart_bloc.dart';

class SelectedPromotionCard extends StatefulWidget {
  SelectedPromotionCard({Key? key}) : super(key: key);

  @override
  State<SelectedPromotionCard> createState() => _SelectedPromotionCardState();
}

class _SelectedPromotionCardState extends State<SelectedPromotionCard> {
  PromotionViewModel promotionViewModel = PromotionViewModel();
  List<PromotionDTO> promotionList = [];
  PromotionDTO? promotion;
  int currentPage = 0;
  int limit = 2;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadPromotionData();
  }

  Future<void> _loadPromotionData() async {
    final response = await promotionViewModel.getPromotion(0, 100);
    if (response != null && response.contents != null) {
      setState(() {
        promotionList = response.contents!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return buildUI(context);
  }

  Widget buildUI(BuildContext context) {
    return Row(
      children: [
        Text(
          AppLocalizations.of(context)!.discount.toUpperCase(),
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 50),
        BlocBuilder<SelectedPromotionCubit, int>(
          builder: (context, selectedPromotionId) {
            return SizedBox(
              height: 50,
              width: 220,
              child: DropdownButtonHideUnderline(
                child: DropdownButton<int>(
                  menuMaxHeight: MediaQuery.of(context).size.height * 0.5,
                  hint: const Text("Promotion"),
                  value: selectedPromotionId == 0
                      ? promotion?.id
                      : selectedPromotionId, // Set initial value to promotion's id
                  onChanged: (value) {
                    promotion = promotionList.firstWhere((promotion) => promotion.id == value);

                    setState(() {
                      context.read<SelectedPromotionCubit>().setSelectedPromotionIndex(value!);
                    });
                  },
                  items: promotionList
                      .map(
                        (promotion) => DropdownMenuItem<int>(
                          value: promotion.id,
                          child: SizedBox(
                            width: 190,
                            child: Row(
                              children: [
                                HexagonPage(
                                  height: MediaQuery.of(context).size.height * 0.07,
                                  discount: promotion.discountDTO,
                                ),
                                const Text(
                                  '   discount for orders ',
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

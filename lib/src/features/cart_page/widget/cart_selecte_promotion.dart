import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mobile_store/src/constant/color/color.dart';
import '../../../core/model/promotion.dart';
import '../../profile/widget/hexagon_discount.dart';
import '../../promotion/view_model/promotion_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../bloc/cart_bloc.dart';
import '../bloc/cart_state.dart';
import '../view/cart_page.dart';
import '../view_model/cart_view_model.dart';

class SelectedPromotionCard extends StatefulWidget {
  SelectedPromotionCard({Key? key}) : super(key: key);

  @override
  State<SelectedPromotionCard> createState() => _SelectedPromotionCardState();
}

class _SelectedPromotionCardState extends State<SelectedPromotionCard> {
  PromotionViewModel promotionViewModel = PromotionViewModel();
  CartViewModel cartViewModel = CartViewModel();
  List<PromotionDTO> promotionList = [];
  PromotionDTO? promotion;
  int currentPage = 0;
  int limit = 2;
  bool isLoading = false;

  final textCurrency = NumberFormat("#,###.###", "en_US");
  @override
  void initState() {
    super.initState();
    _loadPromotionData();
  }

  void _deleteSelectedPromotion() {
    context.read<SelectedPromotionCubit>().resetState();

    promotion = null;
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            AppLocalizations.of(context)!.discount.toUpperCase(),
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: BlocBuilder<SelectedPromotionCubit, int>(
            builder: (context, selectedPromotionId) {
              return FutureBuilder(
                future: cartViewModel.totalPay(),
                builder: (context, getData) {
                  if (getData.connectionState == ConnectionState.waiting) {
                    return const Center(
                      
                    );
                  } else
                   if (getData.hasError) {
                    return Text('Error: ${getData.error}');
                  } else {
                    return StreamBuilder<GetPriceCartState>(
                      initialData: GetPriceCartState(getData.data!),
                      stream: CartPage.cartBloc.getPriceStateController.stream,
                      builder: (context, snapshot) {
                        double? price = snapshot.data?.price;
                        final eligiblePromotions = promotionList
                            .where((promotion) => promotion.totalPurchaseDTO! < price!)
                            .toList();
                        return Row(
                          children: [
                            DropdownButtonHideUnderline(
                              child: DropdownButton<int>(
                                menuMaxHeight: MediaQuery.of(context).size.height * 0.5,
                                hint: const Text("Promotion"),
                                value:
                                    selectedPromotionId == 0 ? promotion?.id : selectedPromotionId,
                                onChanged: (value) {
                                  if (value == 0) {
                                    _deleteSelectedPromotion();
                                  } else {
                                    promotion = eligiblePromotions
                                        .firstWhere((promotion) => promotion.id == value);
                                    context
                                        .read<SelectedPromotionCubit>()
                                        .setSelectedPromotionIndex(value!);
                                  }
                                },
                                items: eligiblePromotions
                                    .map(
                                      (promotion) => DropdownMenuItem<int>(
                                        value: promotion.id,
                                        child: SizedBox(
                                          width: MediaQuery.of(context).size.width * 0.65,
                                          child: Row(
                                            children: [
                                              HexagonPage(
                                                height: MediaQuery.of(context).size.height * 0.07,
                                                discount: promotion.discountDTO,
                                              ),
                                              Flexible(
                                                child: Text(
                                                  '  discount upto ${textCurrency.format(promotion.maxGetDTO)} Vnd',
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                            selectedPromotionId != 0
                                ? IconButton(
                                    icon: const Icon(
                                      Icons.cancel_outlined,
                                      color: kRedColor,
                                    ),
                                    onPressed: () {
                                      _deleteSelectedPromotion();
                                    },
                                  )
                                : Container()
                          ],
                        );
                      },
                    );
                  }
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

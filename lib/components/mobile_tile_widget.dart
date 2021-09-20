import 'package:flutter/material.dart';
import 'package:mobile_buyer_flutter/bloc/bloc_provider.dart';
import 'package:mobile_buyer_flutter/bloc/favorite_bloc.dart';
import 'package:mobile_buyer_flutter/bloc/phone_bloc.dart';
import 'package:mobile_buyer_flutter/components/image_container_widget.dart';
import 'package:mobile_buyer_flutter/data_layer/phone.dart';
import 'package:mobile_buyer_flutter/screens/phone_detail_screen.dart';
import 'package:mobile_buyer_flutter/constants.dart';

class MobileTileWidget extends StatelessWidget {
  final Phone phone;

  const MobileTileWidget({Key? key, required this.phone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isFavorite = BlocProvider.of<FavoriteBloc>(context).phones.contains(phone);

    return GestureDetector(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ImageContainerWidget(
              height: 60,
              width: 60,
              url: phone.thumbUrl,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      phone.name,
                      style: kListTitleTextStyle,
                    ),
                    Text(
                      phone.description ?? "",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: kListSubTitleTextStyle,
                    ),
                    const SizedBox(height: 12.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Price:${phone.priceDisplay}',
                          style: kListPriceTagTextStyle,
                        ),
                        Text(
                          'Rating:${phone.rating}',
                          style: kListPriceTagTextStyle,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                isFavorite ? Icons.star : Icons.star_border,
              ),
              color: kFavoriteColor,
              onPressed: () {
                //inorder to save fav
                BlocProvider.of<FavoriteBloc>(context).toggleFavorite(phone);
                //in order to refresh the fav button
                BlocProvider.of<PhoneBloc>(context).toggleUpdate();
                // bloc.toggleRestaurant(restaurant),
              },
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PhoneDetailScreen(phone: phone),
        ));
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_store/src/constant/color/color.dart';

class MoreProductInformation extends StatefulWidget {
  const MoreProductInformation({super.key});

  @override
  State<MoreProductInformation> createState() => _MoreProductInformationState();
}

class _MoreProductInformationState extends State<MoreProductInformation> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: kGreenColor, width: 1.0),
        backgroundColor: kWhiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                'iPhone 14 Pro Max',
                style: const TextStyle(
                  color: kGreenColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Một siêu phẩm trong giới smartphone được nhà Táo tung ra thị trường vào tháng 09/2022. Máy trang bị con chip Apple A16 Bionic vô cùng mạnh mẽ, đi kèm theo đó là thiết kế hình màn hình mới, hứa hẹn mang lại những trải nghiệm đầy mới mẻ cho người dùng iPhone.',
                      style: const TextStyle(
                        color: kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Thiết kế cao cấp bền bỉ',
                      style: const TextStyle(
                        color: kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'iPhone năm nay sẽ được thừa hưởng nét đặc trưng từ người anh iPhone 13 Pro Max, vẫn sẽ là khung thép không gỉ và mặt lưng kính cường lực kết hợp với tạo hình vuông vức hiện đại thông qua cách tạo hình phẳng ở các cạnh và phần mặt lưng. Thiết kế này nhằm giúp cho iPhone 14 Pro Max trông sang trọng và đẳng cấp hơn.',
                      style: const TextStyle(
                        color: kBlackColor,
                      ),
                    ),
                    Image.asset(
                      'images/ip14promax.jpg',
                      width: MediaQuery.of(context).size.width * 0.8,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Dòng Pro năm nay được ra mắt với nhiều tùy chọn màu sắc và trong đó nổi bật nhất có lẽ là phiên bản Deep Purple (tím), bởi vì đây là một màu mới nên mang lại độ nhận diện khá cao.',
                      style: const TextStyle(
                        color: kBlackColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Image.asset(
                      'images/ip14promaxtim.jpg',
                      width: MediaQuery.of(context).size.width * 0.8,
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Nổi bật với thiết kế màn hình mới',
                      style: const TextStyle(
                        color: kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Điểm ấn tượng nhất trên điện thoại iPhone năm nay nằm ở thiết kế màn hình, có thể dễ dàng nhận thấy được là hãng cũng đã loại bỏ cụm tai thỏ truyền thống qua bao đời iPhone bằng một hình dáng mới vô cùng lạ mắt.',
                      style: const TextStyle(
                        color: kBlackColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Image.asset(
                      'images/thietkemoi.jpg',
                      width: MediaQuery.of(context).size.width * 0.8,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'So với cụm tai thỏ hình notch năm nay đã có phần tiết kiệm diện tích tương đối tốt, nhưng khi so với các kiểu màn hình dạng “nốt ruồi” thì đây vẫn chưa thực sự là một điều quá tối ưu cho phần màn hình. Thế nhưng Apple lại rất biết cách tận dụng những nhược điểm để biến chúng trở thành ưu điểm một cách ngoạn mục bằng cách phát minh nhiều hiệu ứng thú vị.',
                      style: const TextStyle(
                        color: kBlackColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Image.asset(
                      'images/taitho.jpg',
                      width: MediaQuery.of(context).size.width * 0.8,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Để làm cho chúng trở nên bắt mắt hơn Apple cũng đã giới thiệu nhiều hiệu ứng chuyển động nhằm làm tăng sự thích thú cho người dùng, điều này được kích hoạt trong lúc mình ấn giữ phần hình notch khi đang dùng các phần mềm hỗ trợ như: Nghe nhạc, đồng hồ hẹn giờ, ghi âm,...',
                      style: const TextStyle(
                        color: kBlackColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Image.asset(
                      'images/ghiam.jpg',
                      width: MediaQuery.of(context).size.width * 0.8,
                    ),
                    Text(
                      'Hiển thị nội dung chân thực hơn thông qua màn hình chất lượng',
                      style: const TextStyle(
                        color: kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Từ trước đến nay, tấm nền OLED luôn được cộng đồng người dùng đánh giá rất cao khi xuất hiện trên các dòng sản phẩm của Apple, với chiếc iPhone 14 Pro Max điều này cũng không là ngoại lệ khi hình ảnh mà máy mang lại hết sức chân thực.',
                      style: const TextStyle(
                        color: kBlackColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Image.asset(
                      'images/oled.jpg',
                      width: MediaQuery.of(context).size.width * 0.8,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Nhìn vào màn hình ta sẽ thấy được một độ trong trẻo vô cùng thích mắt, nội dung hiển thị có chiều sâu, cảm giác khi xem phim hay chơi game cũng trở nên sống động hơn.',
                      style: const TextStyle(
                        color: kBlackColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Điểm vượt trội nhất mà các loại tấm nền khác khó mà đạt được là độ chuẩn các về màu sắc cao, mình cũng đã sử dụng iPhone 14 Pro Max để thiết kế một vài ấn phẩm như poster hay sticker đơn giản và thành quả lúc in ra sau khi đối chiếu lại với ảnh trên điện thoại thì gần như là bằng nhau, độ sai lệch không quá đáng kể giúp mình an tâm hơn trong việc thiết kế hình ảnh.',
                      style: const TextStyle(
                        color: kBlackColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Image.asset(
                      'images/chuan.jpg',
                      width: MediaQuery.of(context).size.width * 0.8,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Độ phân giải màn hình đạt mức 2796 x 1290 Pixels nên việc tái tạo hình ảnh có độ chi tiết cao là điều hết sức dễ dàng, hiện tượng như rỗ màn hình là điều mà mình chưa từng thấy xuất hiện trên điện thoại trong 2 tuần trải nghiệm.',
                      style: const TextStyle(
                        color: kBlackColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Image.asset(
                      'images/phangiai.jpg',
                      width: MediaQuery.of(context).size.width * 0.8,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Hỗ trợ tính năng Always On Display',
                      style: const TextStyle(
                        color: kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Tuy nhiên màn hình lúc này khá tối nên dùng ngoài trời sẽ hơi khó nhìn đôi chút. Bên cạnh đó, tính năng này cũng sẽ giảm tuổi thọ pin hơn so với thông thường, để điện thoại qua đêm khoảng 7 tiếng ở chế độ Always On Display thì máy mất khoảng 3 - 4% dung lượng pin.',
                      style: const TextStyle(
                        color: kBlackColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Tần số quét 120 Hz',
                      style: const TextStyle(
                        color: kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'iPhone 14 Pro Max có tần số quét rất cao vậy nên mọi thao tác hằng ngày của mình đều được phản hồi nhanh chóng, cảm giác vuốt chạm cũng trở nên thích hơn, hiện tượng khựng hay độ trễ trong lúc vuốt đã được cải thiện đáng kể so với những chuẩn màn hình 60 Hz.',
                      style: const TextStyle(
                        color: kBlackColor,
                      ),
                    ),
                    Image.asset(
                      'images/tansoquet.jpg',
                      width: MediaQuery.of(context).size.width * 0.8,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Ngoài ra, Apple còn bổ sung tùy chọn để giúp bạn có thể dễ dàng điều chỉnh tần số quét lên 120 Hz hay xuống 60 Hz tùy vào nhu cầu sử dụng, phù hợp để dùng trong những tình huống khẩn cấp như đang muốn tiết kiệm pin nhằm đảm bảo thiết bị có thể duy trì sử dụng dài lâu.',
                      style: const TextStyle(
                        color: kBlackColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Độ sáng 2000 nits',
                      style: const TextStyle(
                        color: kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'So với những đối thủ khác trong phân khúc thì độ sáng 2000 nits được xem là ưu điểm vượt trội mà ít có hãng nào có thể sánh kịp, thế liệu nó giúp ích được gì và có thực sự hiệu quả hay không chắc hẳn là điều được rất nhiều người thắc mắc.',
                      style: const TextStyle(
                        color: kBlackColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Image.asset(
                      'images/dosang.jpg',
                      width: MediaQuery.of(context).size.width * 0.8,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Cụ thể là màn hình có độ sáng cao đã giúp ích cho mình rất nhiều trong mọi nhu cầu sử dụng hằng ngày của mình, kể từ khi sử dụng iPhone 14 Pro Max việc xem bản đồ khi đang ở ngoài đường lúc trời nắng gắt cũng trở nên dễ dàng, màn hình lúc này không quá sập tối hay lóa, các thông báo chỉ dẫn đường đi cũng đều được thể hiện rõ ràng.',
                      style: const TextStyle(
                        color: kBlackColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Image.asset(
                      'images/dosangcao.jpg',
                      width: MediaQuery.of(context).size.width * 0.8,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Bên cạnh đó, khi chụp ảnh ở ngoài trời nắng độ sáng màn hình cao cũng sẽ là một lợi thế, nó hữu ích trong lúc mình căn chỉnh góc chụp khi mọi đường lưới đều được hiển thị rõ, chủ thể đã được lấy nét hay chưa thì mình cũng có thể dễ dàng quan sát trực tiếp ngay trên màn hình mà không cần dùng tay để che chắn ánh sáng chiếu vào như phần lớn các dòng điện thoại khác.',
                      style: const TextStyle(
                        color: kBlackColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Mặt kính cường lực Ceramic Shield',
                      style: const TextStyle(
                        color: kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Ceramic Shield có lẽ không còn là thuật ngữ quá xa lạ đối với phần lớn người dùng khi đây được xem là loại công nghệ đã từng xuất hiện ở thế hệ iPhone 12, chuẩn này nổi tiếng với độ bền bỉ cực cao và khả năng kháng lại vết xước rất tốt.',
                      style: const TextStyle(
                        color: kBlackColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Image.asset(
                      'images/matlung.jpg',
                      width: MediaQuery.of(context).size.width * 0.8,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Bắt trọn mọi khoảnh khắc thông qua camera chính 48 MP',
                      style: const TextStyle(
                        color: kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Nâng tầm quay chụp lên đẳng cấp chuyên nghiệp',
                      style: const TextStyle(
                        color: kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Chưa khi nào trải nghiệm quay chụp trên iPhone chuyên nghiệp đến thế! iPhone 14 Pro Max đem đến rất nhiều tính năng hỗ trợ chuyên sâu cho người dùng. Trải nghiệm chụp ProRAW ở độ phân giải 48MP sẽ giúp bạn tối ưu hóa độ chi tiết của hình ảnh và khả năng can thiệp hậu kỳ linh hoạt hơn nhiều, dễ dàng làm hài lòng những người dùng khó tính nhất.',
                      style: const TextStyle(
                        color: kBlackColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Ảnh chụp từ điều kiện thường cho thấy hình ảnh được tái tạo với độ chi tiết cao, màu sắc hiển thị rất chân thực, ảnh khi zoom sẽ không bị bể quá nhiều giúp cho tác vụ phóng to hay thay đổi khung hình không bị thay đổi quá nhiều về mặt chất lượng.',
                      style: const TextStyle(
                        color: kBlackColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Image.asset(
                      'images/anh1.jpg',
                      width: MediaQuery.of(context).size.width * 0.8,
                    ),
                    const SizedBox(height: 10),
                    Image.asset(
                      'images/anh2.jpg',
                      width: MediaQuery.of(context).size.width * 0.8,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Điểm ưng ý nhất về phần camera chính là về khả năng cân bằng màu cực tốt, chất lượng ảnh cho ra có gam màu trung tính, không xảy ra hiện tượng ám vàng hay ám xanh như trên một vài chiếc smartphone của những đối thủ khác trên thị trường. Điều này giúp việc chỉnh sửa ảnh trở nên dễ dàng hơn bởi mình không cần tinh chỉnh sắc độ để đưa chúng về màu ban đầu nữa.',
                      style: const TextStyle(
                        color: kBlackColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Image.asset(
                      'images/anh3.jpg',
                      width: MediaQuery.of(context).size.width * 0.8,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Mua iPhone 14 Pro Max chính hãng giá tốt nhất ở đâu?',
                      style: const TextStyle(
                        color: kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Giá iPhone 14 Pro Max mà Mobile Store ấn định luôn xứng đáng với giá trị thực tế của sản phẩm. Đặc biệt, hệ thống đảm bảo 100% về nguồn gốc xuất xứ của từng chiếc iPhone được bán ra, đi kèm với chế độ hậu mãi sau bán hàng tận tâm.',
                      style: const TextStyle(
                        color: kBlackColor,
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    AppLocalizations.of(context)!.close,
                    style: const TextStyle(
                      color: kRedColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      child: Text(
        AppLocalizations.of(context)!.seeMore,
        style: const TextStyle(
          color: kGreenColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

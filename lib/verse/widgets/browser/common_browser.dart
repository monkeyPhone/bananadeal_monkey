import 'package:banana_deal_by_monkeycompany/verse/widgets/browser/dialog/browser_dialog.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/browser/image/browser_image.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/browser/sheet/browser_bottom_sheet.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/browser/snack/browser_snackbar.dart';

class CommonBrowser {
  final BrowserSnackbar snackBar;
  final BrowserDialog dialog;
  final BrowserImage image;
  final BrowserBottomSheet sheet;
  const CommonBrowser({
    required this.snackBar,
    required this.dialog,
    required this.image,
    required this.sheet
  });
}
import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/address/manager/address_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/address/state/bloc/banana_address_bloc/banana_address_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/address/view/widgets/body/result/address_body_result_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/special/bd_ripple_search_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_form_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressBodyView extends StatelessWidget {
  const AddressBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _LocationFormArea(),
        AddressBodyResultView()
      ],
    );
  }
}


class _LocationFormArea extends StatelessWidget {
  const _LocationFormArea();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaAddressBloc, BananaAddressState, String>(
        selector: (state) => state.addressVO.dong,
        builder: (context, dong) =>
        dong == ''
            ? const _LocationForm()
            : const SizedBox()
    );
  }
}


class _LocationForm extends StatefulWidget {
  const _LocationForm();

  @override
  State<_LocationForm> createState() => _LocationFormState();
}

class _LocationFormState extends State<_LocationForm> {

  late final TextEditingController _locationController;
  late FocusNode _locationFocusNode;

  void _onFieldSubmitted(String val){
    if(_locationController.text.length > 1){
      _locationFocusNode.unfocus();
      context.read<AddressManager>().fetchAddress(
          context: context,
          search: _locationController.text, currentPage: 1);
    } else{
      context.read<AddressManager>().initAddress(context);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _locationController = TextEditingController();
    _locationFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _locationController.dispose();
    _locationFocusNode.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Padding(
      padding: EdgeInsets.only(
          top: size.sizedSideGap,
          left: size.sized16grid,
          right: size.sized16grid
      ),
      child: BdTextFormCustom(
        size: size,
        textInputAction: TextInputAction.search,
        focusNode: _locationFocusNode,
        width: size.widthCommon,
        textController: _locationController,
        hintText: '주소를 입력해주세요.',
        enabled: true,
        onFieldSubmitted: _onFieldSubmitted,
        keyboardType: TextInputType.name,
        suffixIcon: BdRippleSearchButton(
          size: size,
          onTap:  (){
            if(_locationController.text.length > 1){
              _locationFocusNode.unfocus();
              context.read<AddressManager>().fetchAddress(
                  context: context,
                  search: _locationController.text, currentPage: 1);
            } else{
              context.read<AddressManager>().initAddress(context);
            }
          },
        ),
      ),
    );
  }
}

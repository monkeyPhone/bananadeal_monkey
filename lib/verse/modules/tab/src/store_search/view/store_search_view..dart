import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/store/model/action/store_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/store/model/store_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/api/store_search/model/store_search_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/store_search/model/store_search_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/store_search/src/store_search_repository_impl.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/method/api/model/data/canvas_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_search/manager/store_search_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_search/state/bloc/banana_store_search/banana_store_search_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_search/state/bloc/banana_store_search_option/banana_store_search_option_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_search/view/widgets/appbar/store_search_appbar_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_search/view/widgets/list/store_search_list_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/canvas/bd_canvas.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/ui/bd_ui_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreSearchView extends StatelessWidget {
  final BuildContext routerContext;
  const StoreSearchView({super.key,
    required this.routerContext
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<StoreSearchApiImpl>(
            create: (BuildContext context) =>
            const StoreSearchApiImpl(
              action: StoreSearchAction()
            )
        ),
        RepositoryProvider<StoreApiImpl>(
            create: (BuildContext context) =>
            const StoreApiImpl(
                action: StoreAction()
            )
        ),
        RepositoryProvider<StoreSearchRepositoryImpl>(
          create: (BuildContext context) =>
              StoreSearchRepositoryImpl(
                  api: context.read<StoreSearchApiImpl>(),
                  storeApi: context.read<StoreApiImpl>(),
                dio: context.read<VerseConfig>().dio
              ),
        ),
        RepositoryProvider<StoreSearchManager>(
          create: (BuildContext context) =>
              StoreSearchManager(
                routerContext: routerContext
              ),
        ),
      ],
      child: MultiBlocProvider(
          providers: [
            BlocProvider<BananaStoreSearchOptionBloc>(
                create: (BuildContext context) =>
                BananaStoreSearchOptionBloc()
            ),

            BlocProvider<BananaStoreSearchBloc>(
                create: (BuildContext context) =>
                BananaStoreSearchBloc(
                    repository: context.read<StoreSearchRepositoryImpl>()
                )
            )
          ],
          child: const _Canvas()
      ),
    );
  }
}

class _Canvas extends StatelessWidget {
  const _Canvas();

  @override
  Widget build(BuildContext context) {
    return   BlocSelector<BananaStoreSearchOptionBloc, BananaStoreSearchOptionState, bool>(
      selector: (state) => state.isFavorite,
      builder: (state, favorite)=>
       BdCanvas(
        canvasEnum: CanvasEnum.storeSearch,
        isCanPop: true,
        isForm: true,
        body: const _Body(),
        isFavorite: favorite,
      )

    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        StoreSearchAppbarView(),
        Expanded(child: _List())
      ],
    );
  }
}


class _List extends StatelessWidget {
  const _List();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BananaStoreSearchOptionBloc, BananaStoreSearchOptionState>(
        builder: (context, state) =>
            switch(state.keyword){
              '' => const BdUiDefault(text: '검색어를 입력해주세요.', ),
             _ =>  StoreSearchListView(isUpdate: state.isUpdate, start: state.page, keyword: state.keyword,)
            }
    );
  }
}




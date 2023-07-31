import 'package:bigbaazar/helper/firebase_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/banner_model.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial()) {
    on<GetBannersData>((event, emit) async {
      emit(DashboardLoading());
      var data = await getProductBanners();
      if (data != null) {
        List<BannerModel> bannerList = [];
        data.docs.forEach((doc) {
          String bannerID = doc["banner_id"];
          String BannerURL = doc["banner_url"];

          BannerModel book =
              BannerModel(bannerId: bannerID, bannerUrl: BannerURL);
          bannerList.add(book);
        });
        emit(BannerLoded(bannerList));
      } else {
        emit(DashboardInitial());
      }
    });
  }
}

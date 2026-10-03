import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:payment_method/Features/checkout/data/models/payment_input_model.dart';
import 'package:payment_method/Features/checkout/data/repo/repo.dart';

part 'stripe_payment_state.dart';

class StripePaymentCubit extends Cubit<StripePaymentState> {
  StripePaymentCubit(this.checkPayment) : super(StripePaymentInitial());
  final CheckPaymentrepo checkPayment;
  int paymentMethod = 0;
  Future makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    emit(StripePaymentLoading());

    var data = await checkPayment.mackPayment(
      paymentIntentInputModel: paymentIntentInputModel,
    );

    data.fold(
      (left) {
        emit(StripePaymentFailer(errorMessage: left.toString()));
      },
      (right) {
        emit(StripePaymentSuccess());
      },
    );
  }
}

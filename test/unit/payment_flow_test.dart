import 'package:dartz/dartz.dart';
import 'package:flutter_paymob_sdk/flutter_paymob_sdk.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:payment_method/Features/checkout/data/models/cart_item_model.dart';
import 'package:payment_method/Features/checkout/data/models/payment_input_model.dart';
import 'package:payment_method/Features/checkout/data/models/payment_intent_kashier_model/payment_intent_kashier_model.dart';
import 'package:payment_method/Features/checkout/data/models/payment_result_model.dart';
import 'package:payment_method/Features/checkout/data/repo/repo.dart';
import 'package:payment_method/Features/checkout/data/repo/repo_implementation.dart';
import 'package:payment_method/Features/checkout/presentation/views/manger/cubit/stripe_payment_cubit.dart';
import 'package:payment_method/core/error/faliers.dart';
import 'package:payment_method/core/utils/paymob_services.dart';
import 'package:payment_method/core/utils/paytabs_services.dart';

// Fake implementations for unit testing repository and cubit layers
class FakeCheckPaymentRepo implements CheckPaymentrepo {
  Either<Falier, PaymentResultModel>? paymobResult;
  Either<Falier, PaymentResultModel>? paytabsResult;
  int paymobCallCount = 0;
  int paytabsCallCount = 0;

  @override
  Future<Either<Falier, void>> mackPaymentStripe({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    return const Right(null);
  }

  @override
  Future<Either<Falier, void>> mackPaymentKashier({
    required PaymentIntentKashierModel paymentIntentKashierModel,
  }) async {
    return const Right(null);
  }

  @override
  Future<Either<Falier, PaymentResultModel>> mackPaymentPaymob({
    required int amount,
    required List<CartItemModel> items,
  }) async {
    paymobCallCount++;
    return paymobResult ?? Right(PaymentResultModel.success());
  }

  @override
  Future<Either<Falier, PaymentResultModel>> mackPaymentPayTaps({
    required int amount,
  }) async {
    paytabsCallCount++;
    return paytabsResult ?? Right(PaymentResultModel.success());
  }
}

class FakePaymobServices extends PaymobServices {
  PaymobPaymentResult? mockResult;
  Object? errorToThrow;

  @override
  Future<PaymobPaymentResult> mackPaymentPaymob(
    int amount,
    List<CartItemModel> items,
  ) async {
    if (errorToThrow != null) {
      throw errorToThrow!;
    }
    return mockResult ?? PaymobPaymentResult(status: PaymentStatus.successful);
  }
}

class FakePaytabsServices extends PaytabsServices {
  PaymentResultModel? mockResult;
  Object? errorToThrow;

  @override
  Future<PaymentResultModel> makePaymentPaytabs({required int amount}) async {
    if (errorToThrow != null) {
      throw errorToThrow!;
    }
    return mockResult ?? PaymentResultModel.success();
  }
}

void main() {
  group('PaymentCubit Flow Tests', () {
    late FakeCheckPaymentRepo fakeRepo;
    late PaymentCubit cubit;

    setUp(() {
      fakeRepo = FakeCheckPaymentRepo();
      cubit = PaymentCubit(fakeRepo);
      cubit.amount = 500;
    });

    tearDown(() {
      cubit.close();
    });

    test('Initial state is PaymentInitial', () {
      expect(cubit.state, isA<PaymentInitial>());
    });

    test(
      'makePaymentPaymob emits PaymentLoading then PaymentSuccess on success',
      () async {
        fakeRepo.paymobResult = Right(
          PaymentResultModel.success(
            message: 'Approved',
            transactionId: 'TX123',
          ),
        );

        final expectedStates = [
          isA<PaymentLoading>(),
          isA<PaymentSuccess>().having((s) => s.amount, 'amount', '500'),
        ];

        expectLater(cubit.stream, emitsInOrder(expectedStates));

        await cubit.makePaymentPaymob(amount: 500, items: []);
        expect(fakeRepo.paymobCallCount, 1);
      },
    );

    test(
      'makePaymentPaymob emits PaymentCancelled when user cancels',
      () async {
        fakeRepo.paymobResult = Left(
          CancelledFailer(errorMessage: 'Payment cancelled by user'),
        );

        final expectedStates = [
          isA<PaymentLoading>(),
          isA<PaymentCancelled>().having(
            (s) => s.message,
            'message',
            'Payment cancelled by user',
          ),
        ];

        expectLater(cubit.stream, emitsInOrder(expectedStates));

        await cubit.makePaymentPaymob(amount: 500, items: []);
        expect(fakeRepo.paymobCallCount, 1);
      },
    );

    test(
      'makePaymentPaymob emits PaymentPending when transaction is pending',
      () async {
        fakeRepo.paymobResult = Left(
          PendingFailer(errorMessage: 'Paymob payment is pending'),
        );

        final expectedStates = [
          isA<PaymentLoading>(),
          isA<PaymentPending>().having(
            (s) => s.message,
            'message',
            'Paymob payment is pending',
          ),
        ];

        expectLater(cubit.stream, emitsInOrder(expectedStates));

        await cubit.makePaymentPaymob(amount: 500, items: []);
        expect(fakeRepo.paymobCallCount, 1);
      },
    );

    test('makePaymentPaymob emits PaymentFailer when payment fails', () async {
      fakeRepo.paymobResult = Left(ServerFailer(errorMessage: 'Card declined'));

      final expectedStates = [
        isA<PaymentLoading>(),
        isA<PaymentFailer>().having(
          (s) => s.errorMessage,
          'errorMessage',
          'Card declined',
        ),
      ];

      expectLater(cubit.stream, emitsInOrder(expectedStates));

      await cubit.makePaymentPaymob(amount: 500, items: []);
      expect(fakeRepo.paymobCallCount, 1);
    });

    test(
      'makePaymentPaymob guards against double click while loading',
      () async {
        fakeRepo.paymobResult = Right(PaymentResultModel.success());

        // Start first payment without awaiting immediately
        final first = cubit.makePaymentPaymob(amount: 500, items: []);
        // Attempt concurrent second tap
        final second = cubit.makePaymentPaymob(amount: 500, items: []);

        await Future.wait([first, second]);
        expect(fakeRepo.paymobCallCount, 1);
      },
    );

    test(
      'makePaymentPayTaps emits PaymentLoading then PaymentSuccess on success',
      () async {
        fakeRepo.paytabsResult = Right(
          PaymentResultModel.success(
            message: 'PayTabs transaction successful',
            transactionId: 'PT-100',
          ),
        );

        final expectedStates = [
          isA<PaymentLoading>(),
          isA<PaymentSuccess>().having((s) => s.amount, 'amount', '250'),
        ];

        expectLater(cubit.stream, emitsInOrder(expectedStates));

        await cubit.makePaymentPayTaps(amount: 250);
        expect(fakeRepo.paytabsCallCount, 1);
      },
    );

    test(
      'makePaymentPayTaps emits PaymentCancelled when user cancels',
      () async {
        fakeRepo.paytabsResult = Left(
          CancelledFailer(errorMessage: 'Payment cancelled by user'),
        );

        final expectedStates = [
          isA<PaymentLoading>(),
          isA<PaymentCancelled>().having(
            (s) => s.message,
            'message',
            'Payment cancelled by user',
          ),
        ];

        expectLater(cubit.stream, emitsInOrder(expectedStates));

        await cubit.makePaymentPayTaps(amount: 250);
        expect(fakeRepo.paytabsCallCount, 1);
      },
    );

    test(
      'makePaymentPayTaps emits PaymentPending when transaction is pending',
      () async {
        fakeRepo.paytabsResult = Left(
          PendingFailer(errorMessage: 'Payment is pending confirmation'),
        );

        final expectedStates = [
          isA<PaymentLoading>(),
          isA<PaymentPending>().having(
            (s) => s.message,
            'message',
            'Payment is pending confirmation',
          ),
        ];

        expectLater(cubit.stream, emitsInOrder(expectedStates));

        await cubit.makePaymentPayTaps(amount: 250);
        expect(fakeRepo.paytabsCallCount, 1);
      },
    );

    test('makePaymentPayTaps emits PaymentFailer when payment fails', () async {
      fakeRepo.paytabsResult = Left(
        ServerFailer(errorMessage: 'Transaction declined'),
      );

      final expectedStates = [
        isA<PaymentLoading>(),
        isA<PaymentFailer>().having(
          (s) => s.errorMessage,
          'errorMessage',
          'Transaction declined',
        ),
      ];

      expectLater(cubit.stream, emitsInOrder(expectedStates));

      await cubit.makePaymentPayTaps(amount: 250);
      expect(fakeRepo.paytabsCallCount, 1);
    });

    test(
      'makePaymentPayTaps guards against double click while loading',
      () async {
        fakeRepo.paytabsResult = Right(PaymentResultModel.success());

        final first = cubit.makePaymentPayTaps(amount: 250);
        final second = cubit.makePaymentPayTaps(amount: 250);

        await Future.wait([first, second]);
        expect(fakeRepo.paytabsCallCount, 1);
      },
    );
  });

  group('CheckPaymentImplement Repository Tests', () {
    late FakePaymobServices fakePaymob;
    late FakePaytabsServices fakePaytabs;
    late CheckPaymentImplement repo;

    setUp(() {
      fakePaymob = FakePaymobServices();
      fakePaytabs = FakePaytabsServices();
      repo = CheckPaymentImplement(
        paymobServices: fakePaymob,
        paytabsServices: fakePaytabs,
      );
    });

    test(
      'mackPaymentPaymob maps Paymob successful to Right(PaymentResultModel)',
      () async {
        fakePaymob.mockResult = PaymobPaymentResult(
          status: PaymentStatus.successful,
          transactionDetails: {'id': '12345'},
        );

        final result = await repo.mackPaymentPaymob(amount: 100, items: []);

        expect(result.isRight(), isTrue);
        result.fold((l) => fail('Expected Right, got Left: $l'), (r) {
          expect(r.isSuccess, isTrue);
          expect(r.data?['id'], '12345');
        });
      },
    );

    test(
      'mackPaymentPaymob maps Paymob cancelled to Left(CancelledFailer)',
      () async {
        fakePaymob.mockResult = PaymobPaymentResult(
          status: PaymentStatus.cancelled,
        );

        final result = await repo.mackPaymentPaymob(amount: 100, items: []);

        expect(result.isLeft(), isTrue);
        result.fold(
          (l) => expect(l, isA<CancelledFailer>()),
          (r) => fail('Expected Left, got Right: $r'),
        );
      },
    );

    test(
      'mackPaymentPaymob maps Paymob pending to Left(PendingFailer)',
      () async {
        fakePaymob.mockResult = PaymobPaymentResult(
          status: PaymentStatus.pending,
        );

        final result = await repo.mackPaymentPaymob(amount: 100, items: []);

        expect(result.isLeft(), isTrue);
        result.fold(
          (l) => expect(l, isA<PendingFailer>()),
          (r) => fail('Expected Left, got Right: $r'),
        );
      },
    );

    test(
      'mackPaymentPaymob maps Paymob failure to Left(ServerFailer)',
      () async {
        fakePaymob.mockResult = PaymobPaymentResult(
          status: PaymentStatus.failure,
          errorMessage: 'Invalid OTP',
        );

        final result = await repo.mackPaymentPaymob(amount: 100, items: []);

        expect(result.isLeft(), isTrue);
        result.fold((l) {
          expect(l, isA<ServerFailer>());
          expect(l.errorMessage, 'Invalid OTP');
        }, (r) => fail('Expected Left, got Right: $r'));
      },
    );

    test(
      'mackPaymentPayTaps maps PayTabs successful to Right(PaymentResultModel)',
      () async {
        fakePaytabs.mockResult = PaymentResultModel.success(
          transactionId: 'TST-123',
          message: 'Success',
        );

        final result = await repo.mackPaymentPayTaps(amount: 200);

        expect(result.isRight(), isTrue);
        result.fold((l) => fail('Expected Right, got Left: $l'), (r) {
          expect(r.isSuccess, isTrue);
          expect(r.transactionId, 'TST-123');
        });
      },
    );

    test(
      'mackPaymentPayTaps maps PayTabs cancelled to Left(CancelledFailer)',
      () async {
        fakePaytabs.mockResult = PaymentResultModel.cancelled(
          message: 'Payment cancelled by user',
        );

        final result = await repo.mackPaymentPayTaps(amount: 200);

        expect(result.isLeft(), isTrue);
        result.fold(
          (l) => expect(l, isA<CancelledFailer>()),
          (r) => fail('Expected Left, got Right: $r'),
        );
      },
    );

    test(
      'mackPaymentPayTaps maps PayTabs pending to Left(PendingFailer)',
      () async {
        fakePaytabs.mockResult = PaymentResultModel.pending(
          message: 'Payment is pending confirmation',
        );

        final result = await repo.mackPaymentPayTaps(amount: 200);

        expect(result.isLeft(), isTrue);
        result.fold(
          (l) => expect(l, isA<PendingFailer>()),
          (r) => fail('Expected Left, got Right: $r'),
        );
      },
    );

    test(
      'mackPaymentPayTaps maps PayTabs failure to Left(ServerFailer)',
      () async {
        fakePaytabs.mockResult = PaymentResultModel.failure(
          message: 'Declined by bank',
        );

        final result = await repo.mackPaymentPayTaps(amount: 200);

        expect(result.isLeft(), isTrue);
        result.fold((l) {
          expect(l, isA<ServerFailer>());
          expect(l.errorMessage, 'Declined by bank');
        }, (r) => fail('Expected Left, got Right: $r'));
      },
    );
  });
}

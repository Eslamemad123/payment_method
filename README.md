# 💳 Flutter Multi-Gateway Payment Hub

## 📱 About The App

**Flutter Multi-Gateway Payment Hub** is a multi-platform e-commerce demo
application designed to test, benchmark, and demonstrate unified payment
processing across global and MENA regional gateways (Stripe, PayPal, Paymob,
PayTabs, Kashier) within a responsive Flutter architecture.

---

## 🎥 Demo Video

[Watch the Demo Video Here](#) _(Add your LinkedIn / YouTube / Loom link here)_

---

## 📊 Project Statistics

- **5 Fully Integrated Payment Gateways** (Stripe, PayPal, Paymob, PayTabs,
  Kashier)
- **26 Passing Unit Tests** (CartCubit & Payment Flow Suites)
- **3 Responsive Form Factors** (Mobile, Tablet, Desktop 3-Panel Studio)
- **100% Reactive State Management** (Flutter Bloc & Cubit)
- **Functional Error Handling** (`dartz` Either pattern)
- **Dynamic Backend Credential Resolver** (Supabase Edge Functions)
- **Interactive Digital Receipt Engine** (Dynamic timestamps & voucher UI)

---

## ✨ Key Features

✔ **Multi-Gateway Payment Integration:** Unified checkout for Stripe, PayPal,
Paymob, PayTabs, and Kashier\
✔ **Dual Checkout Ingress:** Instant 1-click "Buy Now" on products & multi-item
Shopping Cart checkout\
✔ **Reactive Shopping Cart (`CartCubit`):** Live increment/decrement, zero-count
auto-removal, and subtotal calculation\
✔ **Adaptive Multi-Device UI:** Tailored layouts for Mobile (<600px), Tablet
(600–1080px), and Desktop (>1080px)\
✔ **Desktop 3-Panel Studio:** Persistent cart sidebar, central catalog grid, and
live product inspector\
✔ **Double-Click & Idempotency Guard:** Prevents duplicate transaction
submissions with native loading states\
✔ **Asynchronous Completer Bridging:** Normalizes PayTabs & Paymob event
callbacks into clean `Future` results\
✔ **Interactive Digital Receipt (`ThankYouView`):** Ticket-style receipt card
with dynamic timestamps and PAID badge\
✔ **Zero-State Micro-animations:** Lottie animations for empty shopping carts
and loading transitions\
✔ **Device Simulator:** Built-in `DevicePreview` for instant multi-screen
testing

---

## 💳 Supported Payment Gateways

| Payment Gateway | Target Region | Integration Method                                             |            Verified Status            |
| :-------------- | :-----------: | :------------------------------------------------------------- | :-----------------------------------: |
| **Stripe**      |    Global     | REST API (PaymentIntent + Ephemeral Key) + Native PaymentSheet | ✅ **Fully Integrated** _(Test Mode)_ |
| **PayPal**      |    Global     | WebView Checkout via `flutter_paypal_payment`                  |  ✅ **Fully Integrated** _(Sandbox)_  |
| **Paymob**      | MENA / Egypt  | Intention REST API (`/v1/intention/`) + `flutter_paymob_sdk`   | ✅ **Fully Integrated** _(Accept v1)_ |
| **PayTabs**     |  MENA / GCC   | Bridge SDK (`flutter_paytabs_bridge`) + Event `Completer`      | ✅ **Fully Integrated** _(Test Mode)_ |
| **Kashier**     |     Egypt     | Sessions API + Embedded Custom `kashier_flutter_sdk`           | ✅ **Fully Integrated** _(Test Mode)_ |

---

## 📸 Screenshots

### Mobile Store & Catalog

<p align="center">
  <img src="Screen App/Mobaile/mobile1.png" width="190"/>
  <img src="Screen App/Mobaile/mobile2.png" width="190"/>
  <img src="Screen App/Mobaile/mobile3.png" width="190"/>
  <img src="Screen App/Mobaile/mobile4.png" width="190"/>
</p>

### Checkout & Payment Flows

<p align="center">
  <img src="Screen App/Mobaile/payment0.png" width="155"/>
  <img src="Screen App/Mobaile/payment1.png" width="155"/>
  <img src="Screen App/Mobaile/payment2.png" width="155"/>
  <img src="Screen App/Mobaile/payment3.png" width="155"/>
  <img src="Screen App/Mobaile/payment4.png" width="155"/>
  <img src="Screen App/Mobaile/payment5.png" width="155"/>
</p>

### Responsive Tablet Layout

<p align="center">
  <img src="Screen App/Tablet/Tablet1.png" width="250"/>
  <img src="Screen App/Tablet/Tablet2.png" width="250"/>
  <img src="Screen App/Tablet/Tablet3.png" width="250"/>
</p>

### Responsive Desktop Studio

<p align="center">
  <img src="Screen App/Desktop/desktop1.png" width="380"/>
  <img src="Screen App/Desktop/desktop2.png" width="380"/>
</p>
<p align="center">
  <img src="Screen App/Desktop/desktop3.png" width="600"/>
</p>

---

## 🛠️ Tech Stack

- **Framework:** Dart 3.13+ • Flutter 3.x
- **State Management:** Flutter Bloc (`flutter_bloc: ^9.1.1`, `bloc: ^9.2.1`)
- **Functional Programming:** `dartz: ^0.10.1`
  (`Either<Falier, PaymentResultModel>`)
- **Network & API:** `dio: ^5.11.1` & `http: ^1.6.0`
- **Cloud & Edge Functions:** `supabase_flutter: ^2.18.3`
- **Payment SDKs:** `flutter_stripe`, `flutter_paypal_payment`,
  `flutter_paymob_sdk`, `flutter_paytabs_bridge`, `kashier_flutter_sdk`
  (embedded)
- **UI & Utilities:** `flutter_svg`, `lottie`, `intl`, `gap`, `device_preview`
- **Testing:** `flutter_test` (26 unit tests)

---

## 🏗️ Architecture & Project Structure

The app follows a **Feature-First Layered Architecture**:

```
lib/
├── core/
│   ├── const/              # Catalog products list, initial cart items, assets, colors
│   ├── error/              # Strongly-typed failures (ServerFailer, CancelledFailer, PendingFailer)
│   ├── function/           # Gateway dispatchers (stripe.dart, paypal.dart, paymob.dart, etc.)
│   ├── utils/              # Gateway services (Stripe, Paymob, PayTabs, Kashier), Supabase resolver
│   └── widgets/            # CustomButton, CustomAppBar
├── Features/
│   └── checkout/
│       ├── data/
│       │   ├── models/     # Payment intent models, cart/product models, PaymentResultModel
│       │   └── repo/       # CheckPaymentrepo interface & CheckPaymentImplement
│       └── presentation/
│           ├── cart_screen/# CartCubit, CartState, shopping cart views & summaries
│           └── views/
│               ├── layout_builder_customize.dart # Responsive dispatcher (<600, 600-1080, >1080)
│               ├── manger/ # PaymentCubit & PaymentState machine
│               ├── paymentSheet/ # Gateway selector sheet, CustomButtonBlocConsumer, ThankYouView
│               ├── product_screen/ # Mobile, Tablet, and Desktop studio views
│               └── productDetails/ # Product details view, carousel gallery, Buy Now button
└── main.dart               # App bootstrap, Supabase init, Stripe & Kashier configuration
```

---

## 🔥 Technical Highlights

- **Unified Gateway Abstraction:** Standardized divergent payment SDKs behind
  `CheckPaymentrepo` returning `Either<Falier, PaymentResultModel>` with
  normalized states (`isSuccess`, `isCancelled`, `isPending`, `isFailure`).
- **Asynchronous Completer Bridging:** Event-based SDKs (PayTabs and Paymob) are
  bridged into clean `Future` returns using Dart
  `Completer<PaymentResultModel>`, preventing unhandled hanging callbacks.
- **Idempotent Checkout Protection:** Checkout buttons monitor `PaymentLoading`,
  disabling re-entrant submissions and showing an adaptive spinner during
  processing.
- **Responsive 3-Panel Desktop Studio:** Desktop displays (`>1080px`) feature a
  3-panel workspace: persistent Cart summary on the left, Catalog grid in the
  center, and live reactive Product Inspector on the right.
- **Backend Credential Isolation:** Merchant secrets are fetched on-demand from
  a Supabase Edge Function (`payment-backend`) via
  `PaymentBackend.getKey(keyName)` instead of being hardcoded in client code.
- **Automated Unit Tests (26 Passed):** Full test coverage for cart mutations
  (add, increment, decrement, auto-evict at 0, remove) and payment state
  transitions (Success, Cancelled, Pending, Error, double-tap prevention).

---

## 🚀 Quick Setup & Installation

```bash
# 1. Clone repository
git clone https://github.com/Eslamemad123/payment_method.git
cd payment_method

# 2. Install dependencies (app & embedded Kashier SDK)
flutter pub get
cd packages/kashier_flutter_sdk && flutter pub get && cd ../..

# 3. Run unit tests
flutter test

# 4. Launch app
flutter run
```

---

## 👨💻 Author

**Eslam Emad**\
_Senior Flutter Developer & Mobile Software Engineer_

- **GitHub:** [@Eslamemad123](https://github.com/Eslamemad123)
- **Repository:**
  [payment_method](https://github.com/Eslamemad123/payment_method)
- **Email:** [ee7456482@gmail.com](mailto:ee7456482@gmail.com)

---

_Crafted with precision using Flutter, Bloc, and Clean Architecture principles._

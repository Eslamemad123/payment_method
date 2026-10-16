# kashier_flutter_sdk example

Demo app for the Kashier Flutter SDK. It shows the full integration surface:

- Initializing the SDK with `KashierSDK.initialize` (test/live mode toggle,
  English/Arabic language switch)
- Starting a payment with `KashierSDK.startPayment` from a session ID entered
  in a text field
- Handling `onSuccess`, `onPending`, and `onFailure` callbacks and displaying
  the result

## Getting a test session ID

Payment sessions are created by your backend, not the app. Call Kashier's
[Payment Sessions API](https://developers.kashier.io/payment/sessions) against
the **test** environment (`https://test-api.kashier.io`) with your test
credentials, then paste the returned session ID into the app's session ID
field.

**Paste your own test credentials** — the app ships with no credentials or
session IDs baked in.

## Running

```bash
cd example
flutter pub get
cd ios && pod install && cd ..
flutter run
```

> **Warning:** do not use production/live-mode credentials without proper
> backend setup. The app's mode toggle defaults to **Test** — keep it there
> unless you have a live merchant configuration and a backend that creates
> live sessions.

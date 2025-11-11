Sentry integration (brief)

1. Create a Sentry project at https://sentry.io and get the DSN.
2. For browser (client) add Sentry SDK to your frontend (example):

```js
import * as Sentry from '@sentry/browser';
Sentry.init({ dsn: 'https://examplePublicKey@o0.ingest.sentry.io/0' });
```

3. For server (Python) install `sentry-sdk` and initialize:

```py
import sentry_sdk
sentry_sdk.init(dsn='https://...')
```

4. Store DSN in GitHub Secrets (SENTRY_DSN) and expose at runtime via environment variables.

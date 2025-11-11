# mindx-ai
Ethical AI automation and SaaS deployment platform for nonprofits and developers.

## Firebase Hosting / Deploy (quickstart)

This repository includes a minimal Firebase Hosting scaffold for a Flutter Web build.

Files added:
- `firebase.json` - hosting config (public: `build/web`, SPA rewrite)
- `.firebaserc` - links to Firebase project `flutter-ai-playground-a3785`
- `.github/workflows/firebase-hosting.yml` - GitHub Actions workflow to build & deploy on push to `main`

Local deploy (how to test locally):

1. Build Flutter web assets:
```

2. Deploy with Firebase CLI (install via `npm i -g firebase-tools`):

```powershell
firebase login
firebase init hosting   # choose existing project flutter-ai-playground-a3785 and set public to build/web
firebase deploy --only hosting
```

GitHub Actions: set a repository secret named `FIREBASE_TOKEN` containing a token produced by `firebase login:ci` (or use a service account). After pushing to `main` the workflow will build and deploy automatically.

## Secure Firebase Hosting Deploy (Service Account)

This repository uses a secure GitHub Actions workflow to deploy Flutter Web to Firebase Hosting using a service account.

### How to set up

1. In Google Cloud Console, create a service account with Firebase Hosting Admin permissions.
## Inbuilt AI Engines & Robotic Tools

This project includes open-source AI and automation tools for autorobotic systems:

- **TensorFlow.js**: Real-time ML/DL in browser
- **ONNX.js**: Cross-platform model execution
- **Hugging Face Transformers**: NLP, vision, and more
- **OpenCV.js**: Image/video processing
- **spaCy**: Fast NLP for Python
- **Rasa**: Conversational AI/chatbots
- **Roboflow**: Computer vision dataset management
- **AutoKeras/TPOT**: Automated ML model selection
- **Node-RED**: Visual IoT/workflow automation
- **n8n**: Open-source workflow automation

See `src/ai_engines.md` for integration details and `src/ai_samples/` for sample code.
2. Download the service account JSON (like your attached `credentials.json`).
3. Encode the JSON as base64 (recommended for GitHub Secrets):

```powershell
$type = Get-Content .\credentials.json -Raw
[Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($type)) | Out-File service-account.base64.txt
```

4. In GitHub, go to Settings > Secrets > Actions, and add a new secret named `FIREBASE_SERVICE_ACCOUNT` with the base64-encoded content (or raw JSON if preferred).

5. On push to `main`, the workflow will build and deploy using the service account.

### Workflow reference

- `.github/workflows/firebase-hosting.yml` uses `FirebaseExtended/action-hosting-deploy@v0` and the `FIREBASE_SERVICE_ACCOUNT` secret.

### Security note

Never commit service account JSON to the repo. Always use GitHub Secrets.
WordPress note: WordPress/PHP cannot run on Firebase Hosting. If you merged WP content, host WordPress on a separate platform (subdomain recommended) or use a headless/static export.


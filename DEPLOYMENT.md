# FrenchSprint Production Deployment

## Recommended Setup (Netlify + Render)
- Frontend: Netlify
- Backend API: Render

Your frontend must point to backend API using:
- `VITE_API_BASE=https://<your-render-domain>/api`

## 1) Build
```powershell
cd "C:\Users\manas\OneDrive\Desktop\French-daily-app"
npm install
npm run build:prod
```

## 2) Environment variables
Create a `.env` file (or configure these on your host):
```env
PORT=8787
ALLOWED_ORIGIN=*
RAZORPAY_ME_LINK=https://razorpay.me/manasmahodaya
SUPPORT_WHATSAPP=919971133672
```

## 3) Start production server
```powershell
npm run start:prod
```

Windows one-click launcher (kills old process on 8787, rebuilds, starts server):
```powershell
npm run start:prod:win
```

App URL:
- `http://localhost:8787`

Health check:
- `http://localhost:8787/api/health`

## 4) Deploy on a host (Render/Railway/VPS)
- Build command: `npm run build:prod`
- Start command: `npm run start:prod`
- Expose port: `8787` (or platform-provided `$PORT`)

The backend now serves both:
- Static frontend from `dist/`
- API endpoints under `/api/*`

## Netlify Frontend Deployment
1. Push this project to GitHub.
2. In Netlify: `New site from Git`.
3. Build settings (auto from `netlify.toml`):
   - Build command: `npm run build`
   - Publish directory: `dist`
4. Add environment variable in Netlify:
   - `VITE_API_BASE=https://<your-render-domain>/api`
5. Deploy site.

## Render Backend Deployment
1. In Render: `New +` -> `Blueprint` (uses `render.yaml`) or `Web Service`.
2. Select your repo and deploy.
3. After deploy, copy backend URL:
   - Example: `https://frenchsprint-api.onrender.com`
4. Set Netlify env var:
   - `VITE_API_BASE=https://frenchsprint-api.onrender.com/api`
5. Trigger a new Netlify deploy.

## Important Note
Current backend storage is file-based (`backend/data/store.json`).
On free cloud instances this may reset on redeploy/restart.
For real production persistence, move storage to a managed DB next (Supabase/Postgres).

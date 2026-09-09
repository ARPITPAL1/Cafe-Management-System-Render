# Deploying Cafe Management System to Render

This repository is fully configured for deployment on [Render](https://render.com/).

---

## Method 1: Automatic 1-Click Deployment (Recommended via Blueprint)

Render's Blueprint automatically provisions both the **Django REST Backend** and the **React Vite Frontend**:

1. Log into your [Render Dashboard](https://dashboard.render.com/).
2. Click **New +** in the top navigation bar and select **Blueprint**.
3. Connect your GitHub account and select repository:  
   **`ARPITPAL1/Cafe-Management-System-Render`**
4. Render will detect `render.yaml` and configure:
   - **`cafe-backend`** (Python Web Service running Django + Gunicorn + WhiteNoise)
   - **`cafe-frontend`** (Static Site running React Vite SPA)
5. Click **Apply**.
6. Render will automatically build and deploy both services!

---

## Method 2: Manual Setup (If Preferred)

### 1. Backend Web Service:
- **Type:** Web Service
- **Environment:** Python 3
- **Root Directory:** `backend`
- **Build Command:** `bash build.sh`
- **Start Command:** `gunicorn cafe_project.wsgi:application --log-file -`
- **Environment Variables:**
  - `PYTHON_VERSION`: `3.11.9`
  - `DEBUG`: `False`
  - `ALLOWED_HOSTS`: `*`
  - `SECRET_KEY`: `<any-strong-secret-key>`

### 2. Frontend Static Site:
- **Type:** Static Site
- **Root Directory:** `frontend`
- **Build Command:** `npm install && npm run build`
- **Publish Directory:** `dist`
- **Rewrite Rules (SPA):**
  - **Source:** `/*`
  - **Destination:** `/index.html`
  - **Action:** Rewrite
- **Environment Variables:**
  - `VITE_API_BASE`: `https://<your-backend-service-name>.onrender.com/api`

---

## Default Credentials (Pre-seeded Demo)
- **Owner / Admin:** `owner` / `cafe1234`
- **Manager:** `manager` / `cafe1234`
- **Cashier:** `cashier` / `cafe1234`
- **Kitchen:** `kitchen` / `cafe1234`

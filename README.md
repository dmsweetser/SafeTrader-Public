# 🖥️ SafeTrader – Portainer Deployment (GitHub → Docker)


### Step 1: Install Portainer as root

```bash
docker volume create portainer_data
docker run -d \
  -p 9000:9000 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v portainer_data:/data \
  --name portainer \
  portainer/portainer-ce
```

Access: `http://your-server-ip:9000`

---

### Step 2: Create folder structure locally

1. Create directory /home/your_user/safetrader
2. Create directory /home/your_user/safetrader/configs
3. Create directory /home/your_user/safetrader/output

---

### Step 3: Copy config files locally

1. Download config_live.json and config_test.json from the Github repo `https://github.com/dmsweetser/SafeTrader-Public.git`
2. Place them in /home/your_user/safetrader/configs

### Step 4: Add Stack via GitHub

1. In **Portainer**, go to **Stacks** → **Add Stack**
2. **Name**: `safe-trader`
3. **Deploy from**: `Git repository`
4. **Git repository URL**:  
   `https://github.com/dmsweetser/SafeTrader-Public.git`
5. **Branch**: `main` (or your branch)
6. **Path in repository**: (Leave blank — use root)
7. **Environment variables**:
  
  HOST_DATA_DIR=/home/your_user/safetrader
  CONVERSION_ID=
  COINBASE_API_KEY=your_real_api_key
  COINBASE_API_SECRET="your_real_api_secret" **(MUST BE IN DOUBLE QUOTES)**
  ENCRYPTION_KEY=an_encryption_key_to_use_for_your_api_credentials
  DELAY_BETWEEN_ROUNDS=10 **(number in seconds)**
  INSTANCE_NAME=your_container_name_suffix

8. Click **Deploy**

> ✅ Portainer will:
> - Clone the repo
> - Read `docker-compose.yml`
> - Build the image using `Dockerfile`
> - Mount volumes
> - Run `./docker-app.bin`

---
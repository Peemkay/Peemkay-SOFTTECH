# Peemkay SOFTTECH Portfolio Server

## 🚀 Quick Start

### 🖱️ Double-Click Launchers (Windows)
- **START_WEBSITE.bat** - Production server (Port 3000)
- **START_DEVELOPMENT.bat** - Development server (Port 3001)

### 📜 Script Commands

#### Production Server (Built App)
```bash
# Windows (Batch)
scripts\start-server.bat

# Windows (PowerShell)
powershell -ExecutionPolicy Bypass -File scripts\start-server.ps1

# Linux/Mac
./scripts/start-server.sh
```
**URL**: http://localhost:3000

#### Development Server (Hot Reload)
```bash
# Windows
scripts\dev-server.bat

# Linux/Mac
./scripts/dev-server.sh
```
**URL**: http://localhost:3001

### 📦 NPM Commands
```bash
npm run serve    # Build and serve production
npm run start    # Serve built app
npm run dev      # Development server
npm run build    # Build only
```

## 📡 Network Access

Both servers bind to `0.0.0.0` making them accessible from other devices on your network:

- **Local**: http://localhost:[PORT]
- **Network**: http://[YOUR_IP]:[PORT]

To find your IP address:
- **Windows**: `ipconfig`
- **Linux/Mac**: `ip addr` or `ifconfig`

## 🔧 Port Configuration

### Fixed Ports
- **Production**: Port 3000
- **Development**: Port 3001
- **Backup Ports**: 3002, 3003, 3004, 3005

### Port Management
The scripts automatically:
- Check if the port is in use
- Kill existing processes on the port
- Start the server on the configured port

## 📁 Project Structure

```
frontend/
├── scripts/
│   ├── start-server.bat     # Windows production server
│   ├── start-server.sh      # Linux/Mac production server
│   ├── dev-server.bat       # Windows development server
│   └── dev-server.sh        # Linux/Mac development server
├── server-config.json       # Server configuration
├── build/web/              # Built web application
└── SERVER_README.md        # This file
```

## 🛠️ Manual Commands

### Build and Serve
```bash
# Build the app
flutter build web

# Serve on port 3000
python -m http.server 3000 --bind 0.0.0.0 --directory build/web
```

### Development Mode
```bash
# Run with hot reload on port 3001
flutter run -d web-server --web-port=3001 --web-hostname=0.0.0.0
```

## 🔍 Troubleshooting

### Port Already in Use
The scripts handle this automatically, but you can manually check:

**Windows**:
```cmd
netstat -ano | findstr :3000
taskkill /PID [PID] /F
```

**Linux/Mac**:
```bash
lsof -ti:3000 | xargs kill -9
```

### Build Issues
```bash
# Clean and rebuild
flutter clean
flutter pub get
flutter build web
```

## 🌐 Browser Theme Integration

The website includes:
- **Theme Color**: Tomato (#FF6347)
- **Background**: Black (#000000)
- **PWA Support**: Can be installed as an app
- **Responsive Design**: Works on all devices

## 📱 Mobile Testing

Access from mobile devices on the same network:
1. Find your computer's IP address
2. Open browser on mobile device
3. Navigate to http://[YOUR_IP]:3000

## 🔒 Security Notes

- Server binds to all interfaces (0.0.0.0)
- Only accessible within your local network
- No authentication required for local development
- For production deployment, use proper web server (nginx, Apache)

## 📊 Performance

- **Built App**: Optimized, minified, fast loading
- **Dev Server**: Hot reload, debugging enabled
- **Font Optimization**: Tree-shaken, reduced file sizes
- **Asset Optimization**: Compressed images and resources

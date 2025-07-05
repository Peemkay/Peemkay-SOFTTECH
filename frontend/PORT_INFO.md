# 🔌 Port Configuration - Peemkay SOFTTECH Portfolio

## 📍 Fixed Port Assignments

### 🌐 Production Server
- **Port**: `3000`
- **URL**: http://localhost:3000
- **Network**: http://[YOUR_IP]:3000
- **Purpose**: Optimized built application

### 🛠️ Development Server  
- **Port**: `3001`
- **URL**: http://localhost:3001
- **Network**: http://[YOUR_IP]:3001
- **Purpose**: Hot reload development

### 🔄 Backup Ports
- `3002`, `3003`, `3004`, `3005`
- Used if primary ports are unavailable

## 🚀 Quick Access

### Windows Users
1. **Double-click** `START_WEBSITE.bat` for production
2. **Double-click** `START_DEVELOPMENT.bat` for development

### All Platforms
```bash
# Production (Port 3000)
npm run serve

# Development (Port 3001)  
npm run dev
```

## 🔧 Port Management

### Automatic Features
- ✅ Port conflict detection
- ✅ Process termination if port busy
- ✅ Consistent port assignment
- ✅ Network binding (0.0.0.0)
- ✅ Cross-platform compatibility

### Manual Port Check
```bash
# Windows
netstat -ano | findstr :3000

# Linux/Mac
lsof -i :3000
```

## 📱 Mobile Access

1. Find your computer's IP:
   - **Windows**: `ipconfig`
   - **Mac/Linux**: `ifconfig` or `ip addr`

2. On mobile browser, visit:
   - **Production**: http://[YOUR_IP]:3000
   - **Development**: http://[YOUR_IP]:3001

## 🎯 Benefits

- **No More Random Ports**: Always the same URLs
- **Easy Bookmarking**: Consistent addresses
- **Team Collaboration**: Shared port standards
- **Mobile Testing**: Predictable network access
- **Documentation**: Clear port assignments

## 🔒 Security

- **Local Network Only**: Not exposed to internet
- **Development Safe**: No production data risk
- **Firewall Friendly**: Standard port ranges
- **Process Isolation**: Clean startup/shutdown

---

**Remember**: Port 3000 = Production, Port 3001 = Development 🎯


## 3. Installation & Setup {#installation-setup}

### System Requirements

**Minimum Requirements**:
- **OS**: Windows 7+, macOS 10.10+, Linux (Ubuntu 64-bit)
- **RAM**: 2GB (8GB+ recommended for large sites)
- **Java**: Java Runtime Environment (JRE) 8+
- **Storage**: 500MB for installation

**Recommended for Large Crawls** (100k+ pages):
- **RAM**: 16GB+
- **CPU**: Quad-core processor
- **Storage**: 10GB+ free space

### Installation Process

**Step 1: Download**
```
1. Visit: https://www.screamingfrog.co.uk/seo-spider/
2. Choose your operating system
3. Download the installer (Windows .exe, Mac .dmg, Linux .deb)
```

**Step 2: Install Java (if needed)**
```bash
# Check Java version
java -version

# If not installed, download from:
# https://www.java.com/download/
```

**Step 3: Install Screaming Frog**
- **Windows**: Run .exe installer, follow prompts
- **Mac**: Open .dmg, drag to Applications
- **Linux**: 
```bash
sudo dpkg -i screamingfrog-amd64.deb
sudo apt-get install -f
```

**Step 4: Initial Configuration**

After launching, configure these settings:

```
Configuration → Spider → Basic
├── Max URL to Crawl: 500 (free) or Unlimited (paid)
├── Max URI Length: 2048
├── Max External Links: 100
├── Check Images: ✓
├── Check CSS: ✓
└── Check JavaScript: ✓

Configuration → Spider → Limits
├── Max Crawl Depth: 10
├── Max Folder Depth: 10
└── Max Links Per Page: 5000

Configuration → Spider → Advanced
├── Respect Nofollow: ✓
├── Respect Noindex: ✓
├── Crawl Linked XML Sitemaps: ✓
└── Use HTTP/2: ✓
```

### Memory Allocation (Important!)

For crawling large sites, increase memory allocation:

**Windows**:
```
1. Right-click on Screaming Frog shortcut
2. Properties → Shortcut → Target
3. Add: -Xmx8192m (for 8GB RAM)
```

**Mac**:
```bash
# Edit launcher script
nano ~/Applications/ScreamingFrogSEOSpider.app/Contents/Info.plist

# Add under <dict>:
<key>JavaVM</key>
<dict>
    <key>VMOptions</key>
    <string>-Xmx8192m</string>
</dict>
```

**Linux**:
```bash
# Edit launcher
sudo nano /usr/bin/screamingfrogseospider

# Add before java command:
export _JAVA_OPTIONS="-Xmx8192m"
```

### License Activation (Paid Version)

```
1. Help → Enter License
2. Enter license key received via email
3. Restart Screaming Frog
4. Verify: Help → About (shows "Licensed")
```

---

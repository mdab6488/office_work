
### Video Sitemaps

Video sitemaps help Google discover and index your video content.

#### What is a Video Sitemap?

A video sitemap is an XML file that provides metadata about videos on your website.

**Real-Life Example: eCommerce Product Videos**

```xml
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
        xmlns:video="http://www.google.com/schemas/sitemap-video/1.1">
  
  <!-- Example 1: Product Demo Video -->
  <url>
    <loc>https://www.example.com/products/smart-watch-pro</loc>
    <video:video>
      <video:thumbnail_loc>https://www.example.com/thumbs/watch-demo.jpg</video:thumbnail_loc>
      <video:title>Smart Watch Pro - Complete Feature Overview</video:title>
      <video:description>See all the amazing features of our Smart Watch Pro including heart rate monitoring, GPS tracking, and 7-day battery life.</video:description>
      <video:content_loc>https://www.example.com/videos/watch-demo.mp4</video:content_loc>
      <video:player_loc>https://www.example.com/videoplayer.php?video=123</video:player_loc>
      <video:duration>180</video:duration>
      <video:expiration_date>2026-12-31T23:59:59+00:00</video:expiration_date>
      <video:publication_date>2025-01-15T08:00:00+00:00</video:publication_date>
      <video:family_friendly>yes</video:family_friendly>
      <video:tag>smart watch</video:tag>
      <video:tag>fitness tracker</video:tag>
      <video:tag>wearable technology</video:tag>
      <video:category>Electronics</video:category>
      <video:requires_subscription>no</video:requires_subscription>
      <video:uploader info="https://www.example.com/about">Example Tech</video:uploader>
      <video:live>no</video:live>
    </video:video>
  </url>

  <!-- Example 2: Tutorial Video -->
  <url>
    <loc>https://www.example.com/tutorials/how-to-setup-watch</loc>
    <video:video>
      <video:thumbnail_loc>https://www.example.com/thumbs/setup-tutorial.jpg</video:thumbnail_loc>
      <video:title>How to Set Up Your Smart Watch in 5 Minutes</video:title>
      <video:description>Step-by-step guide to setting up your new smart watch, syncing with your phone, and customizing settings.</video:description>
      <video:content_loc>https://www.example.com/videos/setup-tutorial.mp4</video:content_loc>
      <video:duration>300</video:duration>
      <video:publication_date>2025-01-20T10:30:00+00:00</video:publication_date>
      <video:family_friendly>yes</video:family_friendly>
      <video:tag>setup guide</video:tag>
      <video:tag>tutorial</video:tag>
      <video:tag>smart watch</video:tag>
    </video:video>
  </url>

</urlset>
```

#### Required vs. Optional Tags

**Required Tags:**

```xml
<loc>                    <!-- Page URL where video appears -->
<video:thumbnail_loc>    <!-- Thumbnail image URL -->
<video:title>            <!-- Video title (max 100 characters) -->
<video:description>      <!-- Description (max 2048 characters) -->
```

**Content Location (One Required):**

```xml
<video:content_loc>      <!-- Direct video file URL -->
   OR
<video:player_loc>       <!-- Embedded player URL -->
```

**Highly Recommended Tags:**

```xml
<video:duration>         <!-- Length in seconds -->
<video:publication_date> <!-- When video was published -->
<video:expiration_date>  <!-- When to stop showing (if applicable) -->
<video:tag>              <!-- Relevant keywords -->
<video:category>         <!-- Video category -->
<video:family_friendly>  <!-- yes or no -->
```

---

#### Real-Life Implementation

**Example: Recipe Blog**

```xml
<url>
  <loc>https://foodblog.com/recipes/chocolate-cake</loc>
  <video:video>
    <video:thumbnail_loc>https://foodblog.com/images/cake-thumb.jpg</video:thumbnail_loc>
    <video:title>Perfect Chocolate Cake Recipe | Easy Baking</video:title>
    <video:description>Learn how to bake a moist, delicious chocolate cake from scratch. This easy recipe takes only 45 minutes and uses simple ingredients you already have.</video:description>
    <video:content_loc>https://foodblog.com/videos/chocolate-cake.mp4</video:content_loc>
    <video:duration>420</video:duration>
    <video:publication_date>2025-02-01T09:00:00+00:00</video:publication_date>
    <video:rating>4.8</video:rating>
    <video:view_count>15420</video:view_count>
    <video:family_friendly>yes</video:family_friendly>
    <video:tag>chocolate cake</video:tag>
    <video:tag>baking recipe</video:tag>
    <video:tag>dessert</video:tag>
    <video:tag>easy recipe</video:tag>
    <video:category>Food & Cooking</video:category>
    <video:uploader info="https://foodblog.com/about-chef-maria">Chef Maria</video:uploader>
  </video:video>
</url>
```

---

#### How to Create a Video Sitemap

**Method 1: Manual Creation**

1. Create `video-sitemap.xml` file
2. Add all video URLs following schema
3. Upload to root directory (`yoursite.com/video-sitemap.xml`)
4. Submit to Google Search Console

**Method 2: WordPress Plugins**

```
Recommended Plugins:
- Yoast SEO (video sitemap feature)
- Rank Math (video sitemap generator)
- All in One SEO Pack
```

**Method 3: Automated Scripts**

```python
# Python Script Example
import xml.etree.ElementTree as ET
from datetime import datetime

def create_video_sitemap(videos):
    urlset = ET.Element('urlset')
    urlset.set('xmlns', 'http://www.sitemaps.org/schemas/sitemap/0.9')
    urlset.set('xmlns:video', 'http://www.google.com/schemas/sitemap-video/1.1')
    
    for video in videos:
        url = ET.SubElement(urlset, 'url')
        ET.SubElement(url, 'loc').text = video['page_url']
        
        video_elem = ET.SubElement(url, 'video:video')
        ET.SubElement(video_elem, 'video:thumbnail_loc').text = video['thumbnail']
        ET.SubElement(video_elem, 'video:title').text = video['title']
        ET.SubElement(video_elem, 'video:description').text = video['description']
        ET.SubElement(video_elem, 'video:content_loc').text = video['video_url']
        ET.SubElement(video_elem, 'video:duration').text = str(video['duration'])
    
    tree = ET.ElementTree(urlset)
    tree.write('video-sitemap.xml', encoding='UTF-8', xml_declaration=True)

# Example usage
videos = [
    {
        'page_url': 'https://example.com/video1',
        'thumbnail': 'https://example.com/thumb1.jpg',
        'title': 'Video 1 Title',
        'description': 'Video 1 description',
        'video_url': 'https://example.com/vid1.mp4',
        'duration': 180
    }
]

create_video_sitemap(videos)
```

---

#### Submitting Video Sitemap

**Google Search Console:**

```
1. Go to Google Search Console
2. Select your property
3. Navigate to "Sitemaps" (left sidebar)
4. Enter: video-sitemap.xml
5. Click "Submit"
6. Monitor for errors
```

**In robots.txt:**

```
Sitemap: https://www.yoursite.com/video-sitemap.xml
Sitemap: https://www.yoursite.com/sitemap.xml
```

---

#### Common Mistakes

```
❌ Missing required tags
❌ Incorrect date format (use ISO 8601: 2025-01-15T08:00:00+00:00)
❌ Thumbnail URL not working (404 error)
❌ Video duration in wrong format (use seconds, not MM:SS)
❌ Description too short (min 50 characters recommended)
❌ Expired videos still in sitemap
❌ Not updating sitemap when adding new videos
❌ Wrong content_loc (must be actual video file, not page)
```

---

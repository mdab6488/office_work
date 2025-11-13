
## API Integration

### Getting Started with KeywordTool.io API

**Requirements:**
- API subscription ($299-$1,999/month)
- API key (provided after subscription)
- Programming knowledge (or developer)

---

### API Rate Limits

- **5 API requests per minute**
- **7,200 API requests per day**
- Varies by plan (Lite/Basic/Plus)

---

### Example: Get Keyword Suggestions (Google)

#### Using cURL

```bash
curl --request POST 'https://api.keywordtool.io/v2/search/suggestions/google' \
--data-raw '{
  "apikey": "YOUR_API_KEY",
  "keyword": "coffee machine",
  "category": "web",
  "country": "US",
  "language": "en",
  "type": "suggestions",
  "metrics": true,
  "metrics_location": [2840],
  "metrics_language": ["en"],
  "metrics_network": "googlesearchnetwork",
  "metrics_currency": "USD",
  "output": "json"
}'
```

---

#### Using Python

```python
import requests

url = "https://api.keywordtool.io/v2/search/suggestions/google"

data = {
    "apikey": "YOUR_API_KEY",
    "keyword": "coffee machine",
    "category": "web",
    "country": "US",
    "language": "en",
    "type": "suggestions",
    "metrics": "true",
    "metrics_location": [2840],
    "metrics_language": ["en"],
    "metrics_network": "googlesearchnetwork",
    "metrics_currency": "USD",
    "output": "json"
}

response = requests.post(url, json=data)
results = response.json()

for keyword in results['results']:
    print(f"{keyword['string']} - Volume: {keyword['search_volume']}")
```

---

#### Using Node.js

```javascript
const request = require('request');

const options = {
  'method': 'POST',
  'url': 'https://api.keywordtool.io/v2/search/suggestions/google',
  'body': JSON.stringify({
    "apikey": "YOUR_API_KEY",
    "keyword": "coffee machine",
    "category": "web",
    "country": "US",
    "language": "en",
    "type": "suggestions",
    "metrics": true,
    "metrics_location": [2840],
    "metrics_language": ["en"],
    "metrics_network": "googlesearchnetwork",
    "metrics_currency": "USD",
    "output": "json"
  })
};

request(options, function (error, response) {
  if (error) throw new Error(error);
  const data = JSON.parse(response.body);
  console.log(data);
});
```

---

#### Using PHP

```php
<?php
$params = [
    'apikey' => 'YOUR_API_KEY',
    'keyword' => 'coffee machine',
    'category' => 'web',
    'country' => 'US',
    'language' => 'en',
    'type' => 'suggestions',
    'metrics' => true,
    'metrics_location' => [2840],
    'metrics_language' => ['en'],
    'metrics_network' => 'googlesearchnetwork',
    'metrics_currency' => 'USD',
    'output' => 'json'
];

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, 'https://api.keywordtool.io/v2/search/suggestions/google');
curl_setopt($ch, CURLOPT_POST, TRUE);
curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($params));
curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);

$output = curl_exec($ch);
$response = json_decode($output, TRUE);

foreach ($response['results'] as $keyword) {
    echo $keyword['string'] . " - Volume: " . $keyword['search_volume'] . "\n";
}
?>
```

---

### Example: Get Search Volume

```bash
curl --request POST 'https://api.keywordtool.io/v2/search/volume/google' \
--data-raw '{
  "apikey": "YOUR_API_KEY",
  "keyword": ["coffee machine", "espresso machine", "coffee maker"],
  "metrics_location": [2840],
  "metrics_language": ["en"],
  "metrics_network": "googlesearchnetwork",
  "metrics_currency": "USD",
  "output": "json"
}'
```

---

### Google Sheets Integration

You can import keywords directly into Google Sheets:

```
=IMPORTXML("https://api.keywordtool.io/v1/search/google?apikey=YOUR_API_KEY&keyword=coffee+machine&country=us&language=en&output=xml", "//item/@string")
```

---

### API Use Cases

**1. Automated Content Planning**
- Generate keyword ideas daily
- Automatically create content calendar
- Monitor trending keywords

**2. Competitor Monitoring**
- Track competitor topics
- Alert on new keyword opportunities
- Automate gap analysis

**3. Multi-Platform Management**
- Pull keywords from Google, YouTube, Amazon simultaneously
- Unified dashboard
- Compare platform performance

**4. Enterprise Integration**
- Integrate with CMS
- Feed into content workflows
- Connect to analytics platforms

---

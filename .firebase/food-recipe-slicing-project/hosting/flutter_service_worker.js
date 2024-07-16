'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"main.dart.js": "8e2f72f7475d4f3740f28ed1505f2391",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"index.html": "73afc5f9b960320b933b65dfc3d428ce",
"/": "73afc5f9b960320b933b65dfc3d428ce",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"assets/AssetManifest.bin": "e02dd1853753dee8420285765d0d0af6",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/assets/images/Spicy%2520Pasta.jpg": "b1dadd46afb9b403ca64e8139b8c2224",
"assets/assets/images/Fried%2520Rice.jpeg": "476c1a8817e52663ea27b3810ebfd5d3",
"assets/assets/images/Joseph.jpg": "7c33206e0ad9a4507defea2b379af089",
"assets/assets/images/Pancakes.jpg": "c47215e14dfb5ea35dfe7f1883e0e7b4",
"assets/assets/images/Jessica.jpg": "2306bf3137a14e06a0621d80053898af",
"assets/assets/images/Lemonade.jpg": "c6bdeec0fda16a09d9998968886cf29f",
"assets/assets/images/Healthy%2520Salad.jpeg": "adede11b4f037e30e1209b47c972340d",
"assets/assets/images/Emily.jpg": "b125f77c3bc0cc22d51169229f2f0b26",
"assets/assets/images/Andrew.jpg": "ab2f84a1ec3ff7420d67cd90839afac5",
"assets/assets/images/Salami%2520and%2520Cheese%2520Pizza.jpg": "df843c0689498c18bbf327fe1a92ab7a",
"assets/assets/images/Tiramisu.jpg": "283dc64b275cec573953a22ce82154ed",
"assets/assets/images/Chicken%2520Burger.jpg": "b8d84e1834505dd3dc4b39ccc8193073",
"assets/assets/images/Watermelon%2520Juice.jpg": "4e9f5518ddce24789c6d7238efe66eb5",
"assets/assets/icons/Favorite.png": "169c6fc410400ac8827d04ae1bf32265",
"assets/assets/icons/Home.png": "f50c73cce6c4f69907af3092d6614dd0",
"assets/assets/icons/Community.png": "01a2358a9a21cfe6eab5095a2c54c635",
"assets/assets/icons/Profile.png": "2b7f978812fb28dacbde25c1f4831d63",
"assets/assets/icons/Notification.png": "cc68c7328db9dc9faa815604fbee0d6b",
"assets/assets/icons/Time.png": "b1a405db1ffde5da5deed470343499c7",
"assets/assets/icons/Star.png": "f55bb072a84311b0384b8b94dcee5984",
"assets/assets/icons/Search.png": "d604f0f48154f78d7378c8c64a5e283a",
"assets/assets/icons/Categories.png": "2ce9a37813ef07f51d410339460c9f3a",
"assets/assets/icons/BackArrow.png": "d19e3fe9aa775c36e32de3f65b95ef5e",
"assets/fonts/MaterialIcons-Regular.otf": "dc3c2785b27ade5c03fb7c85a34d9fc8",
"assets/NOTICES": "18721340b4d96b25e54188f45645d3ed",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/AssetManifest.bin.json": "8ed3a03fd056ebf7c7a49cf9345a50ad",
"assets/AssetManifest.json": "6f0ffa76024160f59011c2a7fb953324",
"flutter_bootstrap.js": "20882146c0d0b54f11a11accf66fe2d0",
"manifest.json": "56128fc6ec7568b99d6fc24cfa34a218",
"version.json": "389a6e6e6f34312743ca5f36467c84b5",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}

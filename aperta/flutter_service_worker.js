'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "c61f5bee141e215b222f3357502d5317",
"assets/AssetManifest.json": "5408f1c114239fdca7db7bcf60239d8f",
"assets/assets/icons/analyticsicon.png": "37415beb0f8e95c7baca775909ccd5cd",
"assets/assets/icons/bell.png": "77357f81d51f05e3b976c8be0d97dac9",
"assets/assets/icons/calendericon.png": "5c684e80907001bf6e4cae4ba52b9053",
"assets/assets/icons/chaticon.png": "967c6fd4d94cbcf11c2c1fba4e79b875",
"assets/assets/icons/helpicon.png": "273f14b2b2f6aa01ef1a404ec025e8d5",
"assets/assets/icons/homeicon.png": "e93fdc1d65f7158b48a812ba0a12db72",
"assets/assets/icons/inboxicon.png": "064d4a580a9b8867444ea214f02e5d0d",
"assets/assets/icons/invoiceicon.png": "c9974f4b2fcc298394da932b1b36dfd3",
"assets/assets/icons/negotiatingicon.png": "e27f89c5a993ad7e0fddf219c7ac04d2",
"assets/assets/icons/notificationicon.png": "882800fe7eef12c8dddd1f496f88e1bb",
"assets/assets/icons/Path%25206.png": "cceb09568efb2a4e501a81ffba291ef3",
"assets/assets/icons/playerscoutingicon.png": "aea645704e3b5c7d88c72f944a9e3614",
"assets/assets/icons/Rectangle%25204.png": "8f7be1ab5d0eb0294d46196e26d20110",
"assets/assets/icons/searchicon.png": "39b65166b29ce25a0f8aa2bd2ce30ccf",
"assets/assets/icons/settingicon.png": "a16a1b0e4aa641473fbd91850ed3dc7a",
"assets/assets/icons/sorticon.png": "23e50584282a3ff5f1891927d3314106",
"assets/assets/icons/totalplayersicon.png": "c2e3a0b907e29fb4eb513b054c7a29e7",
"assets/assets/icons/usersicon.png": "8a134db9cfd34725ba2ba242722ff2bf",
"assets/assets/images/BG-1.png": "3cb02cde91e91f8dc99dea81e3617c69",
"assets/assets/images/BG.png": "3cb02cde91e91f8dc99dea81e3617c69",
"assets/assets/images/geoscouting.png": "091a5a3f0785dd6053e05d92592da4ba",
"assets/assets/images/graph.png": "52d08a8b3fc24d5f4895537403dbc785",
"assets/assets/images/paginationimage.png": "b8637170bf440fe2e34c967718db062f",
"assets/assets/images/playertimelineimage.png": "8417ea02a91472161aaea384d847ebe7",
"assets/assets/images/totalprofiles.png": "23152a8d8fa60889e68c70d141ae9161",
"assets/assets/images/useravatar.png": "e6263b9c61b047c0b5eedcffd8defa9c",
"assets/assets/langs/ar.json": "2e94f3732704b791043ca40d706a1de9",
"assets/assets/langs/en.json": "7b4eb8595483963bf5d2eb7460b07819",
"assets/assets/langs/tr.json": "f66dfdec237b76d4ced37ea067b75022",
"assets/assets/native_icons/launch_icons/1681810054083.jfif": "666bda1fd851c26a8e642959e16ea6e0",
"assets/assets/native_icons/launch_icons/1683451998888.jfif": "3b69ecdc0d44f2a20729221050ef322c",
"assets/assets/native_icons/launch_icons/dummy_logo.png": "7b87b00ef0f679cba9fe7f47bbd3496a",
"assets/assets/native_icons/splash_icons/dummy_logo.png": "7b87b00ef0f679cba9fe7f47bbd3496a",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "06f511b99d6822a4cfab0937c4dee33d",
"assets/NOTICES": "2d78a1f5e0359ee68c789c7b9f26202b",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"canvaskit/canvaskit.js": "bbf39143dfd758d8d847453b120c8ebb",
"canvaskit/canvaskit.wasm": "42df12e09ecc0d5a4a34a69d7ee44314",
"canvaskit/chromium/canvaskit.js": "96ae916cd2d1b7320fff853ee22aebb0",
"canvaskit/chromium/canvaskit.wasm": "be0e3b33510f5b7b0cc76cc4d3e50048",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/skwasm.wasm": "1a074e8452fe5e0d02b112e22cdcf455",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "6b515e434cea20006b3ef1726d2c8894",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "4801163af867f21a7fb49fa3649ab137",
"/": "4801163af867f21a7fb49fa3649ab137",
"main.dart.js": "93e5ec4ed9a7ed6854ba59f7567b4eb1",
"manifest.json": "f498fb8d3102010fb7e42f61633b7788",
"version.json": "89b494e06dd230ad75e99c710b3575f0"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
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

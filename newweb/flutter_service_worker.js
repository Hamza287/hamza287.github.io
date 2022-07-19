'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "c64fa6797a3bccf6950027fc3e7f001a",
"assets/assets/images/addbuilding.png": "c6a05b131a0df747d69a43b0ebbbe3be",
"assets/assets/images/addcontainer.png": "61b43100dadb7d3ead2d23207a3e936a",
"assets/assets/images/addcontainerimage.png": "68d4b1b47a95ff33c856b3a9bb9b2449",
"assets/assets/images/addstaff.png": "fc730d815efb951f089d3d5575580ab1",
"assets/assets/images/addunit.png": "5f08cb29c7762cf5662e7a61e3fa79ac",
"assets/assets/images/announcmenticon.png": "a1a7c5c32ae74168e54cbe1f2098e582",
"assets/assets/images/Attach.png": "637b3bd0b760debb871ec6f4a5466115",
"assets/assets/images/attachment.png": "adea074e1bc04dd526fb69d514415ae6",
"assets/assets/images/attachmentimage.png": "e84a99086424c46a7b1c124247767c95",
"assets/assets/images/buildingicon.png": "5687ec219400870e273f956fabb3dce3",
"assets/assets/images/buildings.png": "307e2a81138ec329992a59f3576f8213",
"assets/assets/images/cancelicon.png": "537b7e90dfffbc1ae828fb6c582446e9",
"assets/assets/images/community.png": "a505b277613b52ac7e6d50f88caf08ae",
"assets/assets/images/cross.png": "73458de4d52944642133e0ca891912c2",
"assets/assets/images/dashboardicon.png": "b6d0af0a6364025f342d1d214ad340a5",
"assets/assets/images/deleteicon.png": "fdb5e06d35750adf00585ce0b7b0e49e",
"assets/assets/images/drawericon.png": "baa4ebec517cca790989d593f122f411",
"assets/assets/images/editicon.png": "d188b02ef30ee1951774bf991f562261",
"assets/assets/images/filter.png": "5b1a05c515ea7ccabd4bb12a59957881",
"assets/assets/images/icon.png": "f48b4269dabe6adcd2b6e40b20d3cca3",
"assets/assets/images/location.png": "ef88ab9f3d3006db433214896b0da6a4",
"assets/assets/images/Logo.png": "66854e431aad49d1ff0abf8c36a2a6b2",
"assets/assets/images/membericon.png": "c09eeee89ea4c71395118b8af96c58b5",
"assets/assets/images/newrequest.png": "202b143746686315bb99228d2e3aaf34",
"assets/assets/images/notificationicon.png": "717c02f8897037598d910910422e969f",
"assets/assets/images/profile.png": "cc9aec24d870993fbc4c723623c4fc29",
"assets/assets/images/quicklinksicon.png": "a5253d44ea0eedf6d2faf5134e05ddd8",
"assets/assets/images/realestate.png": "438b8bbcfcabd3d3c7ddf83e3cb5d3ee",
"assets/assets/images/reassignicon.png": "8dcd518a24bc968fcb1b3ed90c2c95c9",
"assets/assets/images/redcross.png": "c065902aad0a83b6129799d17fd7dda2",
"assets/assets/images/requesticon.png": "2a33212c340dd191eeebab031435ebb5",
"assets/assets/images/searchicon.png": "70801f073107a612fae9e3c46a3dad23",
"assets/assets/images/settingicon.png": "43e453167cb0f51d3b678fee8b6dc5a4",
"assets/assets/images/sort.png": "64419c3cad910685c9ed5b75ce45e180",
"assets/assets/images/status.png": "7a88853909bdec5cb560caaf68e6c909",
"assets/assets/images/transactionicon.png": "1db1d5761408663e3959e3ef472f76ff",
"assets/assets/images/uniticon.png": "cd0682f3541e3ae1fc63f52bed9803df",
"assets/assets/images/viewicon.png": "6b56ab36432fc88006b111aa5db1bf1e",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/NOTICES": "8623f77164602c9e762fbaf20dfe8a79",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "b484a838de359e3eb445fc8315213471",
"/": "b484a838de359e3eb445fc8315213471",
"main.dart.js": "f85482fc7def7f6f13010820fba1a1e1",
"manifest.json": "3ebbb1a517cb37329432c0f014fdda22",
"version.json": "9912ef3d74609096f55f9aecfcf269ea"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/NOTICES",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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

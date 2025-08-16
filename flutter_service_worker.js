'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "cfd9336ae0cc276f9225d07d4c46c8fc",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"manifest.json": "579c0db4ed36fad65db24906c0c5f507",
"version.json": "bc99938ac22c40fba445abb98fc6f857",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"main.dart.js": "176c348932a3815c25a8b6bd0dfbf85f",
"index.html": "5251a1750ceac7fd0c316e9262e3eda6",
"/": "5251a1750ceac7fd0c316e9262e3eda6",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/NOTICES": "ed590947597016341a42d498d680eb9c",
"assets/AssetManifest.json": "126e22315b6ecb58bf81ec8045af0afe",
"assets/AssetManifest.bin": "be37e1cbbf21980bde5ae0c60a902ddc",
"assets/AssetManifest.bin.json": "43e8454e5e147bbf4f4eee200681e1ec",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/fonts/MaterialIcons-Regular.otf": "c0ad29d56cfe3890223c02da3c6e0448",
"assets/assets/images/enemy/02-Walk/5.png": "8e021bc619844ded6cbdb2eb43297d1b",
"assets/assets/images/enemy/02-Walk/6.png": "9b36304ed874d542a9b3f78b8bdde315",
"assets/assets/images/enemy/02-Walk/4.png": "a2ace4eb1a3b12bdf0812db3978eb57c",
"assets/assets/images/enemy/02-Walk/0.png": "7eba406a550a878ffc1e613c34f447ea",
"assets/assets/images/enemy/02-Walk/7.png": "d90227d727b04d784b0e8fc77e7e4966",
"assets/assets/images/enemy/02-Walk/2.png": "a91d9e425941336fe1f63b3fd1b9301a",
"assets/assets/images/enemy/02-Walk/1.png": "19840d9f21d575a1409b75d63bbe4b5d",
"assets/assets/images/enemy/02-Walk/3.png": "e11aa72b731bbce6fd0024f2913398cc",
"assets/assets/images/enemy/03-Attack/5.png": "96738c51d6a7c5c3686965a65a8a0906",
"assets/assets/images/enemy/03-Attack/6.png": "ee98db7591a52ee1e49820641307c2ba",
"assets/assets/images/enemy/03-Attack/4.png": "8fa1f37b68ddb362c97ff2c8c6953ab9",
"assets/assets/images/enemy/03-Attack/0.png": "7eb28d3462dd289ce95b35118358d343",
"assets/assets/images/enemy/03-Attack/7.png": "651d336fca171dab9f2fc8884dd7cf44",
"assets/assets/images/enemy/03-Attack/2.png": "6fb204e12eaf212cbc3f7ab289521c68",
"assets/assets/images/enemy/03-Attack/1.png": "aaf2e19d3026c3a3cc28ae54f1524e77",
"assets/assets/images/enemy/03-Attack/3.png": "53ffda1ec35509d47a117fde0de1013b",
"assets/assets/images/enemy/01-Idle/5.png": "6d69766f756583e063d1fde09a82ba2c",
"assets/assets/images/enemy/01-Idle/6.png": "42d6e6638d2bedcf2aa99450af8e9c67",
"assets/assets/images/enemy/01-Idle/4.png": "d1627c6e7521e951226c7dbbce5c284f",
"assets/assets/images/enemy/01-Idle/11.png": "164f27b51b7621fc71d4ae5277f3c702",
"assets/assets/images/enemy/01-Idle/9.png": "a347ae880910bea5502761db187dce91",
"assets/assets/images/enemy/01-Idle/8.png": "ed13001dedf129d6600726c62c10be54",
"assets/assets/images/enemy/01-Idle/0.png": "dc31d64f67f66e683c120835cbd79270",
"assets/assets/images/enemy/01-Idle/7.png": "54adbec51345c3b1bb6c925ccf8fdb5c",
"assets/assets/images/enemy/01-Idle/2.png": "de8e3138cc085639accacadec61d096d",
"assets/assets/images/enemy/01-Idle/1.png": "c2126f38678c57085d598dd819cf5104",
"assets/assets/images/enemy/01-Idle/10.png": "52c6f2b04940edebcfd0362c362fdcf2",
"assets/assets/images/enemy/01-Idle/3.png": "16ce89d2975250b280f6636b7bbd309b",
"assets/assets/images/enemy/07-Hurt/5.png": "6b6b765f23ea466c9dbd7bfd9218a7a3",
"assets/assets/images/enemy/07-Hurt/6.png": "03dcb5af0b57df473178c852a463ae24",
"assets/assets/images/enemy/07-Hurt/4.png": "3638225ddd5eb217219687c50421f44f",
"assets/assets/images/enemy/07-Hurt/0.png": "c05dab9dbe4a84b106c87b7df53ebf59",
"assets/assets/images/enemy/07-Hurt/7.png": "c52085bf6ee120848e29f45c5826fbd3",
"assets/assets/images/enemy/07-Hurt/2.png": "996d24815b7a63c9e8b549561600db28",
"assets/assets/images/enemy/07-Hurt/1.png": "af479d070090776214e56d203f4fbbcd",
"assets/assets/images/enemy/07-Hurt/3.png": "24a8bc467ff9de44890b371d35a34e8c",
"assets/assets/images/player_idle_0.png": "fa6221b09be30889b981d81bca6aa6e1",
"assets/assets/images/player/Run%2520(10).png": "f46a76345dcd3de936ceec9cc5d8efad",
"assets/assets/images/player/Jump%2520(1).png": "712fec2f8c2b852baa4cb86f70a39072",
"assets/assets/images/player/Walk%2520(7).png": "a28a5ae7e596e24b4a9f345904cf8cc5",
"assets/assets/images/player/Run%2520(2).png": "ac157c45cfb7083682831beddb423909",
"assets/assets/images/player/Dead%2520(5).png": "24f4d22d3bbe68f48e088e462117691c",
"assets/assets/images/player/Idle%2520(4).png": "fb9446a80fa18bf145230316e87f7c3c",
"assets/assets/images/player/Run%2520(8).png": "c6eb643a8344d62d6eb0dbf98922809b",
"assets/assets/images/player/Dead%2520(2).png": "881c82fe764ab917e79d7a8061f5727c",
"assets/assets/images/player/JumpAttack%2520(2).png": "eb6e4953cfdec6be664382df8f3e743b",
"assets/assets/images/player/JumpAttack%2520(6).png": "bcdd8a6d001e9b9c073d18039c3a6454",
"assets/assets/images/player/JumpAttack%2520(7).png": "e4141bfdacb6241d6c89d055cdf2bd76",
"assets/assets/images/player/Idle%2520(3).png": "e7f9cc1e5b1e0fd87612f05d16e6d217",
"assets/assets/images/player/Idle%2520(8).png": "f3e5ebf99754db641e5e76a7adc9fe2a",
"assets/assets/images/player/Idle%2520(9).png": "1617346d4e75fd49efa5feeeaa984461",
"assets/assets/images/player/Run%2520(5).png": "24219627ad864aaefab9f0291f718181",
"assets/assets/images/player/Walk%2520(1).png": "01650656cb1d95780f5601b4471ccea2",
"assets/assets/images/player/Walk%2520(3).png": "4f4bc531a2f53c4894abb1eec94a2f76",
"assets/assets/images/player/JumpAttack%2520(8).png": "da866f68196aa35b05675b5e8a132e72",
"assets/assets/images/player/Dead%2520(10).png": "413e207aad889d560a98b0333e8bbfc4",
"assets/assets/images/player/Attack%2520(10).png": "f279913ba82fe68114f0f29899fc8d4c",
"assets/assets/images/player/Walk%2520(4).png": "4f0115fb7c4f7e478e02698f7963005b",
"assets/assets/images/player/JumpAttack%2520(1).png": "2f8c8de70dfa0b2909ec508df30b7d05",
"assets/assets/images/player/Dead%2520(7).png": "43d9f7305f62d14f9571b5fc92d23f9b",
"assets/assets/images/player/Idle%2520(5).png": "eca43cfaa82655b5053604b0426cb116",
"assets/assets/images/player/Attack%2520(2).png": "468ed5db5f355e20b5d3e776d12641e3",
"assets/assets/images/player/Walk%2520(6).png": "9950f927284a437dc34d7a0ba3938475",
"assets/assets/images/player/Jump%2520(3).png": "8d95fabd6755a6e563052c56e45e9267",
"assets/assets/images/player/Attack%2520(1).png": "ba023fbf756945488bc367d5e29c8021",
"assets/assets/images/player/Run%2520(7).png": "4470a87a26c8c4a867d1cd29ca4ab2ec",
"assets/assets/images/player/Dead%2520(1).png": "f65ae982798804064a827460cfc0199d",
"assets/assets/images/player/Attack%2520(9).png": "5961f00a538e89fcd0339003529e733a",
"assets/assets/images/player/Attack%2520(4).png": "309759ec3896d3f3d7b38a731d073ba5",
"assets/assets/images/player/Attack%2520(8).png": "653c70fd090e200120e809397b114b1c",
"assets/assets/images/player/Dead%2520(9).png": "024f4145850778e85b62a4c8bac63449",
"assets/assets/images/player/Run%2520(9).png": "af4a257ff3b39431dc5c0a30c489a459",
"assets/assets/images/player/Idle%2520(1).png": "4c9a419fb648d869cf80b104aeb056ea",
"assets/assets/images/player/Jump%2520(10).png": "7ad2af89c4260cd7b0b482874c5e03ae",
"assets/assets/images/player/Run%2520(6).png": "4daf9bce31ee506b6a441079b0cd24bd",
"assets/assets/images/player/Run%2520(1).png": "58c76df231571566ff3f5ee4c8662eb8",
"assets/assets/images/player/Dead%2520(4).png": "01a5835378e1722a06f8d0ee270cbd3e",
"assets/assets/images/player/Walk%2520(10).png": "9ddbdf1d60cf3ca1c4d66991b862ec00",
"assets/assets/images/player/Walk%2520(2).png": "160fc357bba43e89d836cf65f4681351",
"assets/assets/images/player/JumpAttack%2520(5).png": "4a8fcd14c40bafa1cf0c59e8a1618301",
"assets/assets/images/player/Jump%2520(7).png": "f8cfc2350827a1f0469cd6de47a30b7a",
"assets/assets/images/player/Idle%2520(2).png": "76395da06102a7041dbfc9088af09c3f",
"assets/assets/images/player/Jump%2520(5).png": "5e555f5577ba0f42d07a8017b21a9a7a",
"assets/assets/images/player/Attack%2520(6).png": "824461bc8cbcc35c62deab33d9955eae",
"assets/assets/images/player/Attack%2520(3).png": "59582bd868b2e2bfadb12d6c50d06cec",
"assets/assets/images/player/Run%2520(4).png": "f4d2481613d6ebff0daa7406b36bc02e",
"assets/assets/images/player/Jump%2520(4).png": "6188a866b66cb4bf2e3b71a8381840c1",
"assets/assets/images/player/Idle%2520(10).png": "67f29fe1ae5a91fc40004cb112a626d1",
"assets/assets/images/player/Jump%2520(6).png": "02563420bff93fcb3941c791a9203250",
"assets/assets/images/player/Idle%2520(6).png": "46a3dcdd17de735d9726d63ff3aa2b62",
"assets/assets/images/player/Jump%2520(8).png": "23b19c4151a1d42be6e52dc7db5e2d55",
"assets/assets/images/player/Jump%2520(2).png": "6844919476182c63ac34170fa8fa94c7",
"assets/assets/images/player/Run%2520(3).png": "ccf9de0ac2db00cc919812afaa10aaec",
"assets/assets/images/player/JumpAttack%2520(9).png": "88ae0c292c540d93a92a2d9973741fac",
"assets/assets/images/player/Dead%2520(6).png": "0f19642a3b582d9b31b962a79d021d2b",
"assets/assets/images/player/Dead%2520(8).png": "e0ce74d5a159c0db992aa2dc73e95610",
"assets/assets/images/player/Walk%2520(8).png": "28233b38efc557cf8eee26e8370df1c7",
"assets/assets/images/player/Jump%2520(9).png": "a97e23e0df383f7fecdb806c159d970b",
"assets/assets/images/player/Walk%2520(5).png": "9039a199eb232b1b6067305133f4b907",
"assets/assets/images/player/Attack%2520(7).png": "ce9de24cace63719fc3e170c67aefc31",
"assets/assets/images/player/JumpAttack%2520(4).png": "e2a8ee7434244ba66b8d7e9dbc60aeea",
"assets/assets/images/player/JumpAttack%2520(10).png": "65fc84915bbb7ab6437e1164fbd7ab3b",
"assets/assets/images/player/Walk%2520(9).png": "79bcb8c7bbed5b84a57492ac44d9dc9e",
"assets/assets/images/player/Idle%2520(7).png": "893cf48ddfdf979150626ef01721f7ef",
"assets/assets/images/player/JumpAttack%2520(3).png": "d6ae938da96e80cd7e922da4aeae6d81",
"assets/assets/images/player/Dead%2520(3).png": "35f9c4432c567e39b79eec321e6538d5",
"assets/assets/images/player/Attack%2520(5).png": "b1204fc209f7a2ca675d6db1fc5b5637",
"assets/assets/images/bacon%2520mockup.png": "0263943d9f5b1693b20825bfa184e6d1"};
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

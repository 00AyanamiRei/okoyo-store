// ************************************************ 1 TYPE

// const CACHE = "pwabuilder-offline";
//
// importScripts('https://storage.googleapis.com/workbox-cdn/releases/5.1.2/workbox-sw.js');
//
// self.addEventListener("message", (event) => {
//     if (event.data && event.data.type === "SKIP_WAITING") {
//         self.skipWaiting();
//     }
// });
//
// workbox.routing.registerRoute(
//     new RegExp('/*'),
//     new workbox.strategies.StaleWhileRevalidate({
//         cacheName: CACHE
//     })
// );

// ************************************************ 2 TYPE

// const CACHE = "pwabuilder-offline-page";
//
// importScripts('https://storage.googleapis.com/workbox-cdn/releases/5.1.2/workbox-sw.js');
//
// // TODO: replace the following with the correct offline fallback page i.e.: const offlineFallbackPage = "offline.html";
// const offlineFallbackPage = "index.html";
//
// self.addEventListener("message", (event) => {
//     if (event.data && event.data.type === "SKIP_WAITING") {
//         self.skipWaiting();
//     }
// });
//
// self.addEventListener('install', async (event) => {
//     event.waitUntil(
//         caches.open(CACHE)
//             .then((cache) => cache.add(offlineFallbackPage))
//     );
// });
//
// if (workbox.navigationPreload.isSupported()) {
//     workbox.navigationPreload.enable();
// }
//
// workbox.routing.registerRoute(
//     new RegExp('/*'),
//     new workbox.strategies.StaleWhileRevalidate({
//         cacheName: CACHE
//     })
// );
//
// self.addEventListener('fetch', (event) => {
//     if (event.request.mode === 'navigate') {
//         event.respondWith((async () => {
//             try {
//                 const preloadResp = await event.preloadResponse;
//
//                 if (preloadResp) {
//                     return preloadResp;
//                 }
//
//                 const networkResp = await fetch(event.request);
//                 return networkResp;
//             } catch (error) {
//
//                 const cache = await caches.open(CACHE);
//                 const cachedResp = await cache.match(offlineFallbackPage);
//                 return cachedResp;
//             }
//         })());
//     }
// });

// ************************************************ 3 TYPE

// const CACHE_NAME = 'cool-cache';
//
// // Add whichever assets you want to pre-cache here:
// const PRECACHE_ASSETS = [
//     '/',
//     '/index.html',
//     '/static/css/main.css',
//     '/static/js/main.js',
//     '/static/assets/',
//     '/static/',
//     q   ``
// ]
//
// // Listener for the install event - pre-caches our assets list on service worker install.
// self.addEventListener('install', event => {
//     event.waitUntil((async () => {
//         const cache = await caches.open(CACHE_NAME);
//         cache.addAll(PRECACHE_ASSETS);
//     })());
// });
//
// self.addEventListener('activate', event => {
//     event.waitUntil(self.clients.claim());
// });
//
// self.addEventListener('fetch', event => {
//   event.respondWith(
//     caches.match(event.request)
//       .then(response => {
//         // Cache hit - return the response from the cached version
//         if (response) {
//           return response;
//         }
//
//         // Not in cache - return the result from the network
//         return fetch(event.request);
//       }
//     )
//   );
// });


// ************************************************ 4  TYPE

// This is the service worker with the combined offline experience (Offline page + Offline copy of pages)

const CACHE = "pwabuilder-offline-page";

importScripts('https://storage.googleapis.com/workbox-cdn/releases/5.1.2/workbox-sw.js');

// TODO: replace the following with the correct offline fallback page i.e.: const offlineFallbackPage = "offline.html";
const offlineFallbackPage = "/";

self.addEventListener("message", (event) => {
    if (event.data && event.data.type === "SKIP_WAITING") {
        self.skipWaiting();
    }
});

self.addEventListener('install', async (event) => {
    event.waitUntil(
        caches.open(CACHE)
            .then((cache) => cache.add(offlineFallbackPage))
    );
});

if (workbox.navigationPreload.isSupported()) {
    workbox.navigationPreload.enable();
}

workbox.routing.registerRoute(
    new RegExp('/*'),
    new workbox.strategies.StaleWhileRevalidate({
        cacheName: CACHE
    })
);

self.addEventListener('fetch', (event) => {
    if (event.request.mode === 'navigate') {
        event.respondWith((async () => {
            try {
                const preloadResp = await event.preloadResponse;

                if (preloadResp) {
                    return preloadResp;
                }

                const networkResp = await fetch(event.request);
                return networkResp;
            } catch (error) {

                const cache = await caches.open(CACHE);
                const cachedResp = await cache.match(offlineFallbackPage);
                return cachedResp;
            }
        })());
    }
});
const CACHE = 'nammath-as-shell-v4';
const ASSETS = ['/','/index.html','/styles.css','/app.js','/data.js','/notes.js','/library.js','/math.js','/vendor/katex.mjs','/vendor/katex.css','/config.js','/icon.svg','/manifest.webmanifest'];
self.addEventListener('install', event => { event.waitUntil(caches.open(CACHE).then(c => c.addAll(ASSETS))); self.skipWaiting(); });
self.addEventListener('activate', event => {event.waitUntil(caches.keys().then(keys => Promise.all(keys.filter(k => k !== CACHE).map(k => caches.delete(k)))));self.clients.claim(); });
self.addEventListener('fetch', event => {
 if (event.request.method !== 'GET' || new URL(event.request.url).origin !== self.location.origin) return;
 // Only cache static app shell. Never cache paid memos, auth responses, or API requests.
 const path = new URL(event.request.url).pathname;
 if (!ASSETS.includes(path)) return;
 event.respondWith(caches.match(event.request).then(cached => cached || fetch(event.request).then(res => {if(res.ok){const clone=res.clone();caches.open(CACHE).then(c=>c.put(event.request,clone));}return res;})));
});

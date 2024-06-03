self.addEventListener('install', function(event) {
    event.waitUntil(
        caches.open('my-cache').then(function(cache) {
            return cache.addAll([
                '/',
                '/index.html',
                '/shopping-cart.html',
                '/registration.html',
                '/checkout.html',
                '/category.html',
                '/user/user-main.html',
                '/user/user-edit.html',
                '/product/search_product.html',
                '/product/products_by_category.html',
                '/product/_fragment.html',
                '/product/product-page.html',
                '/error/404.html',
                '/user/orders.html',
                '/blocks/breadcrumbs.html',
                '/blocks/login.html',
                '/blocks/fragments.html',
                '/admin-panel.html',
                '/admin/vendor/vendors.html',
                '/admin/vendor/vendor_form.html',
                '/admin/product/products.html',
                '/admin/product/product_form.html',
                '/admin/product/product_overview.html',
                '/admin/product/products_description.html',
                '/admin/user/users.html',
                '/admin/user/user_form.html',
                '/admin/orders/orders.html',
                '/admin/orders/order_form.html',
                '/admin/order_basket/order_baskets.html',
                '/admin/category/categories.html',
                '/admin/category/category_form.html',
                '/static/css/main.css',
                '/static/js/main.js'
            ]);
        })
    );
});

self.addEventListener('fetch', function(event) {
    event.respondWith(
        caches.match(event.request).then(function(response) {
            return response || fetch(event.request);
        })
    );
});


self.addEventListener('activate', function(event) {
    var cacheWhitelist = ['my-cache'];

    event.waitUntil(
        caches.keys().then(function(cacheNames) {
            return Promise.all(
                cacheNames.map(function(cacheName) {
                    if (cacheWhitelist.indexOf(cacheName) === -1) {
                        return caches.delete(cacheName);
                    }
                })
            );
        })
    );
});
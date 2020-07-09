import Vue from "vue";
import Router from "vue-router";

Vue.use(Router);

export default new Router({
  routes: [
    {
      path: "/",
      component: () => import("@/views/Home")
    },
    {
      name: "settings",
      path: "/settings",
      component: () => import("@/views/Settings")
    },
    {
      name: "about",
      path: "/about",
      component: () => import("@/views/About")
    },
    {
      name: "products",
      path: "/products",
      component: () => import("@/views/Products")
    },
    {
      name: "analytics",
      path: "/analytics",
      component: () => import("@/views/Analytics")
    },
    {
      name: "test",
      path: "/test",
      component: () => import("@/views/Test")
    }
    // Handle child routes with a default, by giving the name to the
    // child.
    // SO: https://github.com/vuejs/vue-router/issues/777
  ]
});

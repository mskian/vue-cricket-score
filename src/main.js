import { createApp } from "vue";
import App from "./App.vue";
import "./registerServiceWorker";
import router from "./router";
import Buefy from "buefy";
import "buefy/dist/buefy.min.css";

createApp(App).use(router, Buefy).mount("#app");

import Vue from 'vue'
import App from './App.vue'
import { Laue } from 'laue';

Vue.use(Laue)
Vue.config.productionTip = false

new Vue({
  render: h => h(App),
}).$mount('#app')

import Vue from 'vue';
import VueMeteorTracker from 'vue-meteor-tracker';
Vue.use(VueMeteorTracker);

import App from './App.vue';
import './main.html';

Meteor.startup(() => {
  new Vue({
    el: '#app',
    ...App,
  });
});
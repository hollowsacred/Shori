<template>
  <v-app>
    <BaseHeader/>
    <v-main>
      <router-view />
    </v-main>
    <BaseFooter/>
  </v-app>
</template>

<script>
import BaseHeader from './components/BaseHeader.vue';
import BaseFooter from './components/BaseFooter.vue';

export default {
  name: "App",

 setup() {
  return {

  }
 },
components: {
  BaseHeader,
  BaseFooter,
}

};
</script>

import './assets/main.css'
import './index.scss'
import { createApp } from 'vue'
import store from './vuex.js'
import { createPinia } from 'pinia'

import App from './App.vue'
import router from './router'
import './axios.js'

const app = createApp(App)

app.use(createPinia())
app.use(router)
.use(store)

app.mount('#app')

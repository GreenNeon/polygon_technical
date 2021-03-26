require('./bootstrap')

// Import modules...
import Vue from 'vue'
import { App as InertiaApp, plugin as InertiaPlugin } from '@inertiajs/inertia-vue'
import PortalVue from 'portal-vue'
import vuetify from './Plugins/vuetify'
// Lodash
import _get from 'lodash/get'

Vue.use(InertiaPlugin)
Vue.use(PortalVue)

moment.locale("id")

const app = document.getElementById('app')

Vue.mixin({
    methods: {
        route,
        _get
    }
})

const VueApp = new Vue({
    vuetify,
    render: (h) =>
        h(InertiaApp, {
            props: {
                initialPage: JSON.parse(app.dataset.page),
                resolveComponent: (name) => require(`./Pages/${name}`).default,
            },
        }),
})

VueApp.$mount(app)

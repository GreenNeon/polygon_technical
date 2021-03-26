<template>
    <div>
        <transition leave-active-class="transition ease-in duration-1000" leave-class="opacity-100" leave-to-class="opacity-0">
            <div v-show="on" class="text-sm font-semibold" :class="{'text-green-500':(type==='info'), 'text-red-500':(type==='error'), 'text-gray-800':(type==='display') }">
                <slot />
            </div>
        </transition>
    </div>
</template>

<script>
    export default {
        props: {on: {}, type: {default: 'info'}},
    }
</script>

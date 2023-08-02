<template>
  <footer class="bg-slate-50 dark:bg-[#141A22]">
    <div class="mx-auto max-w-7xl overflow-hidden px-6 py-10 sm:py-14 lg:px-8">
      <nav class="-mb-6 columns-2 sm:flex sm:justify-center sm:space-x-12" aria-label="Footer">
        <div v-for="item in navigation" :key="item.name" class="pb-6">
          <a :href="item.href" class="text-sm leading-6 hover:text-primary-dark dark:hover:text-light-light">{{ item.name }}</a>
        </div>
      </nav>
      <p class="mt-10 text-sm text-center leading-5">&copy; {{ new Date().getFullYear() }} LaraVellous</p>
    </div>
  </footer>
</template>

<script setup>
import { defineComponent, h } from 'vue'
import {usePage} from '@inertiajs/vue3';

const showLogin = usePage().props.showLogin

let navigation = [
  { name: 'About', href: '#' },
  { name: 'Accessibility', href: '#' }
]

navigation = [
    ...navigation,
    ...(!showLogin ? [{
            name: 'Login',
            href: route('login'),
        }]
        : []),
]
</script>

<template>
  <Disclosure as="nav" class="shadow sm:shadow-none" v-slot="{ open }">
    <div class="mx-auto max-w-7xl px-4 sm:px-6">
      <div class="flex h-16 justify-between">

        <!-- Logo and links -->
        <div class="flex gap-x-5">
          <div class="flex flex-shrink-0 items-center">
            <TextLogo class="h-6 dark:hidden" />
            <TextLogoForDarkMode class="h-6 hidden dark:block" />

          </div>
          <div class="hidden sm:ml-6 sm:flex sm:space-x-8">
            <Link v-for="item in navigation" :href="item.href" :class="[item.current ? 'border-primary text-primary dark:text-primary-light': 'dark:text-zinc-300 text-zinc-500 hover:text-zinc-600  dark:hover:text-zinc-400 hover:border-gray-300', 'inline-flex items-center border-b-2 border-transparent px-1 pt-1 text-sm font-medium']">
              {{ item.name}}
            </Link>
          </div>
        </div>

        <!-- Right side (desktop) -->
        <div class="hidden sm:ml-6 sm:flex sm:items-center">

          <div v-if="showLogin" class="flex gap-x-3">
            <SecondaryButton v-if="canRegister" :isLink="true" :href="route('register')">Register</SecondaryButton>
            <PrimaryButton :isLink="true" :href="route('login')">Login</PrimaryButton>
          </div>
        </div>

        <!-- Burger -->
        <div class="-mr-2 flex items-center sm:hidden">
          <!-- Mobile menu button -->
          <DisclosureButton class="inline-flex items-center justify-center rounded-md p-2 text-gray-400 hover:bg-gray-100 hover:text-gray-500 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-accent">
            <span class="sr-only">Open main menu</span>
            <Bars3Icon v-if="!open" class="block h-6 w-6" aria-hidden="true" />
            <XMarkIcon v-else class="block h-6 w-6" aria-hidden="true" />
          </DisclosureButton>
        </div>
      </div>
    </div>

    <!-- Mobile menu -->
    <DisclosurePanel class="sm:hidden">
      <div class="space-y-1 pb-3 pt-2">
        <DisclosureButton v-for="item in navigation" :key="item.name" as="a" :href="item.href" :class="[item.current ? 'bg-gray-100 text-primary-dark dark:text-primary-light dark:bg-inherit dark:hover:bg-inherit' : 'hover:bg-light-light', 'block rounded-md py-2 px-3 text-base font-medium dark:hover:bg-dark dark:text-light']" :aria-current="item.current ? 'page' : undefined">{{ item.name }}</DisclosureButton>

      </div>
      <div v-if="showLogin" class="border-t border-gray-200 space-y-1 pb-3 pt-4">
        <DisclosureButton v-if="canRegister" as="a" :href="route('register')" class="
        hover:bg-light-light block rounded-md py-2 px-3 text-base font-medium dark:hover:bg-dark dark:text-light">
            Register
        </DisclosureButton>
        <DisclosureButton as="a" :href="route('login')" class="
        hover:bg-light-light block rounded-md py-2 px-3 text-base font-medium dark:hover:bg-dark dark:text-light">
            Login
        </DisclosureButton>
      </div>
    </DisclosurePanel>

  </Disclosure>
</template>

<script setup>
import { Disclosure, DisclosureButton, DisclosurePanel, Menu, MenuButton, MenuItem, MenuItems } from '@headlessui/vue'
import { Bars3Icon, BellIcon, XMarkIcon } from '@heroicons/vue/24/outline'
import TextLogo from "@/Components/logos/TextLogo.vue"
import TextLogoForDarkMode from "@/Components/logos/TextLogoForDarkMode.vue"
import PrimaryButton from "@/Components/buttons/PrimaryButton.vue"
import SecondaryButton from "@/Components/buttons/SecondaryButton.vue"
import {usePage} from '@inertiajs/vue3';

// Check we enabled registration
const canRegister = usePage().props.canRegister
const showLogin = usePage().props.showLogin

let navigation = [
    { name: 'Overview', href: "#", current: route().current('index') },
    { name: 'Features', href: "#", current: route().current('features') },
    { name: 'Pricing', href: "#", current: route().current('pricing') },

]

</script>

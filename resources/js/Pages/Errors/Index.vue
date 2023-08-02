<template>
    <Head :title="title" />
    <main class="grid  dark:bg-bgc-dark h-screen place-items-center py-24 px-6 sm:py-32 lg:px-8">
        <div class="py-8 px-4 mx-auto max-w-screen-xl lg:py-16 lg:px-6">
            <div class="mx-auto max-w-screen-sm text-center">
                <h1 class="mb-4 text-7xl tracking-tight font-extrabold lg:text-9xl text-primary dark:text-primary">{{status}}</h1>
                <p class="mb-4 text-3xl tracking-tight font-bold text-gray-900 md:text-4xl dark:text-light">{{title}}</p>
                <p class="mb-4 text-lg font-light text-txt-dark dark:text-txt">{{description}}</p>

                <div class="mt-10">
                  <SecondaryButton :isLink="true" href="/" >Home</SecondaryButton>
                </div>

            </div>
        </div>
    </main>
</template>

<script setup>
import { computed } from 'vue'
import SecondaryButton from "@/Components/buttons/SecondaryButton.vue";
import { Head } from '@inertiajs/vue3';

const props = defineProps({ status: Number })

const title = computed(() => {
  return {
    503: 'Service Unavailable',
    500: 'Server Error',
    404: 'Page Not Found',
    403: 'Forbidden',
  }[props.status]
})

const description = computed(() => {
  return {
    503: 'Sorry, we are doing some maintenance. Please check back soon.',
    500: 'Whoops, something went wrong on our servers.',
    404: 'Sorry, the page you are looking for could not be found.',
    403: 'Sorry, you are forbidden from accessing this page.',
  }[props.status]
})
</script>

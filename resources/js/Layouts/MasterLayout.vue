<script setup>
import { Head } from '@inertiajs/vue3';
import Banner from '@/Components/Banner.vue';

defineProps({
    title: String,
});

</script>

<template>
    <Head :title="title" />

    <Banner />

    <div class="body bg-bgc text-txt-dark dark:bg-bgc-dark dark:text-txt">
        <slot />
    </div>
</template>

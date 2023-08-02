<script setup>
import { Head, Link } from '@inertiajs/vue3';
import GuestLayout from "@/Layouts/GuestLayout.vue";
import PageContainer from "@/Components/_util/PageContainer.vue";

defineProps({
    canLogin: Boolean,
    canRegister: Boolean,
    laravelVersion: String,
    phpVersion: String,
});
</script>

<template>
    <GuestLayout title="Home">
        <PageContainer>
            <h1 class="h1"> H1 </h1>
            <h2 class="h2"> H2 </h2>
            <h3 class="h3"> H3</h3>

            <h4 class="h4"> H4</h4>
            <h5 class="h5"> H5</h5>
            <h6 class="h6"> H6</h6>
        </PageContainer>
    </GuestLayout>
</template>


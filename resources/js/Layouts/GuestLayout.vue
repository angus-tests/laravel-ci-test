<script setup>
import GuestNavbar from "@/Components/_includes/GuestNavbar.vue";
import GuestFooter from "@/Components/_includes/GuestFooter.vue";
import MasterLayout from "./MasterLayout.vue";

defineProps({
    title: String,
});

</script>

<template>
    <MasterLayout :title="title">
        <!-- Navigation -->
        <GuestNavbar />

        <!-- Page Content -->
        <main class="content">
            <slot />
        </main>

        <!-- Footer -->
        <GuestFooter />
    </MasterLayout>
</template>
